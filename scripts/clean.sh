#!/bin/bash

if [ -z "$WS_HOME" ]; then
    echo "Need to set environment variable WS_HOME, run command: bash> . ./setenv"
    exit 1
fi

echo "stopping mysql..."
$WS_HOME/mysqlsrc/bin/mysqladmin -S$WS_HOME/mysql.sock -uroot -proot shutdown
$WS_HOME/mysqlsrc/bin/mysqladmin -S$WS_HOME/mysql.sock -uroot shutdown

echo "Press <ENTER> to continue"
echo "Next step we will remove datadir and my.cnf"
read

rm -fr $WS_HOME/mysqldata/*
rm -f $WS_HOME/my.cnf

echo "Done!"
du -sh $WS_HOME/
