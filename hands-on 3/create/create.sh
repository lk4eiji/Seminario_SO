#!/bin/bash
# Crear un archivo mytext y agregar "Hola Mundo"
echo "Hola Mundo" > mytext

# Mostrar el contenido de mytext
echo "Mostrando el contenido de mytext:"
cat mytext

# Crear el directorio backup
mkdir backup

# Mover el archivo mytext al directorio backup
mv mytext backup/

# Mostrar el contenido del directorio backup
echo "Listando el contenido del directorio backup:"
ls backup/

# Eliminar el archivo mytext del directorio backup
echo "Eliminando archivo mytext de backup"
rm backup/mytext

# Eliminar el directorio backup
rmdir backup
echo "Eliminando el directorio backup"
