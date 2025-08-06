#!/bin/bash

echo "=== TEST MYSQL ISOLÉ ==="

# Vérifier que MySQL est en cours d'exécution
if docker ps | grep mysql-lab > /dev/null; then
    echo "✅ Container MySQL actif"
else
    echo "❌ Container MySQL non actif"
    exit 1
fi

# Attendre que MySQL soit prêt
echo "Attente MySQL (30s)..."
sleep 30

# Test de connexion root
echo -n "Test connexion root: "
if docker exec mysql-lab mysqladmin ping -u root -proot_password_2024 > /dev/null 2>&1; then
    echo "✅ OK"
else
    echo "❌ ERREUR"
    echo "Logs MySQL:"
    docker-compose logs mysql-db | tail -20
    exit 1
fi

# Test de la base de données
echo -n "Test base blueline_db: "
if docker exec mysql-lab mysql -u blueline_user -pblueline_password_2024 -D blueline_db -e "SELECT * FROM test_table;" > /dev/null 2>&1; then
    echo "✅ OK"
    echo "Données de test:"
    docker exec mysql-lab mysql -u blueline_user -pblueline_password_2024 -D blueline_db -e "SELECT * FROM test_table;"
else
    echo "❌ ERREUR"
fi

echo "=== MySQL ready! ==="
