#!/bin/bash

# Parámetro que debes ajustar
DEVICE="/dev/sda"      # Disco donde crear la partición (por ejemplo /dev/sda)
PART_NUM=3             # Número de la partición a crear (por ejemplo 3)
PART_SIZE="+20G"       # Tamaño de la partición (20 GB)

# Función para verificar si eres root
function check_root() {
  if [ "$EUID" -ne 0 ]; then
    echo "Este script debe ejecutarse como root."
    exit 1
  fi
}

# Crear partición swap con fdisk
function crear_particion_swap() {
  echo "Creando partición swap en $DEVICE..."
  
  # Crear una partición primaria usando fdisk en modo script
  echo -e "n\np\n$PART_NUM\n\n$PART_SIZE\nt\n$PART_NUM\n82\nw" | fdisk "$DEVICE"
  
  if [ $? -ne 0 ]; then
    echo "Error creando la partición"
    exit 1
  fi

  # La nueva partición será $DEVICE$PART_NUM, ejemplo: /dev/sda3
  PARTITION="${DEVICE}${PART_NUM}"

  echo "Partición creada: $PARTITION"

  # Formatear swap
  echo "Formateando $PARTITION como swap..."
  mkswap "$PARTITION" || { echo "Error formateando swap"; exit 1; }

  # Activar swap
  echo "Activando swap en $PARTITION..."
  swapon "$PARTITION" || { echo "Error activando swap"; exit 1; }

  echo "Swap activado:"
  swapon --show
}

check_root
crear_particion_swap

echo "Proceso de creación y activación de swap completado."

