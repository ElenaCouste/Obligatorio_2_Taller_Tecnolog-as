#!/bin/bash

#Ruta para ir al repositorio donde se encuentra el proyecto.
cd /c/desktop/ORT/Obligatorio_2

# git diff-index --quiet HEAD -- comprueba si hay cambios en el repositorio.
# Si no hay cambios, muestra un mensaje y lo manda al archivo README.md del repositorio.
if [[git diff-index --quiet HEAD --]]; then
    echo "No hay cambios para commitear"
    echo "No hay cambios para commitear" >> README.md
else 
    # De lo contrario, obtenemos el numero de lineas modificadas en el archivo del repositorio desde el último commit. 
    lineasModificadas=$(git diff --stat | tail -n 1)
    echo "Líneas modificadas: $lineasModificadas"
    
    # Se hace un commit y push de los cambios.
    git add .
    git commit -m "Commit automático semanal"
    git push origin main
    
    # Mandamos la informacion al archivo README.md del repositorio.
    echo "Commit automático semanal: $lineasModificadas" >> README.md
fi

bash -c "/c/desktop/ORT/Obligatorio_2/script.sh"