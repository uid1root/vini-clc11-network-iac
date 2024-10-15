variable "vpc_name" {
  type        = string
  default     = "vpc_vinicius_iac_clc_11_teste"
  description = "Nome da sua VPC"
}

variable "vpc_range" {
  type    = string
  default = "10.0.0.0/16"
}

variable "public_subnet_1a_range" {
  type    = string
  default = "10.0.10.0/24"
}

variable "public_subnet_1c_range" {
  type    = string
  default = "10.0.20.0/24"
}

variable "private_subnet_1a_range" {
  type    = string
  default = "10.0.100.0/24"
}

variable "private_subnet_1c_range" {
  type    = string
  default = "10.0.200.0/24"
}
