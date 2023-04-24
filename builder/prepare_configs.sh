#!/usr/bin/bash

cp /home/vetakim/etc_pack/imkp.json $1/etc/imkp
cp /home/vetakim/etc_pack/ivo.json $1/etc/ivo
cp /home/vetakim/etc_pack/dcsf.json $1/etc/dcsf
cp /home/vetakim/regserv.xml $1/bin

cp /home/vetakim/libtypical/* $1/lib

mkdir log/6mf1
chown  vetakim:vetakim log/6mf1
mkdir log/6mf1/6mf1-okko
chown  vetakim:vetakim log/6mf1/6mf1-okko
mkdir log/6mf1/6mf1-okko/sats
chown  vetakim:vetakim log/6mf1/6mf1-okko/sats

curdir=`pwd`
export LD_LIBRARY_PATH=$curdir/lib
cd bin

./regservm stop
./regservm start
./FPO217
