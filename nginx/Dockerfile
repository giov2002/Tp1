FROM nginx:alpine
LABEL maintainer="blueline-lab"
LABEL version="1.0"
LABEL description="Nginx Web Server pour test zero-downtime"

# Copie du contenu web
COPY ./html/ /usr/share/nginx/html/

# Configuration Nginx personnalisée
COPY ./nginx.conf /etc/nginx/nginx.conf

# Exposition du port
EXPOSE 80

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget --no-verbose --tries=1 --spider http://localhost/ || exit 1

# Commande par défaut
CMD ["nginx", "-g", "daemon off;"]
