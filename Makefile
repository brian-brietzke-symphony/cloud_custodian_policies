.PHONY: default install install-all reports install-reports zone

PROFILE := dev
ACTIONS = ebs/*.yml ec2/*.yml
REPORTS = reports/*.yml
REGION := all
NONPROD_REGIONS = --region eu-central-1 --region ca-central-1 --region us-west-2 --region us-west-1
PROD_REGIONS = --region eu-west-1 --region ap-southeast-1 --region us-east-1
BIN = custodian run --output-dir=data/ --metrics aws://?region=us-east-1 --profile $(PROFILE)
BINR = custodian run --output-dir=data/ --profile $(PROFILE)

default:
	$(BINR) --dryrun $(ACTIONS)

install:
	$(BIN) $(PROD_REGIONS) $(ACTIONS)

install-reports:
	$(BIN) $(PROD_REGIONS) $(REPORTS)

install-reports-all-regions:
	$(BIN) --region all $(REPORTS)

reports:
	$(BIN) $(PROD_REGIONS) --dryrun $(REPORTS)

zoned:
	$(BIN) --dryrun $(ZONED_REGIONS) zoned/*.yml

install-zoned:
	$(BIN) --dryrun $(ZONED_REGIONS) zoned/*.yml

hooked:
	$(BINR) --profile $(PROFILE) reports/ec2-snapshots-report.yml
