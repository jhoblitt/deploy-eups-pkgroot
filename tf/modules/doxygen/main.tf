module "push_user" {
  source = "github.com/lsst-sqre/tf_aws_iam_user"

  name = "${var.env_name}-doxygen-push"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "1",
      "Effect": "Allow",
      "Action": [
        "s3:GetObject",
        "s3:PutObject"
      ],
      "Resource": "${aws_s3_bucket.doxygen.arn}/*"
    },
    {
      "Sid": "2",
      "Effect": "Allow",
      "Action": [
        "s3:ListObjects",
        "s3:ListBucket"
      ],
      "Resource": "${aws_s3_bucket.doxygen.arn}"
    }
  ]
}
EOF
}

resource "aws_s3_bucket" "doxygen" {
  region        = "${var.aws_default_region}"
  bucket        = "${data.template_file.fqdn.rendered}"
  acl           = "public-read"
  force_destroy = false

  website {
    index_document = "index.html"
    error_document = "index.html"
  }

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["GET"]
    allowed_origins = ["*"]
  }
}

# the policy can not be inlined in the bucket resource as it is not allowed to
# self reference
resource "aws_s3_bucket_policy" "doxygen" {
  bucket = "${aws_s3_bucket.doxygen.id}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "AllowPublicRead",
      "Effect": "Allow",
      "Principal": {
        "AWS": "*"
      },
    "Action": "s3:GetObject",
      "Resource": "${aws_s3_bucket.doxygen.arn}/*"
    }
  ]
}
EOF
}

# index.html taken from:
#   https://github.com/rufuspollock/s3-bucket-listing
# Per the README, this file under the MIT license
#
# note that the non-website s3 url must be used
resource "aws_s3_bucket_object" "doxygen_index" {
  bucket       = "${aws_s3_bucket.doxygen.id}"
  key          = "index.html"
  content_type = "text/html"

  content = <<EOF
<!DOCTYPE html>
<html>
<head>
  <title>S3 Bucket Listing Generator</title>
</head>
<body>
  <div id="navigation"></div>
  <div id="listing"></div>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
  var S3BL_IGNORE_PATH = false;
  // var BUCKET_NAME = 'BUCKET';
  var BUCKET_URL = 'http://${aws_s3_bucket.doxygen.bucket_domain_name}/';
  // var S3B_ROOT_DIR = 'SUBDIR_L1/SUBDIR_L2/';
  // var S3B_SORT = 'DEFAULT';
  // var EXCLUDE_FILE = 'index.html';
  // var AUTO_TITLE = true;
  // var S3_REGION = 's3'; // for us-east-1
</script>
<script type="text/javascript" src="https://rawgit.com/rufuspollock/s3-bucket-listing/gh-pages/list.js"></script>
</body>
</html>
EOF
}
