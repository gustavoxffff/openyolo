FROM debian:trixie-slim

RUN apt update && \
    apt install --no-install-recommends -y \
      npm git gh cargo curl ca-certificates && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://opencode.ai/install | bash && \
    curl -fsSL \
    https://raw.githubusercontent.com/rtk-ai/rtk/refs/heads/master/install.sh | sh && \
    ~/.local/bin/rtk init -g --opencode && \
    curl -fsSL https://raw.githubusercontent.com/JuliusBrussee/caveman/main/install.sh | bash

WORKDIR ~

CMD ["~/.opencode/bin/opencode"]
