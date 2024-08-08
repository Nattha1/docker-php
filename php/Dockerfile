FROM php:8.0-apache
RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli
RUN apt-get update && apt-get upgrade -y

# คัดลอกโค้ดไปยัง container
COPY src/ /var/www/html/

# คัดลอกไฟล์การตั้งค่า Apache ที่กำหนดเอง
COPY apache-config.conf /etc/apache2/sites-available/000-default.conf

# เปิดใช้ mod_rewrite
RUN a2enmod rewrite

# ตั้งค่าการอนุญาตไฟล์
RUN chown -R www-data:www-data /var/www/html

# เปิดพอร์ตที่ Apache ใช้งาน
EXPOSE 80

# คำสั่งเพื่อเริ่มต้น Apache server
CMD ["apache2-foreground"]
