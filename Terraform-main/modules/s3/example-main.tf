### Create  three S3 buckets using the count meta-argument.
### Each bucket should include the index number to its name.(For Example Student-demo-bucket-1,Student-demo-bucket -2)

resource "aws_s3_bucket" "Student-demo-bucket" {
    count = 3
    bucket = "Student-demo-bucket-${count.index + 1}"
    acl = "private"
    tags = {
        Name = "Student-demo-bucket-${count.index + 1}"
    }
}