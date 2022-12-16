resource "aws_key_pair" "demo_ssh" {
  key_name   = var.public_ssh_key_name
  public_key = var.public_ssh_key
}


resource "aws_security_group" "demo_sg" {

  name        = var.aws_sg_name #"demo_sg"
  description = var.aws_sg_description

  ingress = [{
    description      = var.aws_ingress_description
    from_port        = var.aws_ingress_from_port
    to_port          = var.aws_ingress_to_port
    protocol         = var.aws_ingress_protocol
    cidr_blocks      = var.aws_ingress_cidr4_blocks
    ipv6_cidr_blocks = var.aws_ingress_cidr6_blocks
    prefix_list_ids  = var.aws_ingress_prefix_list_ids
    security_groups  = var.aws_ingress_sg
    self             = var.aws_ingress_self
  }]

  egress = [{
    description      = var.aws_egress_description
    from_port        = var.aws_egress_from_port
    to_port          = var.aws_egress_to_port
    protocol         = var.aws_egress_protocol
    cidr_blocks      = var.aws_egress_cidr4_blocks
    ipv6_cidr_blocks = var.aws_egress_cidr6_blocks
    prefix_list_ids  = var.aws_egress_prefix_list_ids
    security_groups  = var.aws_egress_sg
    self             = var.aws_egress_self
  }]
}

resource "aws_instance" "my_vm" {

  ami             = var.aws_ec2_ami
  instance_type   = var.aws_instance_type
  key_name        = aws_key_pair.demo_ssh.key_name
  security_groups = [aws_security_group.demo_sg.name]
  tags = {
    Name = var.aws_instance_name
  }

}
