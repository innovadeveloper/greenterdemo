# for file in *.php; do 
#     echo "Ejecutando: $file"
#     php "$file"
#     echo "Finalizado: $file"
#     echo "Esperando 3 segundos antes de continuar..."
#     sleep 3
#     echo "----------------------"
# done
#!/bin/bash

# Ruta fija donde están los archivos PHP
PHP_DIR="/Users/kenny/Projects/PHPProjects/greenter/examples"

# Verifica si el directorio existe
if [[ ! -d "$PHP_DIR" ]]; then
    echo "El directorio $PHP_DIR no existe."
    exit 1
fi

# Recorre los archivos PHP en la ruta fija
for file in "$PHP_DIR"/*.php; do 
    echo "Ejecutando: $file"
    php "$file"
    echo "Finalizado: $file"
    echo "Esperando 3 segundos antes de continuar..."
    sleep 3
    echo "----------------------"
done
