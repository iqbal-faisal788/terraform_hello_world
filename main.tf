    # Create ec2 instances
resource "aws_instance" "web1" {
    ami           = "ami-0cff7528ff583bf9a"
    instance_type = "t2.micro"
    availability_zone = "us-east-1a"
    vpc_security_group_ids      = [aws_security_group.public_sg.id]
    subnet_id                   = aws_subnet.public_1.id
    associate_public_ip_address = true
    user_data = <<-EOF
            #!/bin/bash
            yum update -y
            yum install httpd -y
            systemctl start httpd
            systemctl enable httpd
            echo "<html><body><h1>Hello World</h1></body></html>" > /var/www/html/index.html
            EOF

    tags = {
        Name = "web1_instance"
    }
}
resource "aws_instance" "web2" {
    ami           = "ami-0cff7528ff583bf9a"
    instance_type = "t2.micro"
    availability_zone = "us-east-1b"
    vpc_security_group_ids      = [aws_security_group.public_sg.id]
    subnet_id                   = aws_subnet.public_2.id
    associate_public_ip_address = true
    user_data = <<-EOF
            #!/bin/bash
            yum update -y
            yum install httpd -y
            systemctl start httpd
            systemctl enable httpd
            echo "<html><body><h1>Hello Mars</h1></body></html>" > /var/www/html/index.html
            EOF

    tags = {
        Name = "web2_instance"
    }
}