if [ $# -eq 0 ]; then
    echo "Ingrese al menos 1 parámetro"
fi

ne=0

i=0
for path in "$@"; do
    if [ $(($i % 2)) -ne 0 ]; then
        if [ -e $path ]; then
            if [ -f $path ]; then 
                echo "El path $path corresponde a un archivo; pos $i"
            fi

            if [ -d $path ]; then
                echo "El path $path corresponde a un directorio; pos $i"
            fi
        else 
            ((ne++))
        fi
    fi    

    ((i++))
done

echo "El numero de paths en posiciones impares inexistentes es $ne"
