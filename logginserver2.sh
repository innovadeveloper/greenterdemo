#!/bin/bash

# Asegura que el directorio json exista
mkdir -p json  

# Inicializa el contador de archivos
count=1  

while true; do
    echo "Esperando conexión en el puerto 9000..."
    
    # Captura el mensaje recibido
    message=$(nc -l 9000)  
    
    # Verifica que el mensaje no esté vacío
    if [[ ! -z "$message" ]]; then  
        # Define el nombre del archivo con numeración incremental
        filename="json/file${count}.json"
        
        # Guarda el mensaje en el archivo con formato JSON indentado
        echo "$message" > "$filename"
        echo "Mensaje guardado en $filename"
        
        # Incrementa el contador para el próximo archivo
        ((count++))  
    fi
    
    echo "##################################################"
    
    # Pequeña pausa antes de reiniciar
    sleep 1  
done
