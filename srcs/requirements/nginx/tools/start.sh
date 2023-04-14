# /etc/nginx/nginx.conf dosyasında bulunan DOMAIN_NAME yerine $DOMAINE_NAME değerini eklemek için
# sed aracını kullanır. s komutu, düzenli ifade ile eşleşen her öğeyi bulmak ve değiştirmek için kullanılır. 
# i komutu, düzenleme işlemi için yedek bir dosya oluşturur ve  .bak uzantısını kullanarak orijinal dosyanın yedeğini alır. 
sed -i.bak "s/DOMAINE_NAME/$DOMAINE_NAME/g" /etc/nginx/nginx.conf

# /etc/nginx/nginx.conf dosyasında yaptığımız değişikliklerden sonra yaratılan yedek dosyayı siler.
rm -f /etc/nginx/nginx.conf.bak

#  Nginx web sunucusunu daemon (arkaplan) olarak çalıştırır.
# -g argümanı, Nginx'e bir dizi ek komut veya yönerge verir.
# 'daemon off;' yönergesi, Nginx'in daemon (arka plan) olarak çalıştırılmasını durdurur ve Nginx'in mevcut süreçte ön plana çıkmasına izin verir.
# Bu, Docker konteyneri içinde Nginx'in doğru şekilde çalışmasını sağlar.
nginx -g 'daemon off;'