#!/bin/bash

echo "Iniciando instalação..."

# Verificar tipo de boot BIOS ou EFI
echo "Verificando tipo de boot"
echo

if [ -d "/sys/firmware/efi/efivars" ]
then
    echo "Detectado EFI." 
    TIPO_BOOT=1
else
    echo "Detectado BIOS."
    TIPO_BOOT=0
fi

# Habilitando NPT
echo "Habilitando NPT"
timedatectl set-ntp true

# Procura os discos do computador
disk=()
size=()
name=()
while IFS= read -r -d $'\0' device; do
    device=${device/\/dev\//}
    disk+=($device)
    name+=("`cat "/sys/class/block/$device/device/model"`")
    size+=("`cat "/sys/class/block/$device/size"`")
done < <(find "/dev/" -regex '/dev/sd[a-z]\|/dev/vd[a-z]\|/dev/hd[a-z]' -print0)

echo
echo "Listando discos..."
echo
echo -e "Opção\tDisco\tNome\tTamanho"
echo

for i in `seq 0 $((${#disk[@]}-1))`; do
    echo -e "($i)\t${disk[$i]}\t${name[$i]}\t${size[$i]}"
done
