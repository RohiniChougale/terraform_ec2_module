resource "aws_instance" "web" {
  count = "2"
  ami  = "ami-04893cdb768d0f9ee"
  instance_type = "t2.micro"
  subnet_id     = "subnet-09afd9287225e7a02"
  key_name      = "linux-demo"
  tags = {
    Name = "Terraform_Demo"
  }
  user_data              = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl start httpd.service
              systemctl enable httpd.service
              echo "Welcome to Terraform Demo!!!, I am $(hostname -f) hosted by Terraform" > /var/www/html/index.html
              EOF
}
