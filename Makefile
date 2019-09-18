.PHONY: default
.DEFAULT := default


default:
	custodian run --output-dir=data/ ebs/*.yml ec2/*.yml ami/*.yml