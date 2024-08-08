# Use an official PHP runtime as a parent image
FROM php:7.4-apache

# Set the working directory
WORKDIR /var/www/html

# Copy the current directory contents into the container at /var/www/html
COPY . /var/www/html

# Install any needed packages specified in composer.json
RUN apt-get update && apt-get install -y \
    libzip-dev \
    unzip \
 && docker-php-ext-install zip

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Run Composer to install dependencies
RUN composer install

# Make port 80 available to the world outside this container
EXPOSE 80

# Define the command to run the app
CMD ["apache2-foreground"]
