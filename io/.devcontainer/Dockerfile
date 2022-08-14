FROM mcr.microsoft.com/vscode/devcontainers/javascript-node:16

# [Optional] Uncomment this section to install additional OS packages.
# RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    # && apt-get -y install --no-install-recommends <your-package-list-here>

RUN npm install -g onchange 2>&1

ADD http://iobin.suspended-chord.info/linux/iobin-linux-x64-deb-current.zip /tmp
RUN unzip /tmp/iobin*.zip -d /tmp \
    && dpkg -i /tmp/IoLanguage*.deb
