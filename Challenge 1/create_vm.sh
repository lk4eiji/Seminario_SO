#!/bin/bash

if [ "$#" -ne 7 ]; then
  echo "Uso: $0 <Nombre_VM> <Tipo_SO> <CPUs> <RAM_GB> <VRAM_MB> <Tamaño_Disco_GB> <Controlador_SATA>"
  exit 1
fi

# Asignar argumentos a variables
NOMBRE_VM=$1
TIPO_SO=$2
CPUS=$3
RAM_GB=$4
VRAM_MB=$5
TAMANIO_DISCO_GB=$6
CONTROLADOR_SATA=$7

# Ruta donde se guardará el disco duro virtual 
VIRTUAL_DISK_PATH="/home/ubuntu/Documents/seminarioSo/challenge-1/maquinasVirtuales/$NOMBRE_VM/$NOMBRE_VM.vdi"


# Crear la máquina virtual
VBoxManage createvm --name "$NOMBRE_VM" --ostype "$TIPO_SO" --register

# Configurar número de CPUs, RAM y VRAM
VBoxManage modifyvm "$NOMBRE_VM" --cpus $CPUS --memory $(($RAM_GB * 1024)) --vram $VRAM_MB

# Crear un disco duro virtual
VBoxManage createmedium disk --filename "$VIRTUAL_DISK_PATH" --size $(($TAMANIO_DISCO_GB * 1024))

# Crear y asociar el controlador SATA
VBoxManage storagectl "$NOMBRE_VM" --name "$CONTROLADOR_SATA" --add sata --controller IntelAhci
VBoxManage storageattach "$NOMBRE_VM" --storagectl "$CONTROLADOR_SATA" --port 0 --device 0 --type hdd --medium "$VIRTUAL_DISK_PATH"

# Crear y asociar el controlador IDE para CD/DVD
CONTROLADOR_IDE="IDE_Controller"
VBoxManage storagectl "$NOMBRE_VM" --name "$CONTROLADOR_IDE" --add ide --controller PIIX4
VBoxManage storageattach "$NOMBRE_VM" --storagectl "$CONTROLADOR_IDE" --port 1 --device 0 --type dvddrive --medium emptydrive

# Imprimir la configuración de la máquina virtual
echo "Configuración de la Máquina Virtual '$NOMBRE_VM':"
VBoxManage showvminfo "$NOMBRE_VM" | grep -E "(Name|CPUs|Memory|VRAM|SATA|IDE|vdi)"

echo "Máquina virtual '$NOMBRE_VM' creada y configurada correctamente"
