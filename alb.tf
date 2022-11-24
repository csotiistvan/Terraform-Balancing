# Application load balancer

resource "aws_lb" "terraform-alb" {
  name            = "terraform-alb"
  internal           = false
  load_balancer_type = "application"
  enable_http2 = false
  security_groups = [aws_security_group.generic_server.id]
  subnets         = [
        "subnet-027f7c79055623b47",
        "subnet-0439b2e8286d570a6",
        "subnet-0905bf7456c3c7de5"
    ]
  tags = {
    Name = "Terraform_ALB_Isti"
    Email = "csoti.istvan.ifj@gmail.com"
    Comment = "Made with Terraform"
  }
}

# Target group for load balancer

resource "aws_lb_target_group" "tf_group" {
  name     = "terraform-alb-target"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.aws_vpc_id
  stickiness {
    type = "lb_cookie"
    enabled = false
  }
  health_check {
    port = 80
    healthy_threshold = 2
    unhealthy_threshold = 2
    timeout = 2
    interval = 5
  }
}

# HTTP listener for the load balancer

resource "aws_lb_listener" "tf_listener_http" {
  load_balancer_arn = "${aws_lb.terraform-alb.arn}"
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = "${aws_lb_target_group.tf_group.arn}"
    type             = "forward"
  }
}