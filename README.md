
# 📚 BIBLIOTECA DE PROMPTS TI

* Autor: jacedoe
* Última actualización: [05/10/2025]
* Formato: Texto plano
* Objetivo: Centralizar prompts útiles para tareas de administración de sistemas Windows y Linux con herramientas de IA como ChatGPT.

----------------------------------------
## 📁 CATEGORÍA: ARCHIVOS Y PERMISOS
----------------------------------------

🔹 **Prompt #012**
*   Sistema: Linux
*   Nivel: Básico
*   Descripción: Buscar archivos grandes dentro de un directorio.
*   Prompt:
  ######
    Dame un comando en Bash para buscar todos los archivos mayores a 500 MB dentro de /var y mostrar sus rutas completas y tamaño.
  
🔹 **Prompt #013**
*   Sistema: Linux
*   Nivel: Intermedio
*   Descripción: Cambiar permisos recursivamente.
*   Prompt:
  ######
     ¿Cuál es el comando para cambiar recursivamente los permisos a 644 para archivos y 755 para directorios dentro de `/opt/scripts`?

🔹 **Prompt #014**
*   Sistema: Linux
*   Nivel: Intermedio
*   Descripción: Cambiar propietario de archivos.
*   Prompt:
  ######
     Genera un comando Bash para cambiar el propietario y grupo de todos los archivos en `/var/www/html` a `www-data`.

🔹 **Prompt #015**
*   Sistema: Windows
*   Nivel: Básico
*   Descripción: Buscar archivos por nombre parcial.
*   Prompt:
  ######
     ¿Cómo puedo buscar todos los archivos que contengan "backup" en el nombre dentro de `C:\Users`, incluyendo subcarpetas, usando PowerShell?

🔹 **Prompt #016**
*   Sistema: Windows
*   Nivel: Intermedio
*   Descripción: Cambiar permisos NTFS de una carpeta.
*   Prompt:
  ######
     Dame un comando en PowerShell para dar permisos de "Lectura y ejecución" a un usuario llamado `jlopez` sobre la carpeta `D:\Proyectos`, sin afectar los permisos existentes de otros usuarios.

🔹 **Prompt #017**
*   Sistema: Windows
*   Nivel: Avanzado
*   Descripción: Establecer permisos NTFS con herencia desactivada.
*   Prompt:
  ######
     ¿Cómo puedo usar PowerShell para desactivar la herencia en la carpeta `D:\Seguridad\Informes` y asignar permisos exclusivos de solo lectura a los grupos `Auditores` y `Contabilidad`?

----------------------------------------
## 📁 CATEGORÍA: GESTIÓN DE USUARIOS Y GRUPOS
----------------------------------------

🔹 **Prompt #001**
*   Sistema: Windows
*   Nivel: Básico
*   Descripción: Crear usuario local con privilegios de administrador.
*   Prompt:
  ######
     Genera un script de PowerShell que cree un usuario local llamado `soporte_it`, con contraseña `Pa$$w0rd123`, lo agregue al grupo `Administradores` y oculte al usuario del inicio de sesión.

🔹 **Prompt #002**
*   Sistema: Linux
*   Nivel: Intermedio
*   Descripción: Crear un nuevo usuario y asignar grupo sudo.
*   Prompt:
  ######
     Dame un script en Bash para crear un usuario llamado `analista` en Ubuntu, agregarlo al grupo `sudo` y forzar el cambio de contraseña en el primer inicio de sesión.

----------------------------------------
## 📁 CATEGORÍA: PERMISOS Y SEGURIDAD
----------------------------------------

🔹 **Prompt #003**
*   Sistema: Windows
*   Nivel: Intermedio
*   Descripción: Exportar permisos NTFS de un directorio.
*   Prompt:
  ######
     Genera un comando en PowerShell para listar los permisos NTFS de todos los archivos y carpetas dentro de `D:\Recursos` y exportarlos a un archivo CSV.

🔹 **Prompt #004**
*   Sistema: Linux
*   Nivel: Intermedio
*   Descripción: Establecer permisos y propietario en un directorio.
*   Prompt:
  ######
     ¿Cuál sería el comando para dar permisos 750 y establecer como dueño a `admin:desarrollo` sobre la carpeta `/var/www/proyecto`?

----------------------------------------
## 📁 CATEGORÍA: PROCESOS Y SERVICIOS
----------------------------------------

🔹 **Prompt #005**
*   Sistema: Windows
*   Nivel: Básico
*   Descripción: Listar servicios y su estado.
*   Prompt:
  ######
     Dame un script en PowerShell que liste todos los servicios en Windows junto a su estado (Running, Stopped, etc.).

🔹 **Prompt #006**
*   Sistema: Linux
*   Nivel: Intermedio
*   Descripción: Monitorizar procesos que usan más CPU.
*   Prompt:
  ######
     ¿Cómo puedo crear un script Bash que muestre cada 10 segundos los 5 procesos que más CPU están usando en tiempo real?

----------------------------------------
## 📁 CATEGORÍA: RED Y CONECTIVIDAD
----------------------------------------

🔹 **Prompt #007**
*   Sistema: Linux
*   Nivel: Básico
*   Descripción: Diagnóstico de red.
*   Prompt:
  ######
     Crea un script en Bash que revise conectividad a Internet, estado de DNS y rutas activas en un servidor Ubuntu.

🔹 **Prompt #008**
*   Sistema: Windows
*   Nivel: Intermedio
*   Descripción: Probar conectividad a múltiples hosts.
*   Prompt:
  ######
     Genera un script en PowerShell que lea una lista de nombres de host desde un archivo `hosts.txt` y pruebe conectividad (ping) con cada uno, mostrando los resultados.

----------------------------------------
## 📁 CATEGORÍA: AUDITORÍA Y LOGS
----------------------------------------

🔹 **Prompt #009**
*   Sistema: Windows
*   Nivel: Avanzado
*   Descripción: Consultar últimos inicios de sesión exitosos.
*   Prompt:
  ######
     Dame un script de PowerShell que lea los últimos 50 eventos de inicio de sesión exitoso desde el Visor de eventos y los muestre con fecha, usuario y dirección IP.

🔹 **Prompt #010**
*   Sistema: Linux
*   Nivel: Intermedio
*   Descripción: Ver actividad de login en el sistema.
*   Prompt:
  ######
     ¿Qué comando puedo usar para ver los últimos 10 intentos de inicio de sesión (exitosos o fallidos) en un servidor Debian?

----------------------------------------
## 📁 CATEGORÍA: AUTOMATIZACIÓN CON IA
----------------------------------------

🔹 **Prompt #011**
*   Sistema: General
*   Nivel: Avanzado
*   Descripción: Prompt maestro para generación de scripts.
*   Prompt:
  ######
     Actúa como un administrador de sistemas. Genera scripts funcionales en PowerShell o Bash a partir de una descripción, incluyendo manejo de errores y comentarios para documentación interna.

🔹 **Prompt #012**
*   Sistema: General
*   Nivel: Intermedio
*   Descripción: Comparar diferencias entre comandos Bash y PowerShell.
*   Prompt:
  ######
     Dame una tabla que compare cómo se realiza la búsqueda de archivos, gestión de servicios y permisos entre Bash (Linux) y PowerShell (Windows).

🔹 **Prompt #013**
*   Sistema: Windows
*   Nivel: Avanzado
*   Descripción: Automatizar tareas administrativas comunes.
*   Prompt:
  ######
     Genera un script en PowerShell que realice estas tareas: borrar archivos temporales, reiniciar el servicio de red, y enviar un log por correo si el espacio libre en disco es menor al 20%.

🔹 **Prompt #014**
*   Sistema: Linux
*   Nivel: Avanzado
*   Descripción: Generar script de mantenimiento para servidor.
*   Prompt:
  ######
     Crea un script Bash para Ubuntu que haga backup de `/etc`, limpie logs antiguos, actualice el sistema y notifique por correo si algún paquete falla al actualizar.

🔹 **Prompt #015**
*   Sistema: General
*   Nivel: Intermedio
*   Descripción: Generar documentación técnica desde una tarea.
*   Prompt:
  ######
     Quiero que me generes una guía técnica paso a paso para crear un usuario con acceso limitado a una carpeta compartida, en Windows Server 2019, usando GUI y PowerShell.

🔹 **Prompt #016**
*   Sistema: General
*   Nivel: Básico
*   Descripción: Crear checklist técnico para mantenimiento preventivo.
*   Prompt:
  ######
     Genera un checklist para mantenimiento preventivo mensual de un servidor Linux, con tareas como verificación de logs, espacio en disco, estado de servicios, y seguridad.

🔹 **Prompt #017**
*   Sistema: Windows
*   Nivel: Intermedio
*   Descripción: Crear política de grupo desde cero.
*   Prompt:
  ######
     Redáctame los pasos para crear una GPO que impida la ejecución de `.exe` en dispositivos USB en un entorno de Active Directory, e incluye el prompt para verificarlo desde PowerShell.

🔹 **Prompt #018**
*   Sistema: General
*   Nivel: Intermedio
*   Descripción: Generar resumen de logs en lenguaje natural.
*   Prompt:
  ######
     Interpreta el siguiente log del sistema (pegado abajo) y dame un resumen claro de los eventos relevantes, errores y posibles causas.

🔹 **Prompt #019**
*   Sistema: General
*   Nivel: Avanzado
*   Descripción: Crear prompts para entrenamiento interno de técnicos.
*   Prompt:
  ######
     Genera una lista de 10 preguntas tipo prompt para evaluar el conocimiento de un técnico junior en administración de usuarios, permisos y servicios en Windows y Linux.

