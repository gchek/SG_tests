
/*================
Create VPCs
Create respective Internet Gateways
Create subnets
Create route tables
create security groups
=================*/

variable "VPC-test_cidr"      {}
variable "Subnet10-VPC-test"  {}
variable "Subnet20-VPC-test"  {}
variable "region"         {}


/*================
VPCs
=================*/
resource "aws_vpc" "VPC-test" {
  cidr_block            = var.VPC-test_cidr
  enable_dns_support    = true
  enable_dns_hostnames  = true
  tags = {
    Name = "VPC-test"
  }
}

/*================
IGWs
=================*/

resource "aws_internet_gateway" "VPC-test-igw" {
  vpc_id = aws_vpc.VPC-test.id
  tags = {
    Name = "VPC-test-IGW"
  }

}

/*================
Subnets in VPC-test
=================*/

# Get Availability zones in the Region
data "aws_availability_zones" "AZ" {}

resource "aws_subnet" "Subnet10-VPC-test" {
  vpc_id     = aws_vpc.VPC-test.id
  cidr_block = var.Subnet10-VPC-test
  map_public_ip_on_launch = true
  availability_zone = data.aws_availability_zones.AZ.names[0]
  tags = {
    Name = "Subnet10-VPC-test"
  }
}

/*================
default route table VPC-test
=================*/

resource "aws_default_route_table" "VPC-test-RT" {
  default_route_table_id = aws_vpc.VPC-test.default_route_table_id

  lifecycle {
    ignore_changes = [route] # ignore any manually or ENI added routes
  }

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.VPC-test-igw.id
  }

  tags = {
    Name = "RT-VPC-test"
  }
}



/*================
Route Table association
=================*/

resource "aws_route_table_association" "VPC-test_10" {
  subnet_id      = aws_subnet.Subnet10-VPC-test.id
  route_table_id = aws_default_route_table.VPC-test-RT.id
}


/*================
Security Groups
=================*/

resource "aws_security_group" "GC-SG-VPC-test" {
  name    = "GC-SG-VPC-test"
  vpc_id  = aws_vpc.VPC-test.id
//  lifecycle {
//    create_before_destroy = true
//  }
  tags = {
    Name = "GCTF-SG-VPC-test"
  }
  #SSH, all PING and others
  ingress {
    description = "Allow SSH"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "Allow all PING"
    from_port = -1
    to_port = -1
    protocol = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "Allow MySQL"
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "Allow iPERF3"
    from_port = 5201
    to_port = 5201
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

resource "aws_default_security_group" "default" {

  vpc_id = aws_vpc.VPC-test.id
  lifecycle {
    create_before_destroy = true
  }
  ingress {
    description = "Default SG for VPC-test"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    self        = true
  }
  ingress{
     description = "Include EC2 SG in VPC-test default SG"
     from_port   = 0
     to_port     = 0
     protocol    = "-1"
     security_groups = [aws_security_group.GC-SG-VPC-test.id]
   }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "Default VPC-test-SG"
  }
}




/*================
S3 Gateway end point
=================*/

 resource "aws_vpc_endpoint" "s3" {
   vpc_id          = aws_vpc.VPC-test.id
   service_name    = "com.amazonaws.${var.region}.s3"
   route_table_ids = [aws_default_route_table.VPC-test-RT.id]
 }











