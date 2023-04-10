#base image
FROM nginx:latest

# Copy Nginx configuration file
COPY conf/nginx.conf /etc/nginx/nginx.conf

#copy default web page
COPY conf/index.html /usr/share/nginx/html/

EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]