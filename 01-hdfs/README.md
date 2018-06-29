# Hadoop - HDFS
## Curso Citizen Data Scientist - CAOBA
### Profesor: Edwin Montoya M. – emontoya@eafit.edu.co
## 2018

# Laboratorio HDFS

## 1. Conexión al cluster Hadoop

Ambari Web

    https://horton80.dis.eafit.edu.co
    https://horton115.dis.eafit.edu.co

Terminal:

    https://shell80.dis.eafit.edu.co
    https://shell115.dis.eafit.edu.co

Usuarios:

    username: cds##bog1
    password: <enviado por email>

## 2. Gestión de archivos en HDFS vía Terminal

1. Cargar los datos de los datasets de trabajo del curso en HDFS 
2. Cada alumno creara en hdfs un directorio 'datasets'
3. En ese 'datasets' los archivos ya deben estar descomprimidos para ser procesables.
4. Datasets: [DATASETS](../datasets)

### Listar archivos HDFS

Para efectos de esta guia, es equivalente el comando "hadoop fs" y "hdfs dfs". La diferencia es que "hdfs dfs" es solo para sistemas de archivos HDFS, pero "hadoop fs" soporta otros adicionales como S3.

    user@master$ hdfs dfs -ls /
    user@master$ hdfs dfs -ls /user
    user@master$ hdfs dfs -ls /user/<username>
    user@master$ hdfs dfs -ls /datasets

### Crear tu propio directorio de 'datasets' en HDFS

    user@master$ hdfs dfs -mkdir /user/<username>
    user@master$ hdfs dfs -mkdir /user/<username>/datasets

Nota: reemplace “<username>” por aca usuario asignado

### Copiar archivos locales (al servidor gateway) hacia HDFS

Se asume que tiene los datos LOCALES se encuentran en /datasets
Tambien están en este github, y por terminal debería copiarlos por SSH/SCP al servidor Gateway por la VPN (no disponible para este curso)
Lo podrá hacer desde su PC vía Ambari Web 


    user@master$ hdfs dfs -mkdir /user/<username>/datasets/gutenberg

    user@master$ hdfs dfs -put /datasets/gutenberg/gutenberg-small.zip /user/<username>/datasets/gutenberg/

    (realmente los archivo .zip en hdfs no son procesables, deberá subir los archivos descomprimidos, como lo haces?)

otro comando para copiar:

    user@master$ hdfs dfs -copyFromLocal /datasets/gutenberg/gutenberg-small.zip /user/<username>/datasets/gutenberg/

listar archivos: 

    user@master$ hdfs dfs -ls /user/<username>/datasets
    user@master$ hdfs dfs -ls /user/<username>/datasets/gutenberg

### Copiar archivos de HDFS hacia el servidor local (gateway)

    user@master$ hdfs dfs -get /user/<username>/gutenberg/gutenberg-small.zip ~<username>/mis_datasets/    (el directorio 'mis_datasets' debe estar creado)

otro comando para traer:

    user@master$ hdfs dfs -copyToLocal /user/<username>/gutenberg/gutenberg-small.zip ~<username>/mis_datasets/

    user@master$ ls -l mis_datasets

### Probar otros commandos

Se aplica los siguientes comandos a:

    user@master$ hdfs dfs -<command>

comandos:

    du <path>             uso de disco en bytes
    mv <src> <dest>       mover archive(s)
    cp <src> <dest>       copiar archivo(s)
    rm <path>             borrar archive(s)
    put <localSrc> <dest-hdfs> copiar local a hdfs
    cat <file-name>       mostrar contenido de archivo
    chmod [-R] mode       cambiar los permisos de un archivo
    chown <username> files   cambiar el dueño de un archivo
    chgrp <group> files      cambiar el grupo de un archivo

## 3. Gestion de archivos vía Ambari Web:

* Login

![login](ambari/Ambari-hdfs-01.png)

![login](ambari/Ambari-hdfs-02.png)

![login]ambari/Ambari-hdfs-03.png)

* Opciones de usuario

![Opciones](ambari/Ambari-hdfs-04.png)

![Opciones](ambari/Ambari-hdfs-05.png)

* Listar directorio Home del usuario

![Home](ambari/Ambari-hdfs-06.png)

* Crear un directorio

![Crear directorio](ambari/Ambari-hdfs-07.png)

![Crear directorio](ambari/Ambari-hdfs-08.png)

* Subir (upload)  un directorio

![Subir archivo](ambari/Ambari-hdfs-09.png)

![Subir archivo](ambari/Ambari-hdfs-10.png)

* Cambiar permisos de archivo o directorio

![Cambiar permisos](ambari/Ambari-hdfs-11.png)

* Ver contenido de un archivo

![Ver archivo](ambari/Ambari-hdfs-12.png)