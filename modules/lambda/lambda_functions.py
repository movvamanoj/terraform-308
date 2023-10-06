import boto3
import requests
import json
import os
import time

def lambda_handler(event, context):
    s3_client = boto3.client('s3')
    sns_client = boto3.client('sns')
    sns_topic_arn = os.environ.get('SNS_TOPIC_ARN')
    slack_webhook_url = os.environ.get('SLACK_WEBHOOK_URL')
    email_endpoint = os.environ.get('EMAIL_ENDPOINT')  # Add this line to retrieve the email endpoint

    # Add the code to measure network latency
    start_time = time.time()

    if not sns_topic_arn:
        # Retrieve the ARN of the SNS topic created using Terraform
        response = sns_client.list_topics()
        sns_topics = response['Topics']
        
        for topic in sns_topics:
            if 'file_upload_failure_topic' in topic['TopicArn']:
                sns_topic_arn = topic['TopicArn']
                break
   
    # Additional code to send network latency metric to CloudWatch
    s3_client = boto3.client('s3')
    cloudwatch_client = boto3.client('cloudwatch')
    cloudwatch_client.put_metric_data(
        Namespace  = 'Custom/S3Upload',
        MetricData = [
            {
                'MetricName': 'NetworkLatency',
                'Dimensions': [
                    {
                        'Name': 'AgencyName',
                        'Value': agency_name
                    }
                ],
                'Value': network_latency,
                'Unit': 'Seconds'
            }
        ]
    )
    
    agency_files = {}  # Dictionary to store the files for each agency
    for record in event['Records']:
        bucket_name = record['s3']['bucket']['name']
        object_key = record['s3']['object']['key']
        file_size = record['s3']['object']['size']
        agency_name = object_key.split('/')[0]  # Assuming agency name is the first part of the object key
        
        # Additional code to measure network latency
        end_time = time.time()
        network_latency = end_time - start_time
        
        if agency_name not in agency_files:
            agency_files[agency_name] = []  # Initialize the list for the agency if not present
        
        agency_files[agency_name].append(object_key)  # Add the file to the corresponding agency's list

        # Check if the batch size for the agency is reached
        if len(agency_files[agency_name]) >= 1 and len(agency_files[agency_name]) <= 24:
            # Process the files as one batch for the agency
            process_files_in_batch(agency_name, agency_files[agency_name], bucket_name, sns_client, sns_topic_arn, slack_webhook_url, email_endpoint)
            
            # Clear the batch for the agency
            agency_files[agency_name] = []

def process_files_in_batch(agency_name, files, bucket_name, sns_client, sns_topic_arn, slack_webhook_url, email_endpoint):
    # Perform processing for the files in the batch
    # Example: Iterate over files and perform validations or custom processing
    
    for file in files:
        file_type = file.split('.')[-1].lower()
        
        # File type validation
        if file_type not in ['csv', 'xlsx', 'json']:
            send_alert(sns_client, sns_topic_arn, "Invalid file type", f"File {file} in agency {agency_name} has an invalid file type.", email_endpoint, slack_webhook_url)
        
        # File size validation
        file_size_kb = file_size / 1024

        if file_size_kb > 50000 or file_size_kb < 20:
            send_alert(sns_client, sns_topic_arn, "Invalid file size", f"File {file} in agency {agency_name} has an invalid file size.", email_endpoint, slack_webhook_url)
                
def send_alert(sns_client, topic_arn, subject, message, email_endpoint, slack_webhook_url):
    sns_client.publish(
        TopicArn=topic_arn,
        Subject=subject,
        Message=message
    )
    
    send_alert_slack(slack_webhook_url, message)

    if email_endpoint:
        send_alert_email(email_endpoint, subject, message)
    
def send_alert_slack(webhook_url, message):
    # Replace the dummy webhook URL with the actual Slack webhook URL
    slack_webhook_url = "https://slack-webhook-url.com"
    
    payload = {
        'text': message
    }
    headers = {'Content-Type': 'application/json'}
    
    response = requests.post(slack_webhook_url, data=json.dumps(payload), headers=headers)
    
    if response.status_code != 200:
        print(f"Failed to send Slack alert. Error: {response.text}")
        
def send_alert_email(email_endpoint, subject, message):
    # Replace the dummy email endpoint with the actual email sending logic
    print(f"Sending email to {email_endpoint} with subject: {subject} and message: {message}")
    email_endpoint = "movvamanoj@gmail.com"