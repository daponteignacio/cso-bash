inicializar() {
    array_vacio=(1 2 3 4 5 6 7 8 9 10)
}

agregar_elem() {
    array_vacio[${#array_vacio[@]}]=$1
}

eliminar_elem() {
    unset array_vacio[$1]
}

longitud() {
    echo Longitud ${#array_vacio[@]}
}

imprimir() {
    for elem in "${array_vacio[@]}"; do
        echo $elem 
    done
}

inicializar_Con_Valores() {
    array_vacio=()
    
    for ((i=0 ; i<$1; i++)); do
        array_vacio[$i]=$2
    done
}

inicializar_Con_Valores 15 7
imprimir
longitud