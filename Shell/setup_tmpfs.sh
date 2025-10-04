#!/bin/bash

# Parámetros configurables
TMPFS_MOUNTPOINT="/mytmpfs"
TMPFS_SIZE="20G"
NR_INODES="10000"
TMPFS_MODE="770"  # Permisos para root y grupo sudo

function check_root() {
  if [ "$EUID" -ne 0 ]; then
    echo "Este script debe ejecutarse como root."
    exit 1
  fi
}

function crear_punto_montaje() {
  if [ ! -d "$TMPFS_MOUNTPOINT" ]; then
    echo "Creando directorio $TMPFS_MOUNTPOINT..."
    mkdir -p "$TMPFS_MOUNTPOINT"
  else
    echo "Directorio $TMPFS_MOUNTPOINT ya existe."
  fi
}

function agregar_fstab() {
  LINE="tmpfs $TMPFS_MOUNTPOINT tmpfs size=$TMPFS_SIZE,nr_inodes=$NR_INODES,mode=$TMPFS_MODE 0 0"
  grep -qxF "$LINE" /etc/fstab && {
    echo "La entrada tmpfs ya existe en /etc/fstab."
    return
  }
  echo "Añadiendo tmpfs a /etc/fstab..."
  echo "$LINE" >> /etc/fstab
}

function montar_tmpfs() {
  echo "Montando tmpfs en $TMPFS_MOUNTPOINT..."
  mount "$TMPFS_MOUNTPOINT" || { echo "Error al montar tmpfs"; exit 1; }
  
  echo "Ajustando propiedad y permisos..."
  chown root:sudo "$TMPFS_MOUNTPOINT"
  chmod 770 "$TMPFS_MOUNTPOINT"
  
  echo "tmpfs montado con permisos 770 y propiedad root:sudo."
}

check_root
crear_punto_montaje
agregar_fstab
montar_tmpfs

echo "Proceso de montaje tmpfs completado."

