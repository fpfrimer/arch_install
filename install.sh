#!/bin/bash

echo "Iniciando instalação..."

# Verificar tipo de boot BIOS ou EFI

if [ -d "/sys/firmware/efi/efivars" ]
then
    echo "EFI." 
else
    echo "BIOS."
fi

# Habilitando NPT

