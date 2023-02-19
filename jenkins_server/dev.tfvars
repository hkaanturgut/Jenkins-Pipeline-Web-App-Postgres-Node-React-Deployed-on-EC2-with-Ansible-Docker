
managed_policy_arns= ["arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryFullAccess", "arn:aws:iam::aws:policy/AmazonEC2FullAccess", "arn:aws:iam::aws:policy/IAMFullAccess", "arn:aws:iam::aws:policy/AmazonS3FullAccess"]

#EC2 Instance
myami= "ami-026b57f3c383c2eec"
instance_type= "t3a.medium"
mykey= "kaan-project" 
ec2_tag= {
    Name = "Jenkins_Server"
  }

  #Security Group
  sg_tag={
    Name = "jenkins-server-sec-gr-208"
  }

 #Ingress 1
from_port1= 80
protocol1= "tcp"
to_port1= 80
cidr_blocks1= ["0.0.0.0/0"]

#Ingress 2
from_port2= 22
protocol2= "tcp"
to_port2= 22
cidr_blocks2= ["0.0.0.0/0"]

#Ingress 3
from_port3= 8080
protocol3= "tcp"
to_port3= 8080
cidr_blocks3= ["0.0.0.0/0"]

#Egress 
egress_from_port= 0
egress_protocol= -1
egress_to_port= 0
egress_cidr_blocks= ["0.0.0.0/0"]