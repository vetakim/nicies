#!/bin/bash
#получение строки времени из секунд
function fromtimestamp() {
    HOURS=`bc <<< "scale=0;($1/3600)"`
    MINUTES=`bc <<< "scale=0;($1- $HOURS * 3600) / 60"`
    SECONDS=`bc <<< "scale=0;($1- $MINUTES * 60 - $HOURS * 3600) / 1"`
    printf "%02d:%02d:%02d" $HOURS $MINUTES $SECONDS
}
#получение секунд из строки времени в формате hh:mm:ss
function totimestamp() {
    HOURS=`echo $1 | cut -d':' -f1`
    MINUTES=`echo $1 | cut -d':' -f2`
    SECONDS=`echo $1 | cut -d':' -f3`
    bc <<< "scale=0; $HOURS * 3600 + $MINUTES * 60 + $SECONDS"
}

holidays=(06/09/18 12/21/18)
today=`date +%D`
weekday=`date +%u`
isAholiday=false

for day in $holidays;
do
    if [ $day = $today ]
    then
        WORKTIME=`totimestamp "7:45:00"`
        SYMB="Перед праздником"
        isAholiday=1
    else
        isAholiday=0
    fi
done

if [ $isAholiday -eq 0 ]
then
    case $weekday in
        [1-4]) WORKTIME=`totimestamp "8:45:00"` SYMB="Будень";;
        5) WORKTIME=`totimestamp "7:30:00"` SYMB="Пятница";;
    esac
fi

TODAY=`date +%Y-%m-%d`
#Получаем время первого за сегодня запуска компа в секундах
STARTTIMESTR=`journalctl --list-boots | grep $TODAY | sed -n 1p | awk '{print $5}'`
STARTTIME=`totimestamp $STARTTIMESTR`
#Получаем текущее время в секундах
CURRENTTIMESTR=`date +%H:%M:%S`
CURRENTTIME=`totimestamp $CURRENTTIMESTR`
#Получаем время, прошедшее с первого запуска компа
CURRENTTIME=`bc <<< "$CURRENTTIME - $STARTTIME"`

#Получаем оставшееся до конца рабочего дня время
if [ $WORKTIME -ge $CURRENTTIME ]
then
    REMAINED=`echo $WORKTIME "-" $CURRENTTIME | bc -l`
    SYMB+=" ⚐ "
    if [ $WORKTIME -eq $CURRENTTIME ]
    then
        notify-send "Рабочий день закончился"
    fi
else
    REMAINED=`echo  $CURRENTTIME "-" $WORKTIME | bc -l`
    SYMB+=" ⚑ переработка "
fi

#Выводим на печать оставшееся до конца рабочего дня время
echo -n $SYMB
fromtimestamp $REMAINED

