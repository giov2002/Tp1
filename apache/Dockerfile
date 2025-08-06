# Utilise l'image officielle httpd basée sur Debian
FROM httpd:2.4

LABEL maintainer="blueline-lab"
LABEL version="1.0"
LABEL description="Apache Web Server pour test zero-downtime"

# Copie du contenu web
COPY ./html/ /usr/local/apache2/htdocs/

# (Optionnel) Copie configuration personnalisée Apache
# COPY ./apache-config/httpd.conf /usr/local/apache2/conf/httpd.conf

# Exposition du port
EXPOSE 80

# Health check avec curl (wget pas toujours installé)
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD curl --silent --fail http://localhost/ || exit 1

# Commande par défaut
CMD ["httpd-foreground"]
