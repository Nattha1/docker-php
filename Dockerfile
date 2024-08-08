# ใช้ภาพพื้นฐาน PHP
FROM php:8.1-apache

# ติดตั้งการสนับสนุน MySQL
RUN docker-php-ext-install mysqli pdo pdo_mysql

# คัดลอกไฟล์เว็บไซต์ไปยังโฟลเดอร์ที่ให้บริการของ Apache
COPY src/ /var/www/html/
