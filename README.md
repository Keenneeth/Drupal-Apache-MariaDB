# Drupal-Apache-MariaDB
 El contenidor Datacontainer:
Canviar el document root per tal de guardar les dades a /wordpress_data :
docker create --name datacontainer -v /wordpress_data/:/var/www/html -v /mysql_data/:/var/lib/mysql centos
Abans de tot eliminar les dades de Wordpress i MySql del exercici anterior
El contenidor Base de dades:
docker run -itd -p 3306:3306 -e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE1=wordb -e MYSQL_USER1=keenneeth -e MYSQL_PASSWORD1=keenneeeth --volumes-from datacontainer --network wordsql --name db orboan/dcsss-mariadb 
La imatge de Apache amb Drupal 
Per poder entrar ha IP/install.php
