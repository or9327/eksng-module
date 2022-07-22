variable "name-cluster" {
  type        = string  
}
variable "name-node-group" {
  type        = string  
}
variable "tags-node-group" {
  type        = map(string)
}
variable "id-subnet-1" {
  type        = string  
}
variable "id-subnet-2" {
  type        = string  
}
variable "name-launch-template" {
  type        = string  
}
variable "name-sshkey" {
  type        = string  
}
variable "id-cluster-security-group" {
  type        = string  
}
variable "name-node-root-volume-device" {
  type        = string  
}
variable "size-node-volume" {
  type        = number  
}
variable "id-scg-vpc-ssh" {
  type        = string  
}
variable "name-role-node-group" {
  type        = string  
}
variable "name-scg-node-group" {
  type        = string  
}
variable "id-vpc" {
  type        = string  
}
variable "userdata-node-group" {
  type        = string  
}
variable "node-ami-id" {
  type        = string  
}
variable "node-capacity-type" {
  type        = string  
}
variable "node-instance-types" {
  type        = list(string)  
}
variable "min-node-count" {
  type        = number  
}
variable "max-node-count" {
  type        = number  
}