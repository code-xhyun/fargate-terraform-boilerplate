
resource "aws_route53_record" "sub" {
  zone_id = var.route53_zone_id
  name = "${var.sub_domain}.${var.domain}"
  type    = "A"
  
  alias {
    name                   = aws_lb.alb.dns_name
    zone_id                = aws_lb.alb.zone_id
    evaluate_target_health = true
  }
}