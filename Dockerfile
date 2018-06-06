FROM hashicorp/terraform:light

LABEL maintainer jauffrey.flach@gmail.com

ARG MATCHBOX_PLUGIN_URL="https://github.com/coreos/terraform-provider-matchbox/releases/download/v0.2.2/terraform-provider-matchbox-v0.2.2-linux-amd64.tar.gz"

RUN set -ex; \
	mkdir -p ~/.terraform.d/plugins; \
	curl -fSL $MATCHBOX_PLUGIN_URL -o terraform-provider-matchbox-v0.2.2-linux-amd64.tar.gz; \
	tar -xzvf terraform-provider-matchbox-v0.2.2-linux-amd64.tar.gz; \
	mv terraform-provider-matchbox-v0.2.2-linux-amd64/* ~/.terraform.d/plugins; \
	rmdir terraform-provider-matchbox-v0.2.2-linux-amd64; \
    rm terraform-provider-matchbox-v0.2.2-linux-amd64.tar.gz;

WORKDIR /terraform