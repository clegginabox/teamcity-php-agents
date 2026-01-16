ARG TEAMCITY_VERSION=2025.11
ARG PHP_VERSION=8.4

FROM jetbrains/teamcity-agent:${TEAMCITY_VERSION}-linux-sudo

# Re-declare PHP_VERSION to make it available after FROM
ARG PHP_VERSION=8.4

ENV DEBIAN_FRONTEND=noninteractive

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
COPY --from=docker:latest /usr/local/bin/docker  /usr/local/bin/
COPY --from=hashicorp/terraform:latest /bin/terraform /usr/local/bin/terraform

USER root

RUN apt-get update \
    && apt-get install -y software-properties-common \
    && add-apt-repository ppa:ondrej/php \
    && apt-get update \
    && apt-get install -y \
      php${PHP_VERSION}-bcmath \
      php${PHP_VERSION}-cli \
      php${PHP_VERSION}-curl \
      php${PHP_VERSION}-grpc \
      php${PHP_VERSION}-intl \
      php${PHP_VERSION}-mbstring \
      php${PHP_VERSION}-xml

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip \
    && ./aws/install
