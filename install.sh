#!/bin/bash

echo "Iniciando instalação..."

# Verificar conexão com a interent
nc -z 8.8.8.8 53  >/dev/null 2>&1
online=$?
if [ $online -eq 0 ]; then
    echo "Online"
else
    echo "Offline"
fi


# Habilitando NPT

