 /* Demo VPC varaibles file. Make sure you replace key_name value
 with your key name which  you have in given aws_region.
*/
variable "aws_region" {
  default = "ap-south-1"
}
variable "vpc_cidr" {
  default = "172.0.0.0/24"
}
variable "subnets_cidr" {
  type    = list(string)
  default = ["172.0.0.0/25", "172.0.0.128/25"]
}
variable "availability_zones" {
  type    = list(string)
  default = ["ap-south-1a", "ap-south-1b"]
}
variable "ubuntuami" {
  default = "ami-0f5ee92e2d63afc18"
}
variable "redhatami" {
  default = "ami-008b85aa3ff5c1b02"
}
variable "key_name" {
  default = "devops"
}
