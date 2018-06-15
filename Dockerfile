FROM hashicorp/terraform:light

LABEL maintainer jauffrey.flach@gmail.com

ARG MATCHBOX_PLUGIN_URL="https://github.com/coreos/terraform-provider-matchbox/releases/download/v0.2.2/terraform-provider-matchbox-v0.2.2-linux-amd64.tar.gz"
ARG CONSUL_PROVIDER_URL="https://releases.hashicorp.com/terraform-provider-consul/1.0.0/terraform-provider-consul_1.0.0_linux_amd64.zip"

RUN set -ex; \
	mkdir -p ~/.terraform.d/plugins; \
	curl -fSL $MATCHBOX_PLUGIN_URL -o terraform-provider-matchbox-v0.2.2-linux-amd64.tar.gz; \
	curl -fSL $CONSUL_PROVIDER_URL -o terraform-provider-consul_1.0.0_linux_amd64.zip; \
	unzip terraform-provider-consul_1.0.0_linux_amd64.zip; \
	tar -xzvf terraform-provider-matchbox-v0.2.2-linux-amd64.tar.gz; \
	mv terraform-provider-matchbox-v0.2.2-linux-amd64/* ~/.terraform.d/plugins; \
	mv terraform-provider-consul_v1.0.0_x4 ~/.terraform.d/plugins; \
	rmdir terraform-provider-matchbox-v0.2.2-linux-amd64; \
    rm terraform-provider-matchbox-v0.2.2-linux-amd64.tar.gz; \
    rm terraform-provider-consul_1.0.0_linux_amd64.zip;

WORKDIR /terraform