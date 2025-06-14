resource "aws_instance" "web" {
  count         = var.instance_count
  ami           = "ami-0e56583ebfdfc098f"
  instance_type = var.instance_type
  subnet_id     = var.public_subnet_ids[count.index]
  security_groups = [var.web_security_group]

  key_name = var.key_name

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd
            EOF
}
