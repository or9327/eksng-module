#### Security Group ####

resource "aws_security_group" "scg-node-group" {
  name        = var.name-scg-node-group
  description = var.name-scg-node-group
  vpc_id      = var.id-vpc

  tags = {
    Name = var.name-scg-node-group
  }
}

# 기본 아웃바운드 Rule (절대 지우지 말 것!!) 
resource "aws_security_group_rule" "scg-node-group-e" {
  type              = "egress"
  from_port       = 0
  to_port         = 0
  protocol        = "-1"
  cidr_blocks     = ["0.0.0.0/0"]
  security_group_id = aws_security_group.scg-node-group.id
}

# Node Group 에 적용할 기타 Inbound Rule 이 있으면 추가
