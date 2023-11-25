#S3 Bucket

module "s3_bucket" {
  source = "./modules/s3"
}

#EC2
module "ec2_instance" {
  source = "./modules/ec2"
  create_ec2 = var.create_ec2
  counter = var.counter
}

##IAM

module "iam" {
  source = "./modules/iam"
  resource = module.s3_bucket.s3_arn
}