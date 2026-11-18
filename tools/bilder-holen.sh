#!/usr/bin/env bash
# Lädt alle Bilder und das Video von der alten WordPress-Seite in dieses Repo (macOS/Linux).
#   bash tools/bilder-holen.sh
set -u
cd "$(dirname "$0")/.."
quelle="https://www.sonneborns.de/wp-content/uploads/"
while IFS= read -r datei; do
  [ -z "$datei" ] && continue
  ziel="wp-content/uploads/$datei"
  [ -f "$ziel" ] && { echo "vorhanden  $datei"; continue; }
  mkdir -p "$(dirname "$ziel")"
  if curl -fsSL "$quelle$datei" -o "$ziel"; then echo "geladen    $datei"; else echo "FEHLER     $datei"; rm -f "$ziel"; fi
done < tools/bilder-liste.txt
