.PHONY: default install install-all reports install-reports zoned
.DEFAULT: default

BIN = custodian run --output-dir=data/ --metrics aws://?region=us-east-1
ACTIONS = ebs/*.yml ec2/*.yml
REPORTS = reports/*.yml
REGION := all
ZONED_REGIONS = --region eu-central-1 --region ca-central-1
PROD_REGIONS = --region eu-west-1 --region  ap-southeast-1 --region us-east-1

default:
	$(BIN) --dryrun $(ACTIONS)

install:
	$(BIN) $(PROD_REGIONS) $(ACTIONS)

install-all:
	$(BIN) $(PROD_REGIONS) $(ACTIONS) $(REPORTS)

install-all-regions:
	$(BIN) --region all $(ACTIONS) $(REPORTS)

reports:
	$(BIN) $(PROD_REGIONS) --dryrun $(REPORTS)

zoned:
	$(BIN) --dryrun $(ZONED_REGIONS) zoned/*.yml

install-zoned:
	$(BIN) --dryrun $(ZONED_REGIONS) zoned/*.yml