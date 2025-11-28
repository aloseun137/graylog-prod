resource "aws_security_group" "internal" {
  name        = "graylog-internal-sg"
  description = "Internal communication between Graylog server, datanode, mongo"
  vpc_id      = aws_vpc.graylog.id

  ingress {
    description = "Allow internal communication"
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    self        = true
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
