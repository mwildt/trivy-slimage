FROM registry.suse.com/bci/bci-base:15.5

WORKDIR install

RUN curl -L -o trivy.rpm https://github.com/aquasecurity/trivy/releases/download/v0.52.2/trivy_0.52.2_Linux-64bit.rpm

COPY pub.key pub.key
RUN rpm --import pub.key

RUN pwd
RUN ls -la
RUN rpm -K trivy.rpm
RUN rpm -i trivy.rpm

ENTRYPOINT ["trivy"]
