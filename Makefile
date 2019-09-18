.PHONY: default
.DEFAULT := default

BIN = custodian run --output-dir=data/
YAML = ebs/*.yml ec2/*.yml ami/*.yml


default:
	$(BIN) --dryrun $(YAML)

install:
	$(BIN) $(YAML)

install-all:
	$(BIN) --region all $(YAML)