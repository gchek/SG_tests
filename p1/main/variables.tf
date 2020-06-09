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





