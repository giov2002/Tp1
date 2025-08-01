#!/bin/bash
echo "=== Test de mise à jour zero-downtime ==="
echo "Démarrage du test de charge..."

# Fonction de test continu
test_service() {
    local url=$1
    local name=$2
    echo "Test continu sur $name ($url)..."
    
    for i in {1..30}; do
        result=$(curl -s -o /dev/null -w "%{http_code}" $url)
        if [ "$result" = "200" ]; then
            echo "[$i] $name: OK (200)"
        else
            echo "[$i] $name: ERREUR ($result)"
        fi
        sleep 2
    done
}

# Lancer le test en arrière-plan
test_service "http://localhost:8080" "Apache" &
test_service "http://localhost:8081" "Nginx" &
test_service "http://localhost:8082" "LoadBalancer" &

echo "Tests lancés en arrière-plan. Vous pouvez maintenant modifier et redéployer les services..."
wait
