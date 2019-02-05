#!/bin/bash
ctab="/root/crontab"
passsql="ser16pum"
baseall="/root/baseall.sql"
#PREFIX='/root/'`hostname -s`-`date +%F`
PREFIX='/root/'`hostname -s`
DATE=''
/usr/bin/crontab -l > $ctab
cad="/root/.cadaverrc"
/usr/bin/mysqldump -u root -p$passsql  --all-databases > $baseall




#восстановить дамп можно командой:
# mysql -u [user_name] -p < mysql_dump.sql.
/sbin/route -n > /root/route

/sbin/ifconfig -a > /root/ifconfig-a

#/usr/sbin/backup-manager

/bin/tar -czpf /var/archives/gate-etc.tar.gz /etc
/bin/tar -czpf /var/archives/gate-root.tar.gz /root
/bin/tar -czpf /var/archives/gate-usr-local.tar.gz /usr/local
/bin/tar -czpf /var/archives/gate-var-www.tar.gz /var/www

/bin/cp /share/backup/`/bin/ls -t --reverse /share/backup/ | /usr/bin/tail -n 1` /var/archives/backup-server1c-bases1c-last.rar
/bin/cp /share/backup/`/bin/ls -t --reverse /share/backup/ | /usr/bin/tail -n 2 |head -n 1` /var/archives/backup-server1c-bases1c-first.rar




/bin/echo "open https://webdav.yandex.ru" > $cad


for f in `ls /var/archives` ; do
    /bin/echo "put /var/archives/$f" >> $cad
        # do some stuff here with "$f"
    # remember to quote it or spaces may misbehave
done



/bin/echo "quit" >> $cad

/usr/bin/cadaver --rcfile=$cad
#tar -czpf /var/archives/archive-name.tar.gz ./newkeydebianrepo/
#ls -t --reverse /share/backup/ | tail -n 1
rm -f /var/archives/*