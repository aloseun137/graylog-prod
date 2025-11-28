resource "aws_instance" "mongo" {
  count         = 3
  ami           = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type
  subnet_id     = aws_subnet.private[count.index % 2].id
  key_name      = var.key_name
  security_groups = [
    aws_security_group.mongo.id,
    aws_security_group.bastion.id
  ]

  tags = { Name = "mongo-${count.index}" }
}
