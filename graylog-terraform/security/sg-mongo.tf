resource "aws_security_group" "mongo" {
  name   = "mongo-sg"
  vpc_id = aws_vpc.graylog.id

  # allow replica set communication
  ingress {
    from_port   = 27017
    to_port     = 27017
    protocol    = "tcp"
    security_groups = [
      aws_security_group.graylog.id,
      aws_security_group.datanode.id
    ]
  }

  egress { from_port = 0 to_port = 0 protocol = "-1" cidr_blocks = ["0.0.0.0/0"] }
}
