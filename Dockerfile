# ใช้ภาพพื้นฐาน PHP
FROM php:8.1-apache

# ติดตั้งส่วนขยายที่จำเป็น
RUN curl -fsSL '[url-to-custom-php-module]' -o module-name.tar.gz \
	&& mkdir -p /tmp/module-name \
	&& sha256sum -c "[shasum-value]  module-name.tar.gz" \
	&& tar -xf module-name.tar.gz -C /tmp/module-name --strip-components=1 \
	&& rm module-name.tar.gz \
	&& docker-php-ext-configure /tmp/module-name --enable-module-name \
	&& docker-php-ext-install /tmp/module-name \
	&& rm -r /tmp/module-name


# คัดลอกไฟล์เว็บไซต์ไปยังโฟลเดอร์ที่ให้บริการของ Apache
COPY src/ /var/www/html/

# ให้สิทธิ์การเข้าถึงไดเร็กทอรี
RUN chown -R www-data:www-data /var/www/html

# เริ่มต้นบริการ Apache
CMD ["apache2-foreground"]
