FROM php:8.1-apache

# Install extensions
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    libzip-dev \
    unzip \
    mariadb-client \
    libmagickwand-dev \
    && pecl install imagick \
    && docker-php-ext-enable imagick \
    && docker-php-ext-install pdo_mysql mbstring zip exif pcntl bcmath gd

# Enable Apache Rewrite (optional for frameworks like Laravel)
RUN a2enmod rewrite

# Copy app files
COPY . /var/www/html/

# Set correct permissions (if needed)
RUN chown -R www-data:www-data /var/www/html
