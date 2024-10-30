# 25. Realice un script que agregue en un arreglo todos los nombres de los usuarios del sistema pertenecientes al grupo “users”. Adicionalmente el script puede recibir como parametro:
    # “-b n”: Retorna el elemento de la posición n del arreglo si el mismo existe. Caso
    # contrario, un mensaje de error.
    # “-l”: Devuelve la longitud del arreglo
    # “-i”: Imprime todos los elementos del arreglo en pantalla

if [ "$1" == "-b" ] && [ "$2" == "n" ]; then
    echo "primera opcion"
fi

if [ "$1" == "-l" ]; then
    echo "segunda opcion"
fi

if [ "$1" == "-i" ]; then
    echo "tercera opcion"
fi