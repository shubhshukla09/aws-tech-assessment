provider "aws" {
  region = "us-east-1"
}

# Get the default VPC
resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

# Security Group for EC2
resource "aws_security_group" "web_sg" {
  name        = "Shubh_Shukla_Web_SG"
  description = "Security group for web server"
  vpc_id      = aws_default_vpc.default.id

  # Allow HTTP from anywhere
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow SSH only from your IP (replace with your IP or use a variable)
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${var.your_ip}/32"]
  }

  # Allow all outbound traffic
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

# EC2 Instance
resource "aws_instance" "web_server" {
  ami                    = "ami-0c7217cdde317cfec"  # Amazon Linux 2 AMI (us-east-1)
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  key_name               = var.key_name  # Make sure to create this key pair in AWS Console
  user_data              = <<-EOF
              #!/bin/bash
              yum update -y
              amazon-linux-extras install nginx1 -y
              systemctl start nginx
              systemctl enable nginx
              
              # Create a simple resume HTML
              cat > /usr/share/nginx/html/index.html <<EOL
              <!DOCTYPE html>
              <html>
              <head>
                  <title>Shubh Shukla - Resume</title>
                  <style>
                      body { font-family: Arial, sans-serif; line-height: 1.6; margin: 0; padding: 20px; }
                      .container { max-width: 800px; margin: 0 auto; }
                      header { text-align: center; margin-bottom: 20px; }
                      h1 { color: #2c3e50; }
                      h2 { color: #3498db; border-bottom: 2px solid #3498db; padding-bottom: 5px; }
                      .section { margin-bottom: 30px; }
                      .job { margin-bottom: 20px; }
                      .date { color: #7f8c8d; font-style: italic; }
                  </style>
              </head>
              <body>
                  <div class="container">
                      <header>
                          <h1>Shubh Shukla</h1>
                          <p>Email: your.email@example.com | Phone: (123) 456-7890 | LinkedIn: linkedin.com/in/shubhshukla</p>
                      </header>
                      
                      <div class="section">
                          <h2>Professional Summary</h2>
                          <p>Cloud Engineer with expertise in AWS, Terraform, and DevOps practices. Passionate about building scalable and reliable cloud infrastructure.</p>
                      </div>
                      
                      <div class="section">
                          <h2>Experience</h2>
                          <div class="job">
                              <h3>Cloud Engineer Intern</h3>
                              <p class="date">June 2025 - Present</p>
                              <p>Company Name - City, Country</p>
                              <ul>
                                  <li>Designed and implemented cloud infrastructure using AWS services</li>
                                  <li>Automated deployment processes using Terraform and CI/CD pipelines</li>
                                  <li>Monitored and optimized cloud resources for cost and performance</li>
                              </ul>
                          </div>
                      </div>
                      
                      <div class="section">
                          <h2>Education</h2>
                          <h3>Bachelor of Technology in Computer Science</h3>
                          <p class="date">2022 - 2026</p>
                          <p>University Name - City, Country</p>
                      </div>
                      
                      <div class="section">
                          <h2>Skills</h2>
                          <ul>
                              <li>AWS (EC2, S3, VPC, IAM, Lambda, CloudFormation)</li>
                              <li>Terraform, Docker, Kubernetes</li>
                              <li>Python, Bash, Linux</li>
                              <li>CI/CD, Git, GitHub Actions</li>
                          </ul>
                      </div>
                  </div>
              </body>
              </html>
              EOL
              
              # Restart nginx to apply changes
              systemctl restart nginx
              EOF

  tags = {
    Name = "Shubh_Shukla_Resume_Website"
  }
}

# Output the public IP to access the website
output "website_url" {
  value = "http://${aws_instance.web_server.public_ip}"
}
