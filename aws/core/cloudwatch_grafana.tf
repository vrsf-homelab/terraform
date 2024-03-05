# resource "aws_iam_role" "cloudwatch_grafana" {
#   name = "AWSCloudWatchForGrafana"

#   assume_role_policy = jsonencode({
#     "Version" : "2012-10-17",
#     "Statement" : [
#       {
#         "Effect" : "Allow",
#         "Principal" : {
#           "Service" : "ec2.amazonaws.com"
#         },
#         "Action" : "sts:AssumeRole"
#       }
#     ]
#   })
# }

# resource "aws_iam_role_policy" "cloudwatch_grafana" {
#   name = "CloudWatchForGrafana"
#   role = aws_iam_role.cloudwatch_grafana.id

#   policy = jsonencode({
#     "Version" : "2012-10-17",
#     "Statement" : [
#       {
#         "Sid" : "AllowReadingMetricsFromCloudWatch",
#         "Effect" : "Allow",
#         "Action" : [
#           "cloudwatch:DescribeAlarmsForMetric",
#           "cloudwatch:DescribeAlarmHistory",
#           "cloudwatch:DescribeAlarms",
#           "cloudwatch:ListMetrics",
#           "cloudwatch:GetMetricStatistics",
#           "cloudwatch:GetMetricData",
#           "cloudwatch:GetInsightRuleReport"
#         ],
#         "Resource" : "*"
#       },
#       {
#         "Sid" : "AllowReadingLogsFromCloudWatch",
#         "Effect" : "Allow",
#         "Action" : [
#           "logs:DescribeLogGroups",
#           "logs:GetLogGroupFields",
#           "logs:StartQuery",
#           "logs:StopQuery",
#           "logs:GetQueryResults",
#           "logs:GetLogEvents"
#         ],
#         "Resource" : "*"
#       },
#       {
#         "Sid" : "AllowReadingTagsInstancesRegionsFromEC2",
#         "Effect" : "Allow",
#         "Action" : ["ec2:DescribeTags", "ec2:DescribeInstances", "ec2:DescribeRegions"],
#         "Resource" : "*"
#       },
#       {
#         "Sid" : "AllowReadingResourcesForTags",
#         "Effect" : "Allow",
#         "Action" : "tag:GetResources",
#         "Resource" : "*"
#       },
#       {
#         "Sid" : "AllowReadingAcrossAccounts",
#         "Effect" : "Allow",
#         "Action" : [
#           "oam:ListSinks",
#           "oam:ListAttachedLinks"
#         ],
#         "Resource" : "*"
#       }
#     ]
#   })
# }
