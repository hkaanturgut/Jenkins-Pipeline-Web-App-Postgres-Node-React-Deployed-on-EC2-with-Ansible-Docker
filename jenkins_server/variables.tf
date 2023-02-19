# #IAM ROLE
# variable "assume_role_policy" {
#   type = map(any)
  
# }

variable "managed_policy_arns" {
  type = list(string)
  
}

#Ec2 Instance
variable "myami" {
 type = string
}
variable "instance_type" {
  type = string
}

variable "mykey" {
  type = string
}
variable "ec2_tag" {
  type = map(string)
}

# Security Group
variable "sg_tag" {
  type = map(string)
}

variable "user" {
  default = "kaan"  
}

#Ingress 1
variable "from_port1" {
  type = number
}
variable "protocol1" {
  type = string 
}
variable "to_port1" {
  type = number 
}
variable "cidr_blocks1" {
  type = list(string) 
}

#Ingress 2
variable "from_port2" {
  type = number
}
variable "protocol2" {
  type = string 
}
variable "to_port2" {
  type = number 
}
variable "cidr_blocks2" {
  type = list(string) 
}

#Ingress 3
variable "from_port3" {
  type = number
}
variable "protocol3" {
  type = string 
}
variable "to_port3" {
  type = number 
}
variable "cidr_blocks3" {
  type = list(string) 
}

#Egress 
variable "egress_from_port" {
  type = number
}
variable "egress_protocol" {
  type = number 
}
variable "egress_to_port" {
  type = number 
}
variable "egress_cidr_blocks" {
  type = list(string) 
}