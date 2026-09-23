
resource "aws_iam_role" "ec2_role" {
    name = project-tf-3-role
    assume_role_policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "sts:AssumeRole"
            ],
            "Principal": {
                "Service": [
                    "ec2.amazonaws.com"
                ]
            }
        }
    ]
})
tags = locals.comman_tags
}

resource "aws_iam_policy" "s3_access" {
    name = "project-tf-s3-policy"
    role = aws_iam_role.ec2_role.id
    policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": "s3:*",
            "Resource": "*"
        }
    ]
})
tags = locals.comman_tags
}

resource "aws_iam_instance_profile" "ec2_profile" {
    name = "ec2-profile-role"
   role = aws_iam_role.ec2_role.id
    tags = locals.comman_tags
}

