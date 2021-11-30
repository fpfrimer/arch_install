#!/bin/bash

echo "Iniciando instalação..."

# Verificar tipo de boot BIOS ou EFI
echo "Verificando tipo de boot"
if [ -d "/sys/firmware/efi/efivars" ]
then
    echo "Detectado EFI." 
else
    echo "Detectado BIOS."
fi

# Habilitando NPT

