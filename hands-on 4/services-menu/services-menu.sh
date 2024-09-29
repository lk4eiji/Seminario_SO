#!/bin/bash

# Mostrar el menú de opciones
mostrar_menu() {
    echo "--------------------------"
    echo "  MENU DE SERVICIOS  "
    echo "--------------------------"
    echo "1. Mostrar el contenido de un directorio"
    echo "2. Crear un archivo de texto"
    echo "3. Comparar dos archivos de texto"
    echo "4. Mostrar uso del comando awk"
    echo "5. Mostrar uso del comando grep"
    echo "6. Salir"
    echo "--------------------------"
    echo -n "Elige una opción: "
}

# Función para mostrar el contenido de un directorio
listar_contenido() {
    read -p "Introduce la ruta absoluta del directorio: " directorio
    if [ -d "$directorio" ]; then
        echo "Contenido del directorio $directorio:"
        ls "$directorio"
    else
        echo "El directorio no existe o la ruta es incorrecta."
    fi
}

# Función para crear un archivo de texto
crear_archivo() {
    read -p "Introduce la cadena de texto que deseas almacenar en el archivo: " cadena
    read -p "Introduce el nombre del archivo de texto (ej. archivo.txt): " archivo
    echo "$cadena" > "$archivo"
    echo "Archivo '$archivo' creado con éxito."
}

# Función para comparar dos archivos de texto
comparar_archivos() {
    read -p "Introduce la ruta del primer archivo: " archivo1
    read -p "Introduce la ruta del segundo archivo: " archivo2

    if [ -f "$archivo1" ] && [ -f "$archivo2" ]; then
        echo "Comparando los archivos $archivo1 y $archivo2:"
        diff "$archivo1" "$archivo2"
    else
        echo "Uno o ambos archivos no existen o la ruta es incorrecta."
    fi
}

# Función para mostrar el uso de awk
mostrar_awk() {
    echo "Ejemplo del uso del comando awk:"
    echo "awk '{print \$1}' archivo.txt"
    awk {print $1} archivo.txt
    echo "Este comando imprime la primera columna del archivo 'archivo.txt'."
}

# Función para mostrar el uso de grep
mostrar_grep() {
    echo "Ejemplo del uso del comando grep:"
    echo "grep 'patrón' archivo.txt"
    echo "Este comando busca el 'patrón' dentro del archivo 'archivo.txt'."
}

# Bucle para mostrar el menú hasta que el usuario elija salir
while true; do
    mostrar_menu
    read opcion

    case $opcion in
        1)
            listar_contenido
            ;;
        2)
            crear_archivo
            ;;
        3)
            comparar_archivos
            ;;
        4)
            mostrar_awk
            ;;
        5)
            mostrar_grep
            ;;
        6)
            echo "Saliendo del script..."
            exit 0
            ;;
        *)
            echo "Opción no válida. Inténtalo de nuevo."
            ;;
    esac
    echo "Presiona Enter para continuar..."
    read
done
