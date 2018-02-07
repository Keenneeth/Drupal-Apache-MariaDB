echo "Contenidor Datacontainer"
docker create --name datacontainer -v /drupal_data/:/var/www/html/ -v /mysql_data/:/var/lib/mysql centos

echo "Configurar la xarxa"
docker network create wordsql

echo "Contenedor db"
docker run -itd -p 3306:3306 -e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE1=wordb -e MYSQL_USER1=keenneeth -e MYSQL_PASSWORD1=keenneeeth --volumes-from datacontainer --network wordsql --name db orboan/dcsss-mariadb

echo "Contenedor Nginx-PHP"
docker run -itd -p 80:80 --volumes-from datacontainer --name apache --network wordsql keenneeth/drupal-apache
