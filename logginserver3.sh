#!/bin/bash

# Directorio donde están los archivos PHP
PHP_DIR="/Users/kenny/Projects/PHPProjects/greenter/examples"

# Directorio donde se guardarán los archivos JSON
JSON_DIR="/Users/kenny/Projects/PHPProjects/greenter/json"

# Asegura que el directorio json exista
mkdir -p "$JSON_DIR"  

# Genera una lista de archivos PHP en el directorio (sin recursividad)
php_files=("$PHP_DIR"/*.php)

# Verifica si hay archivos PHP en el directorio
if [[ ${#php_files[@]} -eq 0 ]]; then
    echo "No se encontraron archivos PHP en $PHP_DIR."
    exit 1
fi

# Inicializa el índice para recorrer la lista de archivos PHP
index=0  
total_files=${#php_files[@]}

while true; do
    echo "Esperando conexión en el puerto 9000..."
    
    # Captura el mensaje recibido
    message=$(nc -l 9000)  
    
    # Verifica que el mensaje no esté vacío
    if [[ ! -z "$message" ]]; then  
        # Obtiene solo el nombre del archivo sin la ruta completa
        filename=$(basename "${php_files[$index]}")
        
        # Define el nombre del archivo JSON en el directorio correspondiente
        json_file="$JSON_DIR/$filename.json"
        
        # Guarda el mensaje en el archivo con formato JSON
        echo "$message" > "$json_file"
        echo "Mensaje guardado en $json_file"
        
        # Incrementa el índice y reinicia si llega al final
        ((index++))
        if [[ $index -ge $total_files ]]; then
            index=0
        fi  
    fi
    
    echo "##################################################"
    
    # Pequeña pausa antes de reiniciar
    sleep 1  
done
