#!/bin/bash
#Elena Couste - 333562
#Martín Valetta - 251093
#Massimo Cantú - 237773

#Ruta para ir al repositorio donde se encuentra el proyecto.
cd ~/Desktop/ORT/TT1/Obligatorio_2_Taller_Tecnolog-as

# git diff-index --quiet HEAD -- comprueba si hay cambios en el repositorio.
# Si no hay cambios, muestra un mensaje y lo manda al archivo README.md del repositorio.
if [[git diff-index --quiet HEAD]]; then
    echo "No hay cambios para commitear"
    echo "No hay cambios para commitear" >> README.md
else 
    # De lo contrario, obtenemos el numero de lineas modificadas en el archivo del repositorio desde el último commit. 
    lineasModificadas=$(git diff --stat | tail -n 10)
    echo "Líneas modificadas: $lineasModificadas"
    # Se hace un commit y push de los cambios.
    fechaDia=$(date +"%d-%m-%Y")
    git add .
    git commit -m "Commit automático semanal {$fechaDia}"
    git push origin main
    echo $fechaDia
    
    # Mandamos la informacion al archivo README.md del repositorio.
    echo "Commit automático semanal: $lineasModificadas" >> README.md
fi