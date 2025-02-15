# application load balancer creation
module "app_alb" {
  source = "terraform-aws-modules/alb/aws"
  
  internal = true
  name    = "${var.project_name}-${var.environment}-app-alb" # expense-dev-app-alb
  vpc_id  = local.vpc_id
  subnets = local.private_subnet_id
  security_groups = [data.aws_ssm_parameter.app_alb_sg_id.value]
  enable_deletion_protection = false
  create_security_group = false
  tags = merge (
    var.common_tags,
    var.app_alb_tags
  )
}

# HTTP listener rules
resource "aws_lb_listener" "http" {
  load_balancer_arn = module.app_alb.arn # arn : amazon resource name
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/html"
      message_body = "<h1>Hello, I am from application ALB</h1>"
      status_code  = "200"
    }
  }
}

# route53 record creation, here input is app_alb's DNS name
module "records" {
  source  = "terraform-aws-modules/route53/aws//modules/records"

  zone_name = var.zone_name

  records = [
    {
      name    = "${var.backend_tags.component}.app-${var.environment}" # *.app-dev.ukom81s.online
      type    = "A"
      alias   = {
        name    = module.app_alb.dns_name
        zone_id = module.app_alb.zone_id
      }
      allow_overwrite = true
    }
  ]
}