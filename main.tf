resource "aws_instance" "managed_nodes" {
  ami = var.ami
  count = 3
  instance_type = var.instance_type
  key_name = var.key_name
  vpc_security_group_ids = [aws_security_group.tf-sec-gr.id]
  iam_instance_profile = "jenkins-project-profile-${var.user}"
  tags = {
    Name = "ansible_${element(var.tags, count.index )}"
    stack = "ansible_project-1"
    environment = "development_1"
  }
}

resource "aws_security_group" "tf-sec-gr" {
  name = var.sg_name
  tags = var.sg_tags

  ingress {
    from_port   = var.from_port1
    protocol    = var.protocol1
    to_port     = var.to_port1
    cidr_blocks = var.cidr_blocks1
  }
  ingress {
     from_port   = var.from_port2
    protocol    = var.protocol2
    to_port     = var.to_port2
    cidr_blocks = var.cidr_blocks2
  }
  ingress {
    from_port   = var.from_port3
    protocol    = var.protocol3
    to_port     = var.to_port3
    cidr_blocks = var.cidr_blocks3
  }
  ingress {
    from_port   = var.from_port4
    protocol    = var.protocol4
    to_port     = var.to_port4
    cidr_blocks = var.cidr_blocks4
  }

  egress {
    from_port   = var.egress_from_port
    protocol    = var.egress_protocol
    to_port     = var.egress_to_port
    cidr_blocks = var.egress_cidr_blocks
  }
}

