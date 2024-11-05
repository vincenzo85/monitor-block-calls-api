#!/bin/bash

# Directory contenente le immagini
DIRECTORY="./"  # Sostituisci con il percorso corretto

# Vai alla directory delle immagini
cd "$DIRECTORY" || exit

# Inizializza un contatore per i nuovi nomi
counter=2

# Usa find per ordinare i file per data (dal più vecchio al più recente) e processali con while
find . -maxdepth 1 -name "*.webp" -type f -print0 | sort -z | while IFS= read -r -d '' file; do
    # Costruisci il nuovo nome
    new_name="immagine_${counter}.webp"
    
    # Rinomina il file
    mv "$file" "$new_name"
    
    # Incrementa il contatore
    ((counter++))
done

echo "Tutti i file sono stati rinominati in ordine cronologico con successo!"