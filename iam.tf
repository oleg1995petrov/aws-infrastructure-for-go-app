resource "aws_iam_role" "ec2_role" {
  assume_role_policy = file("files/policies/ec2_role.json")
}

resource "aws_iam_role_policy" "ec2_role_policy" {
  role   = aws_iam_role.ec2_role.id
  policy = file("files/policies/ec2_role_policy.json")
}

resource "aws_iam_instance_profile" "ec2_role_profile" {
  role = aws_iam_role.ec2_role.name
}
