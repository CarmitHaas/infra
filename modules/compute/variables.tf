variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "subnet_ids" {
  description = "IDs of the subnets"
  type        = list(string)
}

variable "node_group_name" {
  description = "Name of the EKS node group"
  type        = string
}

variable "instance_types" {
  description = "List of instance types for the EKS nodes"
  type        = list(string)
  default     = ["t3a.medium"]
}

variable "desired_size" {
  description = "Desired number of worker nodes"
  type        = number
  default     = 2
}

variable "max_size" {
  description = "Maximum number of worker nodes"
  type        = number
  default     = 3
}

variable "min_size" {
  description = "Minimum number of worker nodes"
  type        = number
  default     = 1
}

variable "owner" {
  description = "Owner tag value"
  type        = string
}

variable "bootcamp" {
  description = "Bootcamp tag value"
  type        = string
}

variable "expiration_date" {
  description = "Expiration date tag value"
  type        = string
}

