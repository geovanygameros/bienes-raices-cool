# Bienes Raices Cool

Bienes Raices Cool es una plataforma que permite a los usuarios encontrar la casa 
o el departamento de sus sueños de una forma muy rápida y divertida

Para correr el proyecto hay que tener instalados los siguientes paquetes


* Ruby 2.5.1

* MySQL o MariaDB

* ImageMagick

El proyecto usa HAML en lugar de ERB, de esta forma escribimos menos etiquetas y es más claro el código.

Para instalar todas las gemas necesarias para el proyecto, ejecutamos el siguiente comando:

```
bundle
```

Para crear e inicializar la base de datos:

```
rake db:create
rake db:migrate
```


