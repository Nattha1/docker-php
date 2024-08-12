# ใช้ภาพพื้นฐาน PHP
FROM php:8.1-apache

# ติดตั้งส่วนขยายที่จำเป็น
RUN apt-get update && apt-get install -y libpng-dev libjpeg-dev libfreetype6-dev
RUN docker-php-ext-configure gd --with-freetype --with-jpeg
RUN docker-php-ext-install -j$(nproc) gd
RUN docker-php-ext-install -j$(nproc) mysqli
RUN docker-php-ext-install -j$(nproc) pdo pdo_mysql


# คัดลอกไฟล์เว็บไซต์ไปยังโฟลเดอร์ที่ให้บริการของ Apache
COPY src/ /var/www/html/

# ให้สิทธิ์การเข้าถึงไดเร็กทอรี
RUN chown -R www-data:www-data /var/www/html

# เริ่มต้นบริการ Apache
CMD ["apache2-foreground"]
