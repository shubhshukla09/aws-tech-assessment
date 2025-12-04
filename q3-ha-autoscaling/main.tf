# Get VPC and Subnet IDs from Task 1
# Note: These should be replaced with actual values or use data sources
variable "vpc_id" {
  description = "VPC ID from Task 1"
  type        = string
  default     = ""
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs from Task 1"
  type        = list(string)
  default     = []
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs from Task 1"
  type        = list(string)
  default     = []
}

# Security Group for ALB
resource "aws_security_group" "alb_sg" {
  name        = "Shubh_Shukla_ALB_SG"
  description = "Security group for Application Load Balancer"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Shubh_Shukla_ALB_SG"
  }
}

# Security Group for EC2 instances
resource "aws_security_group" "web_sg" {
  name        = "Shubh_Shukla_Web_SG"
  description = "Security group for web servers"
  vpc_id      = var.vpc_id

  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.alb_sg.id]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # In production, restrict this to your IP
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Shubh_Shukla_Web_SG"
  }
}

# Application Load Balancer
resource "aws_lb" "web_alb" {
  name               = "ShubhShuklaWebALB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = var.public_subnet_ids

  enable_deletion_protection = false

  tags = {
    Name = "Shubh_Shukla_Web_ALB"
  }
}

# Target Group
resource "aws_lb_target_group" "web_tg" {
  name     = "ShubhShuklaWebTG"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    enabled             = true
    interval            = 30
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    healthy_threshold   = 3
    unhealthy_threshold = 3
    matcher             = "200-399"
  }

  tags = {
    Name = "Shubh_Shukla_Web_TG"
  }
}

# ALB Listener
resource "aws_lb_listener" "web_http" {
  load_balancer_arn = aws_lb.web_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.web_tg.arn
  }
}

# Launch Template
resource "aws_launch_template" "web_lt" {
  name_prefix   = "ShubhShuklaWebLT"
  image_id      = "ami-0c7217cdde317cfec"  # Amazon Linux 2 AMI (us-east-1)
  instance_type = "t2.micro"
  key_name      = "your-key-pair-name"     # Replace with your key pair name

  network_interfaces {
    associate_public_ip_address = false
    security_groups             = [aws_security_group.web_sg.id]
  }

  user_data = base64encode(<<-EOF
              #!/bin/bash
              yum update -y
              amazon-linux-extras install nginx1 -y
              systemctl start nginx
              systemctl enable nginx
              
              # Create a simple index.html
              echo '<!DOCTYPE html><html><head><title>Shubh Shukla - HA Website</title></head><body><h1>High Availability Website</h1><p>This is a highly available website!</p></body></html>' > /usr/share/nginx/html/index.html
              systemctl restart nginx
              EOF
  )

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "Shubh_Shukla_Web_Server"
    }
  }
}

# Auto Scaling Group
resource "aws_autoscaling_group" "web_asg" {
  name_prefix          = "ShubhShuklaWebASG"
  vpc_zone_identifier = var.private_subnet_ids
  desired_capacity    = 2
  max_size           = 3
  min_size           = 1

  target_group_arns = [aws_lb_target_group.web_tg.arn]

  launch_template {
    id      = aws_launch_template.web_lt.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "Shubh_Shukla_Web_Instance"
    propagate_at_launch = true
  }

  lifecycle {
    create_before_destroy = true
  }
}
