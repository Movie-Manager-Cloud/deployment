# resource "aws_lb_target_group" "eks_target_group" {
#   name        = "eks-target-group"
#   port        = 80
#   protocol    = "HTTP"
#   vpc_id      = aws_vpc.devops.id
#   target_type = "ip"

#   health_check {
#     path                = "/"
#     interval            = 30
#     timeout             = 5
#     healthy_threshold   = 2
#     unhealthy_threshold = 2
#     matcher             = "200"
#   }

#   tags = {
#     Name = "eks-target-group"
#   }
# }

# resource "aws_lb" "eks_lb" {
#   name               = "eks-load-balancer"
#   internal           = false
#   load_balancer_type = "application"
#   security_groups    = [aws_security_group.devops-cluster.id]
#   subnets            = [aws_subnet.devops1.id, aws_subnet.devops2.id]

#   tags = {
#     Name = "eks-load-balancer"
#   }
# }

# resource "aws_lb_listener" "eks_listener" {
#   load_balancer_arn = aws_lb.eks_lb.arn
#   port              = 80
#   protocol          = "HTTP"

#   default_action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.eks_target_group.arn
#   }
#   depends_on = [aws_lb_target_group.eks_target_group, aws_lb.eks_lb]
# }


# /!\ The load balancer is creating with the nginx controller helm chart /!\ So no need anymore to create it here