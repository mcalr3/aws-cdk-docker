FROM amazonlinux

RUN mkdir /cdk

COPY ./requirements.txt /cdk/
COPY ./entrypoint.sh /usr/local/bin/

WORKDIR /cdk
RUN curl --silent --location https://rpm.nodesource.com/setup_12.x | bash - &&\
    yum -y install \
    python3 \
    git \
    nodejs \
    npm \
    gcc \
    musl-dev &&\
    npm i -g aws-cdk &&\
    ln -s /usr/bin/pip3 /usr/bin/pip &&\
    pip install -r requirements.txt &&\
    pip install awscli &&\
    rm -rf /var/cache/yum/*


ENTRYPOINT ["entrypoint.sh"]
