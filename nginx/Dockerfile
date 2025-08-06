# Utilise l'image officielle nginx (Debian par défaut)
FROM nginx:1.25

LABEL maintainer="blueline-lab"
LABEL version="1.0"
LABEL description="Nginx Web Server pour test zero-downtime"

# Copie du contenu web
COPY ./html/ /usr/share/nginx/html/

# Copie de la configuration Nginx personnalisée
COPY ./nginx.conf /etc/nginx/nginx.conf

# Exposition du port
EXPOSE 80

# Health check avec curl
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD curl --silent --fail http://localhost/ || exit 1

# Commande par défaut
CMD ["nginx", "-g", "daemon off;"]
