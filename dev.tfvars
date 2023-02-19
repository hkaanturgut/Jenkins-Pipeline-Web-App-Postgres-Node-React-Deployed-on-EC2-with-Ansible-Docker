tags= ["postgresql", "nodejs", "react"]
user="kaan"
#EC2 Managed Nodes
ami= "ami-0f095f89ae15be883"
instance_type= "t2.micro"
key_name= "kaan-project"
# Security Group
sg_name= "project208-sec-gr-adunc"
sg_tags= {
    Name = "project208-sec-gr-adunc"
  }

#Ingress 1
from_port1= 22
protocol1= "tcp"
to_port1= 22
cidr_blocks1= ["0.0.0.0/0"]

#Ingress 2
from_port2= 5000
protocol2= "tcp"
to_port2= 5000
cidr_blocks2= ["0.0.0.0/0"]

#Ingress 3
from_port3= 3000
protocol3= "tcp"
to_port3= 3000
cidr_blocks3= ["0.0.0.0/0"]

#Ingress 4
from_port4= 5432
protocol4= "tcp"
to_port4= 5432
cidr_blocks4= ["0.0.0.0/0"]

#Egress 
egress_from_port= 0
egress_protocol= -1
egress_to_port= 0
egress_cidr_blocks= ["0.0.0.0/0"]