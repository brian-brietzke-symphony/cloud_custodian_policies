.PHONY: default install install-all reports install-reports zoned
.DEFAULT: default

BIN = custodian run --output-dir=data/ --metrics aws
ACTIONS = ebs/*.yml ec2/*.yml
REPORTS = reports/*.yml
REGION := all
ZONED_REGIONS = --region eu-central-1 --region ca-central-1


default:
	$(BIN) --dryrun $(ACTIONS)

install:
	$(BIN) $(ACTIONS)

install-all:
	$(BIN) $(ACTIONS) $(REPORTS)

reports:
	$(BIN) --dryrun $(REPORTS)

zoned:
	$(BIN) --dryrun $(ZONED_REGIONS) zoned/*.yml

install-zoned:
	$(BIN) --dryrun $(ZONED_REGIONS) zoned/*.yml