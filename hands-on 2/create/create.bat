@echo off
:: Crear archivo mytext.txt y agregar "Hola Mundo"
echo Hola Mundo > mytext.txt

:: Mostrar el contenido de mytext.txt
echo Mostrando el contenido de mytext.txt:
type mytext.txt

:: Crear un subdirectorio backup
mkdir backup

:: Copiar el archivo mytext.txt al subdirectorio backup
copy mytext.txt backup

:: mostrar contenido del subdirectorio backup
echo Listando el contenido del subdirectorio backup:
dir backup

:: Eliminar el archivo mytext.txt del subdirectorio backup
del backup\mytext.txt

:: Eliminar subdirectorio backup
rmdir backup

echo subdirectorio backup eliminado
