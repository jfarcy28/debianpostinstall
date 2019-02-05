#!/bin/bash

echo "-- Script Post-install --"

### Modification du source.list

echo "Archivage du fichier sources.list actuel"

cp /etc/apt/sources.list /etc/apt/sources.list-BACKUP

echo "Ajout du nouveau fichier sources.list"

PATH=$(dirname $0)/sources.list
cp $PATH /etc/apt/

### Installation des applications et drivers imprimantes

apt -y install firefox-esr-l10n-fr libreoffice-l10n-fr
apt -y install printer-driver-all cups-pdf

### Installation de l'imprimante
