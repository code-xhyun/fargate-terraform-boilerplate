resource "aws_lb" "alb" {
  name = "${var.environment}-alb"
  subnets            = aws_subnet.cluster[*].id
  load_balancer_type = "application"
  security_groups    = [aws_security_group.lb.id]

  # access_logs {
  #   bucket  = aws_s3_bucket.bucket.id
  #   prefix  = "alb"
  #   enabled = true
  # }

  tags = {
    Environment = var.environment
    Application = var.app_name
  }
}

resource "aws_lb_listener" "https_forward" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 443
  protocol          = "HTTPS"
  certificate_arn   =  var.aws_certificate_arn
  ssl_policy        = "ELBSecurityPolicy-2016-08"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.service-alb-tg.arn
  }
}


resource "aws_lb_listener" "http_forward" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}

resource "aws_lb_target_group" "service-alb-tg" {
  name        = "service-alb-tg"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.cluster_vpc.id
  target_type = "ip"

  health_check {
    enabled             = true
    interval            = 300
    path                = "/health"
    timeout             = 60
    matcher             = "200"
    healthy_threshold   = 5
    unhealthy_threshold = 5
  }

  lifecycle {
    create_before_destroy = true
  }
}