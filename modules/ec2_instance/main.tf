resource "aws_instance" "ec2_instance" {
  count         = var.instance_count
  ami           = var.ec2_ami 
  instance_type = var.instance_type 
  # vpc_id        = var.vpc_id
  subnet_id     = var.public_subnet[0]
  key_name      = var.key_name
  security_groups = var.security_groups
  user_data = <<-EOF
              #!/bin/bash
              set -e
              # Download and execute the shell script from GitHub
              curl -sL https://raw.githubusercontent.com/movvamanoj/git-jenkins/movvamanoj-patch-1/app.sh -o app.sh
              sudo chmod +x app.sh  # Give execute permissions to the downloaded script
              ./app.sh  # Execute the script
              EOF

  tags = {
    Name = "EC2Instance-${count.index + 1}"
  }
}

