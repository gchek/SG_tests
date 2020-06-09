/*================
REGIONS map:
==================
us-east-1         US East (N. Virginia)
us-east-2	      US East (Ohio)
us-west-1	      US West (N. California)
us-west-2	      US West (Oregon)
ca-central-1	  Canada (Central)

eu-west-1	      EU (Ireland)
eu-central-1	  EU (Frankfurt)
eu-west-2	      EU (London)
eu-west-3         EU (Paris)
eu-north-1        EU (stokholm)

ap-northeast-1	  Asia Pacific (Tokyo)
ap-northeast-2	  Asia Pacific (Seoul)
ap-southeast-1	  Asia Pacific (Singapore)
ap-southeast-2	  Asia Pacific (Sydney)
ap-south-1	      Asia Pacific (Mumbai)
sa-east-1	      South America (São Paulo)
=================*/



variable "AWS_region"     {default = "us-west-2"}



/*================
Subnets IP ranges
=================*/
variable "My_subnets" {
  default = {

    VPC-test                = "172.10.0.0/16"
    Subnet10-VPC-test       = "172.10.10.0/24"
    Subnet20-VPC-test       = "172.10.20.0/24"
    Subnet30-VPC-test       = "172.10.30.0/24"
  }
}
/*================
VM AMIs
=================*/


/*===================================================
Amazon Machine Images for Tanzu Kubernetes Grid 1.0.0
=====================================================

ap-northeast-1	ami-07d5076afaf13aa77
ap-northeast-2	ami-0cb22de4c4da68542
ap-south-1	    ami-0acc928b65d161ebd
ap-southeast-1	ami-089a436f0bace9335
ap-southeast-2	ami-083ec7e91a68e9c73
eu-central-1	ami-0d9f883266dee911e
eu-west-1	    ami-0ec61dd68529b73e2
eu-west-2	    ami-0e9216661312a1a35
eu-west-3	    ami-05dfe276355eb8f12
sa-east-1	    ami-0cfe19e780369d05f
us-east-1	    ami-0cdd7837e1fdd81f8
us-east-2	    ami-0f02df79b659875ec
us-west-1	    ami-0ec28d83f96a31158
us-west-2	    ami-074a82cfc610da035

=====================================================*/
//variable "VM_AMI"       { default = "ami-0d6621c01e8c2de2c"} # Amazon Linux 2 AMI (HVM), SSD Volume Type - Oregon


//variable "TKG_AMI"      { default = "ami-074a82cfc610da035"} # in us-west-2 - Oregon

