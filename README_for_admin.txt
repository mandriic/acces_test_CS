Dependencias:
shc (./compil.sh lo instala si no esta instalado)

Compilacion:
chmod +x ./*
./compil.sh
Entrar duracion de test en minutos.
Script va a crear una carpeta bin con 3 ficheros y README.txt muy simple para estudiantes (para empezar debes ejecutar ./run.me. Otro README esta en client).
Para empezar el test ejecutar ./run.me
Script va a crear la red de docker cybernet y cargar 3 contenedores preconfigurados. Client, dns server, web server. (client, web, dns)

Cuando se ejecuta client, en paralelo se ejecuta script que cuenta los minutos del test. Cuando pasa todo el tiempo - elimina todo, incluido imagenes de docker.
Objetivo del test es, capaz sacar informacion que esta en web servidor en index.html
En mi caso utilizo link to Typeform. Pero podemos pensar como hacerlo mas comodo para nosotros, porque hay que cambiar Typeform cada vez, o controlar bien que lo estan rellenando durante el test, no copiando uno de otro.
Para checkear si todo funciona
En client:
nslookup web.42cyber.sec 10.42.42.53
curl 10.42.42.80/index.html

Para crear propios servedores, basadas en mios:
En dockerhub creamos repositorios login/cybercli, login/cyberweb, login/cyberdns
Ejecutamos ./run.me
docker tag mandriic/cyberweb:malaga_test login/cyberweb:test
docker tag mandriic/cyberdns:2 login/cyberdns:test
docker tag mandriic/clicyber:add_hints login/cybercli:test
docker push login/cyberweb:test
docker push login/cyberdns:test
docker push login/cybercli:test
En fichero start.sh cambiamos comandos de Docker.
Esto os permite administrar servidores y cambiar index.html de web
