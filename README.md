![Build status](https://app.travis-ci.com/andresvazquez/ActivityPlanIntellectus.svg?branch=master)
# Activity Plan Intellectus

# Proyecto de Gestión de Actividades

## Descripción

Este proyecto tiene como objetivo desarrollar una aplicación de gestión de actividades para la empresa Intellectus CC S.A. de C.V. La aplicación permitirá la asignación de tareas a empleados, el registro de horas trabajadas, la consulta de informes y la gestión eficiente de las asignaciones.

## Información del Proyecto

- **Nombre del Proyecto:** Activity Plan Intellectus
- **Desarrollador:** Andrés Eduardo Vázquez Pérez
- **Matrícula:** AL03065873
- **Curso:** Taller de productividad basada en herramientas tecnológicas
- **Profesor:** José Leonardo Villagómez Morales
- **Fecha:** 29 de noviembre del 2023

## Resumen Ejecutivo

Este proyecto es una aplicación web desarrollada en Java con una arquitectura Modelo-Vista-Controlador (MVC). Su propósito principal es gestionar asignaciones de actividades entre empleados, permitiendo el registro de horas de esfuerzo. Además, incluye funcionalidades específicas para usuarios administradores y usuarios normales.

Problema Identificado
La necesidad de gestionar de manera eficiente las asignaciones de actividades y el registro de horas de esfuerzo, así como diferenciar las funcionalidades entre usuarios administradores y usuarios normales.

Solución
Desarrollar una aplicación web MVC con Java que permita a los usuarios gestionar asignaciones, registrar horas y comentarios, y proporcionar diferentes niveles de acceso según el rol del usuario.

## Requerimientos // Arquitectura
Servidores de Aplicación y Web: Apache Tomcat 8.5.92.
Base de Datos: MySQL 8.0.35 arm64 para macOS.
Versión de Java: JDK 11 / Java SE 11.

## Tabla de Contenidos
1. [Requerimientos](#requerimientos)
2. [Instalación](#instalación)
3. [Configuración](#configuración)
4. [Uso](#uso)
5. [Contribución](#contribución)
6. [Roadmap](#roadmap)
7. [Organización](#organización)
8. [Problemática y Solución Propuesta](#problemática-y-solución-propuesta)
9. [Etapas del Proyecto](#etapas-del-proyecto)
10. [Licencia](#licencia)

## Requerimientos

### Servidores y Paquetes Adicionales

- **Servidores de Aplicación y Web:**
  - Se recomienda Apache Tomcat 8.5.92 o superior.
  - Configuración: [Guía de Configuración de Apache Tomcat](https://tomcat.apache.org/tomcat-8.5-doc/setup.html).

- **Base de Datos:**
  - MySQL 8.0.35 arm64 para macOS.
  - Configuración: Importe las tablas desde el archivo `database-schema.sql`.

- **Paquetes Adicionales:**
  - EAR libraries, JUnit 5, web app libraries.

- **Versión de Java:**
  - Se requiere JDK 11 / Java SE 11.

## Instalación

### Ambiente de Desarrollo

1. **Clonar el Repositorio:**
   - Ejecute el siguiente comando en su terminal para clonar el repositorio:
     ```bash
     git clone https://github.com/andresvazquez/ActivityPlanIntellectus.git
     ```

2. **Importar el Proyecto en Eclipse como Web Dynamic Project:**
   - Abra Eclipse y seleccione `File` > `Import` > `Existing Projects into Workspace`.
   - Navegue hasta el directorio donde clonó el repositorio y seleccione el proyecto.
   - Haga clic en `Finish` para importar el proyecto.

3. **Configurar Eclipse con Java SE 11:**
   - Verifique que Eclipse esté configurado para usar Java SE 11.
     - Vaya a `Window` > `Preferences`.
     - En `Java` > `Installed JREs`, asegúrese de que Java SE 11 esté listado y seleccionado.

4. **Configurar Apache Tomcat 8.5.92 en Eclipse:**
   - Si aún no tiene Apache Tomcat configurado en Eclipse, siga estos pasos:
     - En Eclipse, vaya a `Window` > `Preferences`.
     - En `Server` > `Runtime Environments`, haga clic en `Add...` y seleccione `Apache Tomcat v8.5`.
     - Seleccione el directorio de instalación de Apache Tomcat y haga clic en `Finish`.

5. **Configurar MySQL 8.0.35:**
   - Asegúrese de tener MySQL 8.0.35 instalado y en funcionamiento.
   - Cree una base de datos y configure las credenciales en el archivo `src/main/resources/application.properties`.
   - Importe las tablas ejecutando el script SQL proporcionado en `database-schema.sql`.

### Ejecutar Pruebas Manualmente

- Ejecute las pruebas unitarias con JUnit 5 desde Eclipse.

## Implementar en Producción (Local) - desde un WAR

### Paso 1: Instalación de Herramientas y Software

#### 1. Java Development Kit (JDK) 11:
   - Asegúrate de tener Java JDK 11 instalado. Puedes descargarlo desde [AdoptOpenJDK](https://adoptopenjdk.net/).
   - Configura las variables de entorno `JAVA_HOME` y `PATH` para apuntar a tu instalación de JDK.

#### 2. MySQL Workbench:
   - Descarga e instala MySQL Workbench desde el sitio oficial de [MySQL](https://www.mysql.com/products/workbench/).

#### 3. Apache Tomcat 8.5:
   - Descarga Apache Tomcat 8.5 desde el sitio oficial de [Apache Tomcat](https://tomcat.apache.org/download-80.cgi).
   - Descomprime el archivo descargado en un directorio de tu elección.

### Paso 2: Configuración de la Base de Datos

#### 1. MySQL Server:
   - Asegúrate de que el servidor MySQL esté en ejecución.

#### 2. MySQL Workbench:
   - Abre MySQL Workbench y conéctate al servidor MySQL.

#### 3. Ejecutar el Script SQL:
   - Ejecuta el script `database-schema.sql` en MySQL Workbench para crear la base de datos y las tablas necesarias.

### Paso 3: Configuración del Proyecto Eclipse

#### 1. Importar Proyecto:
   - Abre Eclipse y selecciona `File` > `Import`.
   - Elige `General` > `Existing Projects into Workspace` y selecciona tu proyecto.

#### 2. Configuración del WAR:
   - Asegúrate de que el archivo `mysql-connector-java-x.x.x.jar` esté en la carpeta `WEB-INF/lib` de tu proyecto.

### Paso 4: Exportar el Proyecto como WAR

#### 1. Exportar el Proyecto:
   - Selecciona tu proyecto en Eclipse.
   - Haz clic derecho y selecciona `Export`.
   - En la ventana de exportación, elige `WAR file` y sigue el asistente para exportar tu proyecto como un archivo WAR.

### Paso 5: Despliegue en Apache Tomcat

#### 1. Copiar el WAR:
   - Copia el archivo WAR exportado en el directorio `webapps` de tu instalación de Apache Tomcat.

#### 2. Iniciar Apache Tomcat:
   - Abre una terminal y navega al directorio de Apache Tomcat.
   - Ejecuta `./bin/startup.sh` para iniciar el servidor Tomcat.

### Paso 6: Acceder a la Aplicación

#### 1. Navegador Web:
   - Abre tu navegador web y visita `http://localhost:8080/tu-nombre-de-archivo-war` para acceder a tu aplicación.

### Paso 7: Detener Apache Tomcat

#### 1. Detener Apache Tomcat:
   - En la terminal, navega al directorio de Apache Tomcat.
   - Ejecuta `./bin/shutdown.sh` para detener el servidor Tomcat.

Con estos pasos, deberías poder ejecutar la aplicación web en Apache Tomcat. Asegúrate de que todos los pasos se completen sin errores y sigue estos pasos en el orden indicado.

### Implementar en la Nube (Heroku)

- Siga las [instrucciones de despliegue en Heroku para aplicaciones Java](https://devcenter.heroku.com/articles/deploying-java).

## Configuración

### Configuración del Producto

Para asegurar el correcto funcionamiento del proyecto, es necesario realizar las siguientes configuraciones:

1. **Configuración de Base de Datos:**
   - Asegúrese de tener una base de datos MySQL 8.0.35 con las credenciales necesarias.
   - Importe las tablas del proyecto. Puede encontrar el esquema en el archivo `database-schema.sql`.

2. **Configuración del Ambiente de Desarrollo:**
   - Abra el proyecto en Eclipse o su entorno de desarrollo preferido.
   - Asegúrese de tener Apache Tomcat 8.5.92 configurado en Eclipse.
   - Configure Eclipse con Java SE 11 como ambiente de ejecución.

3. **Configuración del Despliegue:**
   - Para desplegar localmente, exporte el proyecto como un archivo WAR desde Eclipse.
   - Despliegue el archivo WAR en su servidor Apache Tomcat local.

### Configuración de los Requerimientos

A continuación, se detallan los requisitos técnicos que deben cumplirse para garantizar el funcionamiento adecuado del sistema:

- **Servidor Apache Tomcat:**
  - Se requiere Apache Tomcat 8.5.92.
  - Configuración: [Instrucciones específicas de configuración].

- **Versión de Java:**
  - JDK 11 / Java SE 11.
  - Configuración: [Instrucciones de configuración de Java].

- **Base de Datos MySQL:**
  - Versión 8.0.35.
  - Esquema: Verifique y importe las tablas desde `database-schema.sql`.

- **Otras Dependencias:**
  - EAR libraries, JUnit 5, web app libraries.
  - Configuración: Asegúrese de que todas las dependencias estén correctamente instaladas.

## Uso

- **Sección de Referencia para Usuario Final**
  - Consulte el [Manual del Usuario Final](manual-usuario-final.md) para obtener instrucciones detalladas sobre cómo utilizar la aplicación.

- **Sección de Referencia para Usuario Administrador**
  - Consulte el [Manual del Usuario Administrador](manual-usuario-admin.md) para obtener información sobre las funciones administrativas y privilegios.


## Contribución

- **Guía de Contribución para Usuarios**
  1. Clone el repositorio: `git clone https://github.com/andresvazquez/ActivityPlanIntellectus.git`
  2. Cree un nuevo branch: `git checkout -b nombre-del-branch`
  3. Realice cambios y confírmelos: `git commit -m "Mensaje del commit"`
  4. Envíe un pull request a la rama `develop` para su revisión y fusión.

## Roadmap

### Próximas Implementaciones

- **Eliminación y Modificación:**
  - Eliminación de asignaciones, requerimientos y casos de uso.
  - Modificación detallada de asignaciones, requerimientos y casos de uso existentes.

- **Exportar Reportes en CSV:**
  - Implementar la exportación de reportes en formato CSV por empleado y sus asignaciones.

- **Interfaz de Usuario:**
  - Ajustar el color de la interfaz para que sea más neutro según la identidad de la empresa.
  - Definir el estilo de la interfaz con la retroalimentación de los stakeholders.

- **Integración con Servicios Externos:**
  - Implementar notificaciones por correo electrónico para cambios y asignaciones.
  - Enviar notificaciones por correo de los registros de horas de esfuerzo.


## Organización

- **Empresa:** Intellectus CC S.A. de C.V.
- **Área:** Tecnologías de la información – Proveedor de servicios de TI
- **Justificación:** Se eligió esta empresa debido al contacto directo con el director y la oportunidad de proponer soluciones de TI.

## Problemática y Solución Propuesta

**Problemática Identificada:** La empresa requiere llevar la trazabilidad del tiempo de ejecución por actividad de los empleados.

**Solución Propuesta:** Desarrollo de la herramienta "Activity Plan" para el registro de horas por actividad y trazabilidad de ejecuciones en curso.

### Etapas del Proyecto

1. **Beta:**
   - Desarrollo de la funcionalidad de Asignación de Actividad.
   - Implementación de la arquitectura basada en microservicios.

2. **General Availability (GA):**
   - Desarrollo de las funcionalidades restantes.
   - Integración de la interfaz de usuario intuitiva.
   - Pruebas y corrección de errores.

### Licencia

Este proyecto está bajo la licencia [GNU General Public License v3.0](LICENSE). Consulta el archivo [LICENSE](LICENSE) para obtener más detalles.

