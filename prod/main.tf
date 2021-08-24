provider "aws" {
    region  = "us-east-1"
}
module "my_vpc_prod" {
    source              =   "../modules/vpc"
    vpc_cidr            =   "20.0.0.0/16"
    tenancy             =   "default"
    subnet_cidr_dev     =   "20.0.0.0/24"
    vpc_id              =   "${module.my_vpc_prod.vpc_id}"
}

module "my_ec2_prod" {
    source              =   "../modules/ec2"
    ami_id              =   "ami-02b4e72b17337d6c1"
    instance_count      =   "1"
    instance_type       =   "t2.nano"
    subnet_id           =   "${module.my_vpc_prod.subnet_id}"
}