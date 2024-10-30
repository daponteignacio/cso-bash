# * crea 25 directorios
if [ -e ruta ]; then
	rm -rf ruta
fi
mkdir ruta

for (( i = 0; i < 25 ; i++ ))
do
	mkdir "ruta/directorio$i"
done

# * crea 15 archivos
for (( i = 0; i < 15 ; i++ ))
do
	touch "ruta/file$i"
done

# * cambia permisos de los archivos de numero par
for (( i = 0; i < 15 ; i++ ))
do
	if [ $(($i % 2)) -eq 0 ]
	then
		chmod 477 "ruta/directorio$i"
	else
		chmod 277 "ruta/directorio$i"
	fi

	stat -c %a "ruta/directorio$i"
done

if [ $# -eq 0  ]
then 
	echo "Debe ingresar al menos 1 parámetro"
fi

no_existen=0
for param in "$@"; do

	if [ ! -e $param ]; then
		echo "$param no es un elemento del filesystem"
		((no_existen++))
		continue
	fi


	for ruta in $(ls -a $1)
	do
		if [ -d $1/$ruta ] 
		then
			echo "$ruta es un directorio"
			permisos=$(stat -c "%a" $1/$ruta)
			permisos=$(($permisos % 1000))
			permisos=$(($permisos / 100))

			if [ $permisos -eq 4 ]
			then
				tar -czvf "${1}/${ruta}.tar.gz" $1/$ruta
			fi

			if [ $permisos -eq 2 ]
			then
				rm -rf $1/$ruta
			fi
		fi

		if [ -f $1/$ruta ]
		then
			echo "$ruta es un archivo  - comprimiendo..."
			tar -czvf "${1}/${ruta}.tar.gz" $1/$ruta

			if [ $? -eq 0 ]
			then
				rm -r $1/$ruta
			fi
		fi
	done
done

echo "La cantidad de parametros no validos es $no_existen"