#### Launch Template ####

resource "aws_launch_template" "launch-template" {
  name = var.name-launch-template
  update_default_version = true
  image_id = var.node-ami-id
  key_name = var.name-sshkey

  vpc_security_group_ids = [var.id-cluster-security-group, var.id-scg-vpc-ssh, aws_security_group.scg-node-group.id]

  block_device_mappings {
    device_name = var.name-node-root-volume-device

    ebs {
      volume_size = var.size-node-volume
    }
  }

  tag_specifications {
    resource_type = "instance"
    tags = var.tags-node-group
  }

  tag_specifications {
    resource_type = "volume"
    tags = var.tags-node-group
  }

  user_data = var.userdata-node-group 
}