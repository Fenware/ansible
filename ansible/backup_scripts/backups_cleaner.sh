#!/bin/bash

cleanLastWeek() {
  # Dejando un backup por dia de la última semana
  date=$(date +%Y/%m/%d -d "-7 days")
  #echo "----------------"
  #echo "Fecha: $date"
  #echo "----------------"
  year=$(echo $date | cut -f1 -d"/")
  month=$(echo $date | cut -f2 -d"/")
  day=$(echo $date | cut -f3 -d"/")

  for hour in {00..22}; do

    file="./$year/$month/$day/$hour:00.gz"

    if [ -f $file ]; then

      rm -f $file

    #else

      #echo -e "\033[0;31m El backup no existe"

    fi

  done

  #echo -e "$(tput sgr0) ****Backups eliminados correctamente****"

  #echo -e "$(tput sgr0) Backup mantenido: ./$year/$month/$day/23:00.gz"
}

cleanLastTwoMonths() {
  twoMonthsBefore=$(date +%Y/%m/%d -d "-2 months")

  year=$(echo $twoMonthsBefore | cut -f1 -d"/")
  month=$(echo $twoMonthsBefore | cut -f2 -d"/")
  day=$(echo $twoMonthsBefore | cut -f3 -d"/")
  
  for day_num in {01..06}; do
    folder="./${year}/${month}/${day_num}"
    #echo $folder
    rm -rf $folder
  done

  for day_num in {08..13}; do
    folder="./${year}/${month}/${day_num}"
    #echo $folder
    rm -rf $folder
  done

  for day_num in {15..20}; do
    folder="./${year}/${month}/${day_num}"
    #echo $folder
    rm -rf $folder
  done

  for day_num in {22..27}; do
    folder="./${year}/${month}/${day_num}"
    #echo $folder
    rm -rf $folder
  done

  for day_num in {29..31}; do

    folder="./${year}/${month}/${day_num}"
    
    if [ -d $folder ]; then

      rm -rf $folder
    
    fi
  done
}

cleanLastYear(){
  twoYearsBefore=$(date +%Y/%m/%d -d "-2 year")

  year=$(echo $twoYearsBefore | cut -f1 -d"/")
  month=$(echo $twoYearsBefore | cut -f2 -d"/")

  for monthFor in {01..12};do

    for dayFor in 07 14 21; do
      folder="./${year}/${monthFor}/${dayFor}"

      if [ -d $folder ]; then

        rm -rf $folder

      fi

    done

  done

}

param=$1

if [ "$param" == "--last-week" ];then
  cleanLastWeek
elif [ "$param" == "--last-two-months" ];then
  cleanLastTwoMonths
elif [ "$param" == "--last-year" ];then
  cleanLastYear
fi