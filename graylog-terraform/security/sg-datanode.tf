resource "aws_security_group" "datanode" {
  name   = "datanode-sg"
  vpc_id = aws_vpc.graylog.id

  ingress {
    from_port   = 9001
    to_port     = 9001
    protocol    = "tcp"
    security_groups = [aws_security_group.graylog.id]
  }

  egress { from_port=0 to_port=0 protocol="-1" cidr_blocks=["0.0.0.0/0"] }
}
