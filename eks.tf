resource "aws_eks_cluster" "devops-eks" {
 name = "devops-cluster"
 role_arn = aws_iam_role.eks-iam-role.arn

 vpc_config {
  security_group_ids = ["${aws_security_group.devops-cluster.id}"]
  subnet_ids = [aws_subnet.devops1.id, aws_subnet.devops2.id]
 
  
 }

 depends_on = [
  aws_iam_role.eks-iam-role,
 ]

 tags = {
    Name = "terraform-eks-devops"
  }

}

resource "aws_eks_node_group" "worker-node-group" {
  cluster_name  = aws_eks_cluster.devops-eks.name
  node_group_name = "devops-workernodes"
  node_role_arn  = aws_iam_role.workernodes.arn
   subnet_ids = [aws_subnet.devops1.id, aws_subnet.devops2.id]
  instance_types = ["t3.small"]
 
  scaling_config {
   desired_size = 1
   max_size   = 1
   min_size   = 1
  }
 
  depends_on = [
   aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy,
   aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy,
   #aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly,
  ]

  tags = {
    Name = "terraform-eks-devops"
  }
  
 }