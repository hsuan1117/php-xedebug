FROM harbor.wlan.nthu.dev/builder/php

RUN pecl install xdebug && docker-php-ext-enable xdebug

COPY --from=node:22-slim /usr/local/bin /usr/local/bin
COPY --from=node:22-slim /usr/local/lib/node_modules /usr/local/lib/node_modules
COPY --from=docker:dind /usr/local/bin/docker /usr/local/bin/

# Install corepack to manage package managers
RUN corepack yarn
