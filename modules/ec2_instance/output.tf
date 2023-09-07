# output "ec2_instance_ids" {
#   value = aws_instance.ec2_instance
# }

# Output EC2 Instance IDs
# This output block extracts the instance IDs of the EC2 instances created by the ec2_instance module
# and returns them as a list of strings, which can be used by other modules.

output "ec2_instance_ids" {
  value = [for instance in aws_instance.ec2_instance : instance.id]
}
