# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.189.0/containers/ruby/.devcontainer/base.Dockerfile

# [Choice] Ubuntu version: bionic, focal
ARG VARIANT=focal
FROM mcr.microsoft.com/vscode/devcontainers/base:${VARIANT}

# [Optional] Uncomment this section to install additional OS packages.
# RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    # && apt-get -y install --no-install-recommends <your-package-list-here>

ADD http://iobin.suspended-chord.info/linux/iobin-linux-x64-deb-current.zip /tmp
RUN unzip /tmp/iobin*.zip -d /tmp \
    && dpkg -i /tmp/IoLanguage*.deb
