.PHONY: default install install-all reports install-reports zoned
.DEFAULT := default

BIN = custodian run --output-dir=data/ --metrics aws
YAML = ebs/*.yml ec2/*.yml ami/*.yml
REGION := all
ZONED_REGIONS = --region eu-central-1 --region ca-central-1
REPORTS = reports/*.yml


default:
	$(BIN) --dryrun $(YAML)

install:
	$(BIN) $(YAML)

install-all:
	$(BIN) --region $(REGION) $(YAML) $(REPORTS)

reports:
	$(BIN) --dryrun $(REPORTS)

zoned:
	$(BIN) --dryrun $(ZONED_REGIONS) zoned/*.yml

install-zoned:
	$(BIN) --dryrun $(ZONED_REGIONS) zoned/*.yml