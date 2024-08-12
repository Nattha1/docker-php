# ใช้ภาพพื้นฐาน PHP
FROM php:8.1-apache

# ติดตั้งส่วนขยายที่จำเป็น
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd mysqli pdo pdo_mysql

# คัดลอกไฟล์เว็บไซต์ไปยังโฟลเดอร์ที่ให้บริการของ Apache
COPY src/ /var/www/html/

# ให้สิทธิ์การเข้าถึงไดเร็กทอรี
RUN chown -R www-data:www-data /var/www/html

# เริ่มต้นบริการ Apache
CMD ["apache2-foreground"]
