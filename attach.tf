# Attach the Nginx server to the target group
resource "aws_lb_target_group_attachment" "tg_attach_nginx" {
    target_group_arn = aws_lb_target_group.tf_group.arn
    target_id        = aws_instance.prime_server.id
    port             = 80
}
# Attach the Apache server to the target group
resource "aws_lb_target_group_attachment" "tg_attach_apache" {
    target_group_arn = aws_lb_target_group.tf_group.arn
    target_id        = aws_instance.sec_server.id
    port             = 80
}