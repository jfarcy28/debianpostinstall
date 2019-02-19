#!/bin/bash

echo "-- Script Post-install --"

### Modification du fichier sources.list

echo "Archivage du fichier sources.list"

cp /etc/apt/sources.list /etc/apt/sources.list-BACKUP

echo "Ajout du nouveau fichier sources.list"

CHEMIN=$(dirname $0)/sources.list
echo $CHEMIN
cp $CHEMIN /etc/apt

### Mise à jour des paquets DEBIAN

echo "Mise à jour des paquets DEBIAN"

apt -q -y upgrade
apt -q -y update

### Installation des applications et des pilotes imprimantes

apt -q -y install firefox-esr-l10n-fr libreoffice-l10n-fr
apt -q -y install printer-driver-all cups-pdf cups-client

### Installation de l'imprimante

echo "Installation de l'imprimante HP Laserjet CP3525dn"

lpadmin -p 'HPLaserjetCP3525dn' -E -v 'http://192.168.1.252:631/printers/IMPRIMANTE_PDF' -P '/usr/share/ppd/cups-pdf/CUPS-PDF.ppd'
lpadmin -d 'HPLaserjetCP3525dn'
