# RETO_10

El reto en esta actividad consiste en forzar un estado inconsistente en una base de datos central para el funcionamiento de muchas herramientas de Big Data (ZooKeeper).

## Herramientas

Para realizar la actividad se propone el uso de el cluster de ZooKeeper incluido en este repositorio (basado en https://github.com/lukeolbrish/examples/tree/master/zookeeper/five-server-docker), pero se puede realizar con cualquier cluster de ZooKeeper sobre el que se tenga control para realizar pruebas. El ejercicio es mas sencillo con un cluster de 3 servidores.

## Procedimiento de trabajo

El sistema de pruebas se arranca con un docker-compose up. A partir de ahi, se pueden realizar las siguientes acciones:

- Crear y actualizar datos usando "docker-compose run --rm zkcli -server zookeeperX" y "create /hola 123" o "set /hola 321".
- Matar y levantar cada uno de los docker de ZooKeeper con "docker-compose stop zookeeperX" y "docker-compose start zookeeperX", donde X es un numero del 1 al 3.

El objetivo sera que se alcance un estado en el que se lea un valor distinto de un dato dependiendo del servidor de ZooKeeper al  que  estemos conectados dentro del mismo cluster (obviamente todos los miembros del cluster deberian presentar el mismo valor de  todos  los datos). Es decir:

- Me connecto a un servidor con "docker-compose run --rm zkcli -server zookeeper3" hago "get /hola", el valor que se ve en la primera linea es 123.

- Me connecto a otro servidor con "docker-compose run --rm zkcli -server zookeeper1" hago "get /hola", el valor que se ve en la primera linea es 321.
