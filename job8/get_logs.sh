jour=$(date +%d-%m-%y)
heure=$(date +%H-%M)
fichier=number_connection-$jour-$heure

sudo grep -c "session opened" /var/log/auth.log > $fichier
tar -cf $fichier.tar.gz $fichier 

mv $fichier.tar.gz /home/abde/Bureau/shell.exe/job8/Backup/
rm $fichier


