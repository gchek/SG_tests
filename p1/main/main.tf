



provider "aws" {
  region                = var.AWS_region
}



/*================
Create AWS VPCs
The VPCs and subnets CIDR are set in "variables.tf" file
=================*/
module "VPCs" {
  source = "../VPCs"

  VPC-test_cidr             = var.My_subnets["VPC-test"]
  Subnet10-VPC-test         = var.My_subnets["Subnet10-VPC-test"]
  Subnet20-VPC-test         = var.My_subnets["Subnet20-VPC-test"]
  region                    = var.AWS_region

}

