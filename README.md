# cloud_custodian_policies

```
{
    "widgets": [
        {
            "type": "metric",
            "x": 0,
            "y": 6,
            "width": 6,
            "height": 6,
            "properties": {
                "view": "timeSeries",
                "stacked": false,
                "metrics": [
                    [ "CloudMaid", "ResourceCount", "Policy", "ec2-release-elastic-ip", "Scope", "Policy", "ResType", "network-addr" ]
                ],
                "region": "us-east-1",
                "title": "Released Elastic IPs"
            }
        },
        {
            "type": "metric",
            "x": 6,
            "y": 6,
            "width": 6,
            "height": 6,
            "properties": {
                "view": "timeSeries",
                "stacked": false,
                "metrics": [
                    [ "CloudMaid", "ResourceCount", "Policy", "ebs-snapshot-delete-old-snaphots", "Scope", "Policy", "ResType", "ebs-snapshot" ]
                ],
                "region": "us-east-1",
                "title": "Snapshots Removed"
            }
        },
        {
            "type": "metric",
            "x": 18,
            "y": 6,
            "width": 6,
            "height": 6,
            "properties": {
                "view": "timeSeries",
                "stacked": false,
                "metrics": [
                    [ "CloudMaid", "ResourceCount", "Policy", "ami-deregister-old-ami", "Scope", "Policy", "ResType", "ami" ]
                ],
                "region": "us-east-1",
                "title": "Deregister Unused AMI"
            }
        },
        {
            "type": "metric",
            "x": 12,
            "y": 6,
            "width": 6,
            "height": 6,
            "properties": {
                "view": "timeSeries",
                "stacked": false,
                "metrics": [
                    [ "CloudMaid", "ResourceCount", "Policy", "ebs-delete-marked-volumes", "Scope", "Policy", "ResType", "ebs" ]
                ],
                "region": "us-east-1",
                "title": "Removed Unattached Volumes"
            }
        },
        {
            "type": "text",
            "x": 0,
            "y": 0,
            "width": 24,
            "height": 6,
            "properties": {
                "markdown": "\n# Actioned Items\nBelow are the results for cleanup actions take automatically once per day.  \n\n## Descriptions:\n* **Release Elastic IPs**:  Elastic IP address that are not associated with a different resources that have been released for this account.\n* **Snapshots Removed**: Daily count of EBS Snapshots that are older than 30 days that have been removed.\n* **Removed Unattached Volumes**: EBS volumes that have not been attached to an instance for more than 30 days that have been removed.\n* **Deregistered Unused AMIs**:  AMIs that do not have any instances created from them.\n"
            }
        },
        {
            "type": "text",
            "x": 0,
            "y": 12,
            "width": 24,
            "height": 6,
            "properties": {
                "markdown": "\n# Reports\nThe following show reports and graphs of items of interest that should be monitored.\n\n## Descriptions\n* **Instances Stopped for 30 or more days**:  Instances in this account that have been put in the stopped state 30 or more days ago and have not been turned back on.\n* **Instances running for 60 or more days**: Running total of instances for this account that have been _on_ for 60 or more days.\n* **Unused Security Groups**: Security groups that are not attached and not being used by other resources.\n* **Risky Security Groups**: Security Groups that have 0.0.0.0/0 as an ingress options that do not have a marked SOR ticket.\n"
            }
        },
        {
            "type": "metric",
            "x": 6,
            "y": 18,
            "width": 6,
            "height": 6,
            "properties": {
                "metrics": [
                    [ "CloudMaid", "ResourceCount", "Policy", "r-ec2-running-instances-60", "Scope", "Policy", "ResType", "ec2" ]
                ],
                "view": "timeSeries",
                "stacked": false,
                "region": "us-east-1",
                "title": "Instances Running for more than 60 days",
                "period": 300
            }
        },
        {
            "type": "metric",
            "x": 0,
            "y": 18,
            "width": 6,
            "height": 6,
            "properties": {
                "view": "timeSeries",
                "stacked": false,
                "metrics": [
                    [ "CloudMaid", "ResourceCount", "Policy", "r-ec2-stopped-instances-30", "Scope", "Policy", "ResType", "ec2" ]
                ],
                "region": "us-east-1",
                "title": "Instances stopped for 30 or more days"
            }
        },
        {
            "type": "metric",
            "x": 12,
            "y": 18,
            "width": 6,
            "height": 6,
            "properties": {
                "view": "timeSeries",
                "stacked": false,
                "metrics": [
                    [ "CloudMaid", "ResourceCount", "Policy", "r-ec2-unused-security-groups", "Scope", "Policy", "ResType", "security-group" ]
                ],
                "region": "us-east-1",
                "title": "Unused Security Groups"
            }
        },
        {
            "type": "metric",
            "x": 18,
            "y": 18,
            "width": 6,
            "height": 6,
            "properties": {
                "view": "timeSeries",
                "stacked": false,
                "metrics": [
                    [ "CloudMaid", "ResourceCount", "Policy", "r-ec2-risky-security-groups", "Scope", "Policy", "ResType", "security-group" ]
                ],
                "region": "us-east-1",
                "title": "Risky Security Groups"
            }
        }
    ]
}
```