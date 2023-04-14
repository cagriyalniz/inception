FROM debian:10.12

# OpenSSL, açık kaynak kodlu bir şifreleme kütüphanesidir ve çeşitli kriptografik protokollerin 
# uygulanmasına izin verir. Ayrıca SSL/TLS protokollerinin uygulanması ve sertifika yönetimi için kullanılır.
RUN apt-get update && apt-get upgrade -y && apt install nginx openssl -y

# Bu satır, SSL/TLS sertifikası oluşturmak için "openssl req" komutunu kullanıyor.
# RSA şifreleme anahtarının oluşturulması için "-newkey rsa:4096" parametresini kullanıyor. 
# "-x509" parametresi ile sertifika imzalama talebi (Certificate Signing Request, CSR) 
# oluşturulması sağlanıyor. 
# "-days 365" parametresi ile sertifika için geçerlilik süresi belirleniyor. 
# "-nodes" parametresi ile özel anahtarın şifrelenmemesini sağlıyor.
# sonraki satırda ise oluşturulan sertifika ve özel anahtar dosyalarının "/etc/ssl" dizini altında "MyCert.crt" ve "MyKey.key" adlarıyla kaydedilmesi sağlanıyor. "-out" parametresi ile sertifika dosyasının yolu belirtiliyor. "-keyout" parametresi ile özel anahtarın yolu belirtiliyor.
# Son olarak, "-subj" parametresi ile sertifika için alt öznitelikler belirtiliyor.
# "/C=FR/ST=PACA/L=NICE/O=42/OU=42/CN=cyalniz.42.fr/UID=cyalniz" alt öznitelikleri şu şekilde açıklanabilir:
# "/C" Fransa ülke kodu, "/ST" Provence-Alpes-Côte d'Azur bölgesi, "/L" Nisa kenti, "/O" 42 organizasyonu, "/OU" 42 departmanı, "/CN" cyalniz.42.fr ismi ve "/UID" kullanıcı kimliği.
RUN mkdir -p /etc/nginx/ssl && openssl req -newkey rsa:4096 -x509 -days 365 -nodes \
-out /etc/ssl/certs/nginx.crt \
-keyout /etc/ssl/private/nginx.key \
-subj "/C=FR/ST=PACA/L=NICE/O=42/OU=42/CN=cyalniz.42.fr/UID=cyalniz"

# host makinedeki conf/nginx.conf dosyasını Docker imajının /etc/nginx/nginx.conf konumuna kopyalar. 
# Bu, Nginx sunucusu yapılandırmasını içeren dosyayı kopyalamak için kullanılır.
COPY conf/nginx.conf /etc/nginx/nginx.conf

#  host makinedeki tools/start.sh dosyasını Docker imajının kök dizinine kopyalar. 
# Bu, Docker konteyneri başlatıldığında çalıştırılacak olan özel bir başlangıç scripti içerir.
COPY tools/start.sh .

# dizinindeki tüm dosyaların ve alt dizinlerin okunabilir, yazılabilir ve çalıştırılabilir hale getirilmesi için kullanılır. 
# Bu işlem, bu dizindeki dosyaların ve dizinlerin tüm kullanıcılar tarafından okunup yazılabilmesini sağlar.
RUN chmod 777 /var/www/html

# dizini ve altındaki dosyaların sahibinin www-data kullanıcısı ve grubunun da www-data grubu olmasını sağlar.
# Bu, Nginx sunucusunun bu dosyalara okuma/yazma erişimine sahip olmasını sağlar.
RUN chown -R www-data:www-data /var/www/html
# start.sh dosyasına çalıştırma izni verir.
# Bu izin, Docker konteyneri başlatıldığında start.sh dosyasının çalıştırılabilmesini sağlar.
RUN chmod +x start.sh

# Docker imajı başlatıldığında yürütülecek olan varsayılan komutu tanımlar.
ENTRYPOINT ["sh", "start.sh"]