# Use PHP 8.2 CLI image
FROM php:8.2-cli

# Install necessary dependencies
RUN apt-get update && apt-get install -y \
    git \
    unzip

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Set working directory
WORKDIR /app

# Install PHP Compatibility Checker and its dependencies
RUN composer require --dev \
    squizlabs/php_codesniffer:^3.5 \
    phpcompatibility/php-compatibility:^9.3

# Configure PHP_CodeSniffer to use the PHPCompatibility standard
RUN vendor/bin/phpcs --config-set installed_paths /app/vendor/phpcompatibility/php-compatibility

# Verify the installation
RUN vendor/bin/phpcs -i

# Set up a script to run the compatibility check
RUN echo '#!/bin/sh\n\
if [ -z "$PHP_VERSION_MIN" ] || [ -z "$PHP_VERSION_MAX" ]; then\n\
    echo "Error: PHP_VERSION_MIN and PHP_VERSION_MAX must be set"\n\
    exit 1\n\
fi\n\
/app/vendor/bin/phpcs -p --extensions=php --standard=PHPCompatibility --runtime-set testVersion ${PHP_VERSION_MIN}-${PHP_VERSION_MAX} --ignore=*/vendor/* /project\n\
' > /usr/local/bin/check-compatibility && \
    chmod +x /usr/local/bin/check-compatibility

# Set the default command
CMD ["check-compatibility"]
