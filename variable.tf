variable "california_cidr" {
  description = "CIDR California"
  type        = string
}

#variable "public_subnet" {
#  description = "Variable de la subred publica"
#  type        = string
#}

#variable "private_subnet" {
#  description = "Variable de la subred privada"
#  type        = string
#}

#variable "ambiente_dev" {
#  description = "Ambiente donde se ejecuta"
#  type        = string
#}

variable "subnets" {
  description = "Lista de subnets"
  type        = list(string)
}

variable "tags" {
  description = "Tags del proyecto"
  type        = map(string)
}

variable "sg_ingress_cidr" {
  description = "CIDR for ingress trafic"
  type        = string
}

variable "ec2_specs" {
    description = "Parametros de la instancia"
    type = map(string)
}

variable "tags_ec2" {
  description = "Tags de la EC2"
  type        = map(string)
  
}