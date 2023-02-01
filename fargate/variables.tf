variable "access_key" {
  type = string
}

variable "secret_key" {
  type = string
}

variable "region" {
  type    = string
  default = "ap-northeast-2"
}

variable "tag_name" {
  type    = string
  default = "service"
}

variable "container_port" {
  type    = number
  default = 80
}


variable "host_port" {
  type    = number
  default = 80
}

variable "tpl_path" {
  type = string
}

variable "bucket_name" {
  type = string
}

variable "app_name" {
  type = string
}

variable "aws_certificate_arn" {
  type = string
}

variable "environment" {
  type = string
  default = "dev"
}

variable "domain" {
  type = string
}

variable "sub_domain" {
  type = string
}

variable "route53_zone_id" {
   type = string
}

variable "identifiers" {
   type = string
}