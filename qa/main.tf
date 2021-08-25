provider "aws" {
    region  = "us-east-1"
}
module "my_vpc_qa" {
    source              =   "../modules/vpc"
    vpc_cidr            =   "40.0.0.0/16"
    tenancy             =   "default"
    subnet_cidr_dev     =   "40.0.0.0/24"
    vpc_id              =   "${module.my_vpc_dev.vpc_id}"
}

module "my_ec2_qa" {
    source              =   "../modules/ec2"
    ami_id              =   "ami-02b4e72b17337d6c1"
    instance_count      =   "1"
    instance_type       =   "t2.xlarge"
    subnet_id           =   "${module.my_vpc_dev.subnet_id}"
}

module "my_rds_qa" {
    source          =   "../modules/rds"
    subnet_group    =   "${var.subnetgroup.id}"
    region          =   "us-east-1"
    db_type         =   "db.t2.xlarge"
}


