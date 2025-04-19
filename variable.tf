variable region {
  type        = string
  default = "us-east-2"
}
variable "instance_type" {}
variable "application" {}
variable "environment" {}
############## tags
variable os {
  type        = string
  default = "Ubuntu"
}
variable launched_by {
  type        = string
  default = "USER"
}
############## end tags