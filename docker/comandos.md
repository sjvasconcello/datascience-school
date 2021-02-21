# Apuntes Docker

```
$ newgrp docker
```


## Introduccion 


```bash
$ docker container prune # Borra todos los contenedores
```
### Correr un linux entero en dockers

```bash
$ docker run ubuntu # Descargamos el container de ubuntu

$ docker run -it ubuntu # Activar ubuntu con el modo interactivo

```



### Video 11

```bash
$ docker run --name always_up -d ubuntu tail -f /dev/null

$ docker exec # En un contenedor que ya existe y que esta corriendo, ejecutar un proceso

$ docker exec -it always_up bash

$ docker inspect --format "{{.State.Pid}}" always_up
> 16724

$ sudo kill -9 16724 # En linux este desactiva el contenedor

$ docker stop 16724 # En caso de no estar een linux esto sirve para desactivar el contenedor.
```
### Video 12 - Exponiendo contenedores
```bash
$ docker run -d --name proxy nginx # -d No vincula y lo corre en background

$ docker stop proxy # Desactiva nginx

$ docker run --name proxy -d -p 8080:80 nginx

$ docker logs --tail 10 -f <container>
```

### Video 13 - Bind Mounts

```bash
$ docker run -d --name db mongo

$ docker exec -it db bash

> mongo
> show dbs
> user platzi
> db.users.insert({"nombre": "guido"})
> exit

$ docker run -d --name db -v /home/sjvasconcello/Documents/docker/dockerdata/mongodata:/data/db # Con esto puedo crear un bind mounts
```

### Video 14 - Volúmenes
```bash

$ docker volume ls # Listar los volumenes

$ docker volume create dbdata

$ docker run -d --sanem db --mount src=dbdata,dst=/data/db mongo # Creamos un contenedor de mongo con un volumen asignado

```

### Video 15 - Insertar y extraer archivos de un contenedor
```bash
$ touch prueba.txt

$ docker run -d --name copytest ubuntu8 tail -f /dev/null

$ docker exec -it copytest bash

$ docker cp prueba.txt copytest:/test/test.txt # Para copiar un documento en un contenedor de docker

$ docker cp copytest:/test localtesting # para extraer un documento se realiza al revez

# No es necesario que este corriendo

```
#### Video 16 - Imagenes

```bash
$ docker image ls # Ver las imagenes que tenemos

$ docker pull ubuntu:20.04 # Sirve para traer imagenes

$ docker image ls # Aunque salgan dos si el ID es el mismo es simple
```

#### Comandos Utiles

```bash
$ docker kill $(docker ps -q) # Matar todos los container que estan corriendo

$ docker rm $(docker ps -a -q) # Borra todos los containers detenidos

$ docker rmi $(docker images -q) # Borra todas las imagenes

```

### Video 17

```bash
$ docker build -t ubuntu:platzi .

$ docker push # Con eso puedo pulbicar imagenes

$ docker tag ubuntu:platzi sjvasconcello/ubuntu:platzi

```

### Video 18 - Sistema de Capas

```bash
$ docker history ubuntu:platzi # Entender las instrucciones
```

### Video 19
```bash
$ git clone https://github.com/platzi/docker
$ docker build platziapp . # creo la imagen local
$ docker run --rm -p 3000:3000 platziapp
```

### Video 20
```bash
$ docker run --rm -p 3000:3000 `pwd`/index.js:/usr/src/index.js platziapp 

```
Ejemplo con python
```Dockerfile
FROM python:3
ENV PYTHONUNBUFFERED=1
RUN mkdir /code
WORKDIR /code
COPY requirements.txt /code/
RUN pip install -r requirements.txt
COPY . /code/
```

### Video 21
```bash
$ docker network ls

$ docker network create --attachable platzinet # Creamos una nueva red y usamos --attachable para que otros contenedores se puedan conectar a ella

$ docker run -d --name db mongo

$ docker network connect platzinet db

$ docker run -d --name app -p 3000:3000 --env MONGO_URL=mongodb://db:27017/test platziapp

$ docker network connect platzinet app

```

### Video 22

```bash
$ docker-compose up

$ docker-compose up -d
```

### Video 23
```bash
$ docker-compose logs <servicios>

$ docker-compose exec app bash # No se necesita -it

$ docker-compose down # Remueve las imagenes
```

### Video 25
```bash

```

### Video 26
```bash
$ docker container prune # Contenedores que estan apagados

$ docker rm -f $(docker ps -aq)

$ docker system prune # Elimina containers, images y cache

$ docker rm -f $(docker image ls -q) # Eliminar imagenes 

$ docker stats

$ docker run .d --name --memory 1g ubuntu # Maquina virtual de ubuntu con 1 gigabyte
```

### Video 27 - Deteniendo contenedores correctamente: SHELL vs. EXEC
```bash
# En la carpeta loop
$ docker build -t loop . # Creamos el contenedor de loop

$ docker run -d --name looper loop # Activasmo el contenedor

$ docker stop looper # Detiene el contendor, pero no de manera instanea

$ docker kill looper # Lo mata de golpe

$ docker exec looper ps -ef
```

### 
```bash

```


### 
```bash

```


### 
```bash

```


### 
```bash

```


### 
```bash

```

