# استفاده از یک لینوکس کاملا عادی و سبک به جای ایمیج‌های Xray
FROM alpine:latest

# نصب ابزارهای اولیه بدون جلب توجه
RUN apk add --no-cache curl unzip wget

# دانلود فایل خام از گیت‌هاب، تغییر نام آن به یک اسم گمراه‌کننده (node-app) و پاک کردن ردپا
RUN wget -q -O temp.zip https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip \
    && unzip temp.zip xray -d /usr/local/bin/ \
    && mv /usr/local/bin/xray /usr/local/bin/node-app \
    && rm temp.zip

# انتقال کانفیگ با یک اسم عادی
COPY config.json /etc/app-config.json

# اجرای برنامه با اسم جعلی
CMD ["node-app", "-config", "/etc/app-config.json"]
