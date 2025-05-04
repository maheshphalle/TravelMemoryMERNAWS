resource "aws_security_group" "web_sg" {
    name = "web_sg"
    vpc_id = var.vpc_id

    ingress {
        from_port     = 22
        to_port       = 22
        protocol      = "tcp"
        cidr_blocks = ["154.84.249.5/32"]
    }

    ingress {
        from_port     = 3000
        to_port       = 3000
        protocol      = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {

        from_port       = 0
        to_port         = 0
        protocol        = "-1"
        cidr_blocks     = ["0.0.0.0/0"]

    }
}

resource "aws_security_group" "db_sg" {
    
        name            = "db-sg"
        vpc_id          = var.vpc_id


    ingress {

        from_port       = 27017
        to_port         = 27017
        protocol        = "tcp"
        security_groups = [aws_security_group.web_sg.id]
        
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]

    }


}
