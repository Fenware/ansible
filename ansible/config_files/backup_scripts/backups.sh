#!/bin/bash

######### La idea es pasar estas variables desde ansible
host=172.16.213.130
user=backup

db_user=root
db_pass=mnoseadmin1234
db_name=chathink
#########

absolute_route="/home/${user}/backups"

year=$(date +%Y)
month=$(date +%m)
day=$(date +%d)
hour=$(date +%F_%T)

### Si no existe el directorio del año en backups lo crea
if [ ! -d "${absolute_route}/${year}" ]; then
  mkdir $absolute_route/$year
fi

### Si no existe el directorio del mes en backups lo crea
if [ ! -d "${absolute_route}/${year}/${month}" ]; then
  mkdir $absolute_route/$year/$month
fi

### Si no existe el directorio del dia en backups lo crea
if [ ! -d "${absolute_route}/${year}/${month}/${day}" ]; then
  mkdir $absolute_route/$year/$month/$day
fi

# Chequeo que no exista un backup con la misma hora
if [ ! -f "${absolute_route}/${year}/${month}/${day}/${hour}.gz" ]; then
  # Hago el dump y me traigo el archivo sql
  cd $absolute_route/$year/$month/$day
  ssh $user@$host mysqldump -u $db_user -p$db_pass --databases $db_name >"backup.sql"

  # Comprimo el sql
  gzip -cvN backup.sql >$hour.gz
  # Elimino el .sql
  rm backup.sql
fi
