FROM alpine
RUN apk add --no-cache curl
RUN curl -fsSL https://github.com/mikefarah/yq/releases/download/v4.34.1/yq_linux_amd64.tar.gz | tar -O -xzf - > /tmp/yq
RUN curl -fsSL https://github.com/bluebrown/go-template-cli/releases/latest/download/tpl-linux-amd64-static >/tmp/tpl

FROM alpine
RUN apk add --no-cache bash
SHELL ["/bin/bash"]
COPY --from=0 --chmod=0755 /tmp /usr/local/bin
COPY --chmod=0755 app-config-generator /usr/local/bin/
ENTRYPOINT ["/usr/local/bin/app-config-generator"]