provider "aws" {
    region  = "us-east-1"
}
module "my_vpc_dev" {
    source              =   "../modules/vpc"
    vpc_cidr            =   "20.0.0.0/16"
    tenancy             =   "default"
    subnet_cidr_dev     =   "20.0.0.0/24"
    vpc_id              =   "${module.my_vpc_dev.vpc_id}"
}

module "my_ec2_dev" {
    source              =   "../modules/ec2"
    ami_id              =   "ami-02b4e72b17337d6c1"
    instance_count      =   "1"
    instance_type       =   "t2.nano"
    subnet_id           =   "${module.my_vpc_dev.subnet_id}"
}

module "route53" {
    source              =   "../modules/route53"
    zone_id             =   "${var.zone_id}"
    aliases             =   "${var.aliases}"
}