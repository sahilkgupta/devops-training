resource "aws_instance" "web" {
  count         = var.instance_count
  ami           = "ami-0e56583ebfdfc098f" # Amazon Linux 2
  instance_type = var.instance_type
  subnet_id     = element(var.public_subnets, count.index)
  security_groups = [var.web_security_group]
 
  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd
            EOF
}