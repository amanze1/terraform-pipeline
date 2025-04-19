resource "aws_security_group" "ec2_SecurityGroups" {
              name = "u2-${var.environment}-sg-${var.application}"
              description = "EC2 SG"
              ingress {
                             from_port = 22
                             to_port = 22
                             protocol = "tcp"
                             cidr_blocks = ["0.0.0.0/0"]
              }
              ingress {
              from_port   = 8081
                             to_port     = 8081
                             protocol    = "tcp"
                             cidr_blocks = ["0.0.0.0/0"]
              }

ingress {
              from_port   = 8082
                             to_port     = 8082
                             protocol    = "tcp"
                             cidr_blocks = ["0.0.0.0/0"]
              }
              ingress {
                             from_port = 80
                             to_port = 80
                             protocol = "tcp"
                             cidr_blocks = ["0.0.0.0/0"]
              }
              #Allow all outbound
              egress {
                             from_port = 0
                             to_port = 0
                             protocol = "-1"
                             cidr_blocks = ["0.0.0.0/0"]
}
}