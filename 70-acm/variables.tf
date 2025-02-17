variable "project_name" {
  default = "expense"
}

variable "environment" {
  default = "dev"
}

variable "common_tags" {
  default = {
    Project     = "expense"
    Terraform   = "true"
    Environment = "dev"
  }
}

variable "zone_name" {
  default = "ukom81s.online"
}

variable "zone_id" {
  default = "Z1011040F14N5MVPIIUV"
}