output "alb_dns_name" {
  description = "The DNS name of the load balancer"
  value       = aws_lb.web_alb.dns_name
}

output "alb_zone_id" {
  description = "The zone_id of the load balancer"
  value       = aws_lb.web_alb.zone_id
}

output "alb_arn" {
  description = "The ARN of the load balancer"
  value       = aws_lb.web_alb.arn
}

output "target_group_arn" {
  description = "The ARN of the target group"
  value       = aws_lb_target_group.web_tg.arn
}

output "asg_name" {
  description = "The name of the Auto Scaling Group"
  value       = aws_autoscaling_group.web_asg.name
}

output "launch_template_id" {
  description = "The ID of the launch template"
  value       = aws_launch_template.web_lt.id
}

output "website_url" {
  description = "URL to access the website"
  value       = "http://${aws_lb.web_alb.dns_name}"
}
