
resource "aws_iam_role" "aws_access" {
  name = "awsrole-${var.user}"
  assume_role_policy = file("policy.json")
  managed_policy_arns = var.managed_policy_arns

}

resource "aws_iam_instance_profile" "ec2-profile" {
  name = "jenkins-project-profile-${var.user}"
  role = aws_iam_role.aws_access.name
}

resource "aws_instance" "tf-jenkins-server" {
  ami = var.myami
  instance_type = var.instance_type
  key_name      = var.mykey
  vpc_security_group_ids = [aws_security_group.tf-jenkins-sec-gr.id]
  iam_instance_profile = aws_iam_instance_profile.ec2-profile.name
  tags = var.ec2_tag
  user_data = file("jenkins.sh")

}

resource "aws_security_group" "tf-jenkins-sec-gr" {
  name = "jenkins-server-sec-gr-208-${var.user}"
  tags = var.sg_tag
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

  egress {
    from_port   = var.egress_from_port
    protocol    = var.egress_protocol
    to_port     = var.egress_to_port
    cidr_blocks = var.egress_cidr_blocks
  }
}

