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

## Requerimientos

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

### Implementar en Producción (Local)

1. **Exportar el Proyecto como Archivo WAR desde Eclipse:**
   - En Eclipse, haga clic derecho en el proyecto y seleccione `Export`.
   - Elija `WAR file` en `Web` y haga clic en `Next`.
   - Seleccione la ubicación de destino y haga clic en `Finish`.

2. **Desplegar el Archivo WAR en Apache Tomcat:**
   - Copie el archivo WAR en el directorio `webapps` de su instalación de Apache Tomcat.
   - Inicie o reinicie Apache Tomcat.

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

