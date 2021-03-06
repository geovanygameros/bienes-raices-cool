# Bienes Raices Cool

Bienes Raices Cool es una plataforma que permite a los usuarios encontrar la casa 
o el departamento de sus sueños de una forma muy rápida y divertida


## Requerimientos

Para correr el proyecto hay que tener instalados los siguientes paquetes

* Ruby 2.5.1

* MySQL o MariaDB

* ImageMagick



## Configuración inicial
Para instalar todas las gemas necesarias para el proyecto, ejecutamos el siguiente comando:

```
bundle
```

Para crear e inicializar la base de datos:

```
rake db:create
rake db:migrate
```

La aplicación se sincroniza con un XML brindado por Easy Broker. Para la sincronización se
ejecuta el task llamado `update_properties`. Para ejecutar el task de forma manual hay que usar el siguiente comando:

```
rake update_properties
```

La primera vez que se ejecuta el task puede tardar algunos minutos, dependiendo de tu conexión a Internet, ya que descarga todas las imágenes
del XML. ¡Por favor, sé paciente!


Las próximas veces que se ejecute el task el tiempo será mucho menor, ya que sólo crea las propiedades nuevas y elimina (pone estatus de eliminado) las que ya no están en el XML.
Lo mismo pasa con las imágenes. 

En la raiz del proyecto se encuentra un script de bash llamado `update_properties.sh` así que también podemos actualizar la información con el comando:
```
./update_properties.sh
```

**Nota: no es necesario esperar a que termine el task para usar iniciar el proyecto, puedes abrir otra terminal y continuar con los pasos siguientes.**

### Actualización de datos automática
Obviamente no queremos tener que ejecutar manualmente el task cada vez que deseemos que se actualice la información, por eso vamos a hacer uso de `cron`.

Para programar la ejecución de un script en cron hay que modificar el archivo `crontab`

```
crontab -e
```

Crontab es un archivo con todas las tareas a ejecutar con cron.

Nosotros queremos que la actualización de los datos sea a cada 8 horas, para eso agregamos la siguiente línea de texto en nuestro archivo crontab.

```
0 */8 * * * /bin/bash -l -c [path-del-proyecto]/update_properties.sh
```

Guardamos el archivo y listo, el script se ejecutará a cada 8 horas. Si se desea cambiar la frecuencia del script, sólo hay que modificar el crontab. Aquí hay información para programar tareas en crontab https://crontab.guru

### Probar el código

El proyecto incluye pruebas unitarias para los controladores y modelos. Para ejecutar las pruebas hay que correr el comando `rails test`.

El comando arrojará información sobre cuántas pruebas se hicieron, cuántas fallaron y cuántas pasaron exitosamente.

### Uso de la aplicación
Una vez que completamos los pasos anteriores símplemente ejecutamos el comando `rails s` y abrimos un navegador en la siguiente url: `http://localhost:3000`.

## Información extra
* El proyecto usa HAML en lugar de ERB, de esta forma escribimos menos etiquetas y es más claro el código.

* Para aligerar la carga del servidor, en lugar de utilizar paginación la aplicación utiliza infinite scroll. En un principio al usuario sólo le aparecen 50 resultados y conforme va haciendo scroll van apareciendo más anuncios de propiedades. Infinite scroll brinda una mejor experiencia de usuario que la paginación ya que no es necesario cargar otra página para seguir viendo resultados.

* También se implementó un sistema de búsqueda para filtrar los resultados por el número de habitaciones y por rango de precios.

* Aun falta trabajar en la interfaz gráfica. pero se puede echar un vistazo a la idea general.

* Si se necesita mayor flexibilidad con los objetos, una buena opción es usar mongoDB como manejador de bases de datos. Hay una gema que permite utilizar mongoDB con objetos de Ruby `mongoid`

>Hay algo más importante que la lógica: la imaginación.
>Alfred Hitchcock (1899-1980) 


