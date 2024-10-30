arr=()

usuarios_con_patron() {
    echo $1
}

cantidad() {
    local cantidad=${#arr[*]}
    echo $cantidad
}

usuarios() {
    local cant=$(cantidad)

    for (( i = 0; i < cant; i++ ))
    do
        echo ${arr[$i]}
    done
}


i=0
for user in $(cut -d ":" -f 1 /etc/passwd)
do
    arr[$i]=$user
    ((i++))
done

usuarios_con_patron sys