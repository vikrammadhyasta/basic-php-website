# Dockerfile - PHP (Apache) for basic-php-website
FROM php:8.2-apache

# metadata
LABEL maintainer="you@example.com"
WORKDIR /var/www/html

# Copy app
COPY . /var/www/html

# Remove git metadata if present
RUN rm -rf /var/www/html/.git || true

# Ensure proper ownership for Apache
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

EXPOSE 80

# Use official apache foreground command
CMD ["apache2-foreground"]
