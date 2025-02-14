variable "vpc_name" {}

variable "vpc_cidr" {}

variable "public_subnet_cidrs" {
  description = "List of CIDR blocks for public subnets"
  type        = map(string)
}

variable "private_subnet_cidrs" {
  description = "List of CIDR blocks for private subnets"
  type        = map(string)
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
}

variable "security_groups" {
  type = map(object({
    name        = string
    description = string
    rules = map(object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = optional(list(string), []) # Optional for SG-to-SG rules
      source_sg   = optional(string)           # Name of the source SG (if referencing another SG)
    }))
  }))
}