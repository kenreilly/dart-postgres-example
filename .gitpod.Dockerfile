FROM gitpod/workspace-postgres

USER gitpod

RUN wget https://storage.googleapis.com/dart-archive/channels/stable/release/2.6.1/sdk/dartsdk-linux-x64-release.zip && \
    unzip dartsdk-linux-x64-release.zip && \
    echo 'export PATH=$PATH:/home/gitpod/dart-sdk/bin' >>~/.bashrc
