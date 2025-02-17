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

variable "app_alb_tags" {
  default = {
    component = "app_alb"
  }
}

variable "web_alb_tags" {
  default = {
    component = "web_alb"
  }
}

variable "zone_name" {
  default = "ukom81s.online"
}

variable "backend_tags" {
  default = {
    component = "backend"
  }
}