#### EKS Node Group ####

resource "aws_eks_node_group" "node-group" {
  cluster_name    = var.name-cluster
  node_group_name = var.name-node-group
  node_role_arn   = aws_iam_role.role-node-group.arn
  subnet_ids      = [var.id-subnet-1, var.id-subnet-2]  
  launch_template {
    id = aws_launch_template.launch-template.id
    version = "$Latest"
  }
  capacity_type = var.node-capacity-type
  instance_types = var.node-instance-types
  scaling_config {
    desired_size = 1
    max_size     = var.max-node-count    
    min_size     = var.min-node-count
  }
  
  lifecycle {
    ignore_changes = [scaling_config[0].desired_size, scaling_config[0].min_size, scaling_config[0].max_size]
  }

  # EKS Node Group 용 Role 의 Permission 할당과 생성/삭제에 대한 종속성 있음 (반드시 적용 필요!!)
  depends_on = [
    aws_iam_role_policy_attachment.role-node-group-policya-1,
    aws_iam_role_policy_attachment.role-node-group-policya-2
  ]
}
