variable "tags" {
  type = list(string)
}
variable "user" {
  type = string
}

#EC2 Managed Nodes
variable "ami" {
    type = string 
}
variable "instance_type" {
    type = string 
}
variable "key_name" {
    type = string 
}

# Security Group
variable "sg_name" {
    type = string  
}
variable "sg_tags" {
    type = map(string)  
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

#Ingress 4
variable "from_port4" {
  type = number
}
variable "protocol4" {
  type = string 
}
variable "to_port4" {
  type = number 
}
variable "cidr_blocks4" {
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