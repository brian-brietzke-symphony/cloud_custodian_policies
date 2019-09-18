.PHONY: default install install-all reports
.DEFAULT := default

BIN = custodian run --output-dir=data/ --metrics aws
YAML = ebs/*.yml ec2/*.yml ami/*.yml


default:
	$(BIN) --dryrun $(YAML)

install:
	$(BIN) $(YAML)

install-all:
	$(BIN) --region all $(YAML)

reports:
	$(BIN) --dryrun reports/*.yml