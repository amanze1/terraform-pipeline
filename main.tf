provider "aws" {
            region = var.region
            version = "~> 2.0"
}
resource "aws_instance" "ec2" {
            user_data   = base64encode(file("deploy.sh"))
            ami = "ami-04f167a56786e4b09"   ##Change AMI to meet OS requirement as needed.
            root_block_device {
    volume_type           = "gp2"
    volume_size           = 200
    delete_on_termination = true
    encrypted             = true
  }
            tags = {
                        Name = "u2-${var.environment}-${var.application}"
                        CreatedBy = var.launched_by
                        Application = var.application
                        OS = var.os
                        Environment = var.environment
            }
            instance_type = var.instance_type
            key_name = "mydevopskey"
            vpc_security_group_ids = [aws_security_group.ec2_SecurityGroups.id]
}
output "ec2_ip" {
            value = [aws_instance.ec2.*.private_ip]
}
output "ec2_ip_public" {
            value = [aws_instance.ec2.*.public_ip]
}
output "ec2_name" {
            value = [aws_instance.ec2.*.tags.Name]
}
output "ec2_instance_id" {
            value = aws_instance.ec2.*.id
} 