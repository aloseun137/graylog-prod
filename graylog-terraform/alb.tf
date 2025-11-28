resource "aws_lb" "graylog_alb" {
  name               = "graylog-alb"
  internal           = false
  load_balancer_type = "application"
  subnets            = aws_subnet.public[*].id
}

resource "aws_lb_target_group" "graylog_tg" {
  name     = "graylog-tg"
  port     = 9000
  protocol = "HTTP"
  vpc_id   = aws_vpc.graylog.id
}

resource "aws_lb_listener" "graylog_listener" {
  load_balancer_arn = aws_lb.graylog_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.graylog_tg.arn
  }
}

resource "aws_lb_target_group_attachment" "graylog_attach" {
  count            = 3
  target_group_arn = aws_lb_target_group.graylog_tg.arn
  target_id        = aws_instance.graylog_servers[count.index].id
  port             = 9000
}
