
locals {
    common_tags = {
        "Team" = "Devops"
        "Scope" = "Infraestrura"
        "CC" = "11502"
    }
}

resource "aws_vpc" "minha_vpc" {
  cidr_block = var.vpc_range
  tags = {
    Name = var.vpc_name
  }
}

# Correcao primeira issue
resource "aws_flow_log" "example" {
  log_destination      = "arn:aws:s3:::vinicius-clc11-tfstate"
  log_destination_type = "s3"
  traffic_type         = "ALL"
  vpc_id               = aws_vpc.minha_vpc.id
}

# Correcao segunda issue
resource "aws_default_security_group" "default" {
  vpc_id = aws_vpc.minha_vpc.id
  
  tags = {
    Name = "my-iac-sg"
  }
}

resource "aws_subnet" "public-subnet-1a" {
  vpc_id            = aws_vpc.minha_vpc.id
  cidr_block        = var.public_subnet_1a_range
  availability_zone = "us-east-1a"

  tags = {
    Name = "iac-public-subnet-1a"
  }
}

resource "aws_subnet" "public-subnet-1c" {
  vpc_id            = aws_vpc.minha_vpc.id
  cidr_block        = "10.0.20.0/24"
  availability_zone = "us-east-1c"

  tags = {
    Name = "iac-public-subnet-1c"
  }
}

resource "aws_subnet" "private-subnet-1a" {
  vpc_id            = aws_vpc.minha_vpc.id
  cidr_block        = "10.0.100.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "iac-private-subnet-1a"
  }
}

resource "aws_subnet" "private-subnet-1c" {
  vpc_id            = aws_vpc.minha_vpc.id
  cidr_block        = "10.0.200.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "iac-private-subnet-1c"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.minha_vpc.id

  tags = {
    Name = "igw-vpc-iac-clc11"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.minha_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "iac-public-rt"
  }
}

resource "aws_route_table_association" "public-1a" {
  subnet_id      = aws_subnet.public-subnet-1a.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "public-1c" {
  subnet_id      = aws_subnet.public-subnet-1c.id
  route_table_id = aws_route_table.public_rt.id
}


resource "aws_eip" "ip_nat_1a" {
  domain           = "vpc"
}

resource "aws_nat_gateway" "natgateway_1a" {
  allocation_id = aws_eip.ip_nat_1a.id
  subnet_id     = aws_subnet.public-subnet-1a.id

  tags = {
    Name = "iac-natgatway-1a"
  }
}

resource "aws_eip" "ip_nat_1c" {
  domain           = "vpc"
}

resource "aws_nat_gateway" "natgateway_1c" {
  allocation_id = aws_eip.ip_nat_1c.id
  subnet_id     = aws_subnet.public-subnet-1c.id

  tags = {
    Name = "iac-natgatway-1c"
  }
}


resource "aws_route_table" "private_rt_1a" {
  vpc_id = aws_vpc.minha_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.natgateway_1a.id
  }

  tags = {
    Name = "iac-private-rt-1a"
  }
}

resource "aws_route_table" "private_rt_1c" {
  vpc_id = aws_vpc.minha_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.natgateway_1c.id
  }

  tags = {
    Name = "iac-private-rt-1c"
  }
}

resource "aws_route_table_association" "private-1a" {
  subnet_id      = aws_subnet.private-subnet-1a.id
  route_table_id = aws_route_table.private_rt_1a.id
}

resource "aws_route_table_association" "private-1c" {
  subnet_id      = aws_subnet.private-subnet-1c.id
  route_table_id = aws_route_table.private_rt_1c.id
}







###################################














######## OUTPUT SESSION ########

output "vpc_id" {
  value = "Minha vpc id: ${aws_vpc.minha_vpc.id}"
}
output "vpc_arn" {
  value = "Minha vpc arn: ${aws_vpc.minha_vpc.arn}"
}