resource "aws_key_pair" "oualid_ssh" {
  key_name   = var.public_ssh_key_name
  public_key = var.public_ssh_key
}


resource "aws_security_group" "oualid_sg" {

  name        = var.aws_sg_name #"oualid_sg"
  description = var.aws_sg_description

  ingress = [{
    description      = var.aws_sg_ingress_desc
    cidr_blocks      = var.aws_sg_cidr_blocks
    from_port        = var.aws_sg_ingress_port
    to_port          = var.aws_sg_ingress_port
    protocol         = var.aws_sg_ingress_protocol
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    security_groups  = []
    self             = false
    
  }]

  eegress = [{
    description      = "Allow all"
    cidr_blocks      = ["0.0.0.0/0"]
    from_port        = 0
    to_port          = 0
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "-1"
    security_groups  = []
    self             = false
  }]
}

resource "aws_instance" "test_vm" {

  ami             = var.aws_ec2_ami
  instance_type   = var.aws_instance_type
  key_name        = aws_key_pair.oualid_ssh.key_name
  security_groups = [aws_security_group.oualid_sg.name]
  tags = {
    Name = var.aws_instance_name
  }

}
