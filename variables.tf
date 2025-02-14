variable "region" {
  type        = string
  default     = "us-east-1"
  description = "AWS Region"
}

variable "account" {
  type        = string
  description = "AWS Account Number"
  validation {
    condition     = can(regex("\\d{12}", var.account))
    error_message = "The AWS account number is incorrect."
  }
}

variable "vpc_name" {
  description = "Name of the your VPC"
  type        = string
}

variable "vpc_cidr_block" {
  default = "10.0.0.0/20"
  validation {
    condition     = can(regex("((10)(.([2]([0-5][0-5]|[01234][6-9])|[1][0-9][0-9]|[1-9][0-9]|[0-9])){3})/([2][0-9]|3[012])", var.vpc_cidr_block))
    error_message = "The CIDR block needs to be in the format 10.x.x.x/20-32."
  }
}

variable "public_subnet_cidrs" {
  default = {
    "public-1" = "10.0.1.0/24"
    "public-2" = "10.0.2.0/24"
    "public-3" = "10.0.3.0/24"
  }
}

variable "private_subnet_cidrs" {
  default = {
    "private-1" = "10.0.4.0/24"
    "private-2" = "10.0.5.0/24"
    "private-3" = "10.0.6.0/24"
  }
}

variable "availability_zones" {
  default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "instance_name" {
  type = string
}

variable "instance_type" {
  default = "t2.micro"
}

variable "security_groups" {
  description = "Map of security groups and their rules"
  type = map(object({
    name        = string
    description = string
    rules = map(object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = optional(list(string), []) # Optional if using source_sg
      source_sg   = optional(string)           # For allowing another SG dynamically
    }))
  }))
}


# RDS Variables

variable "db_username" {
  default = "admin"
}

variable "db_password" {
  description = "Database password"
  type        = string
  sensitive   = true
}

variable "db_identifier" {
  description = "The identifier for the RDS instance"
  type        = string
}

variable "db_engine" {
  description = "Database engine (e.g., mysql, postgres)"
  type        = string
}

variable "db_engine_version" {
  description = "Database engine version"
  type        = string
}

variable "db_instance_class" {
  description = "Instance type for the RDS instance (e.g., db.t3.micro, db.t3.small)"
  type        = string
}

variable "db_allocated_storage" {
  description = "Allocated storage size in GB"
  type        = number
}

variable "multi_az" {
  description = "Enable Multi-AZ deployment"
  type        = bool
  default     = false
}