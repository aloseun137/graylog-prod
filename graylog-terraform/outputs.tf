output "graylog_alb_dns" {
  value = aws_lb.graylog_alb.dns_name
}

output "bastion_public_ip" {
  value = aws_instance.bastion.public_ip
}
