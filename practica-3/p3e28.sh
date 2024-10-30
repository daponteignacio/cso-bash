if [ ! $1 ]; then
    echo "El directorio no existe"
    exit 4
fi

lectura=0
escritura=0

for path in "$(ls $1)"; do 

    echo "$1/$path"
done

