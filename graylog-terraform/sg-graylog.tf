resource "aws_security_group" "graylog" {
  name   = "graylog-sg"
  vpc_id = aws_vpc.graylog.id

  # API & Web
  ingress {
    from_port   = 9000
    to_port     = 9000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # REST API
  ingress {
    from_port   = 9200
    to_port     = 9200
    protocol    = "tcp"
    security_groups = [aws_security_group.datanode.id]
  }

  egress { from_port=0 to_port=0 protocol="-1" cidr_blocks=["0.0.0.0/0"] }
}
