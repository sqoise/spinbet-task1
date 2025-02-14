region       = "us-east-1"
account      = "123456789012"

vpc_name       = "project1-vpc"
vpc_cidr_block = "10.1.0.0/20"

public_subnet_cidrs = {
  "public-a" = "10.1.1.0/24"
  "public-b" = "10.1.2.0/24"
  "public-c" = "10.1.3.0/24"
}

private_subnet_cidrs = {
  "private-a" = "10.1.4.0/24"
  "private-b" = "10.1.5.0/24"
  "private-c" = "10.1.6.0/24"
}

availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c"]

ami_id         = "ami-12345678"
instance_name  = "web-app-inst"
instance_type  = "t3.micro"

db_username = "admin"

# db_password should be set as an environment variable during CI/CD (not hardcoded in tfvars)
# export TF_VAR_db_password="encrypted"

db_identifier       = "mydb-dev"
db_engine          = "mysql"
db_engine_version  = "8.0"
db_instance_class  = "db.t3.micro"
db_allocated_storage = 20

multi_az = true


security_groups = {
  "web_sg" = {
    name = "web-app-sg"
    description = "app security group"
    rules = {
      "https" = {
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      }
      "http" = {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      }
      "ssh" = {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        # VPN IP
        cidr_blocks = ["89.223.21.75/32"]
      }

    }
  }
  "db_sg" = {
    name = "db-sg"
    description = "db security group"
    rules = {
      "postgres" = {
        from_port   = 5432
        to_port     = 5432
        protocol    = "tcp"
        source_sg   = "web-app-sg" # Reference Web SG dynamically
      }
    }
  }
}
