FROM httpd:2.4-alpine
LABEL maintainer="blueline-lab"
LABEL version="1.0"
LABEL description="Apache Web Server pour test zero-downtime"

# Copie du contenu web
COPY ./html/ /usr/local/apache2/htdocs/

# Configuration Apache personnalisée (optionnel)
# COPY ./apache-config/httpd.conf /usr/local/apache2/conf/httpd.conf

# Exposition du port
EXPOSE 80

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget --no-verbose --tries=1 --spider http://localhost/ || exit 1

# Commande par défaut
CMD ["httpd-foreground"]
