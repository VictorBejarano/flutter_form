# Flutter Form

<p align="center">
  <img src="https://github.com/VictorBejarano/flutter_form/blob/main/assets/images/logo.png?raw=true" width="400px" height="400px" alt="NxDevTools logo">
</p>

### Temas

- [Descripción de la aplicación](#descripción-de-la-aplicación)
- [Herramientas utilizadas](#herramientas-utilizadas)
- [Ejecutar el proyecto](#ejecutar-el-proyecto)
- [Instalación del APK](#instalación-del-apk)
- [Instrucciones de uso.](#instrucciones-de-uso)

## Descripción de la aplicación

Esta aplicación está diseñada para la gestión de usuarios. Compatible con Android, la aplicación ofrece una experiencia intuitiva y fácil de usar. Simplemente inicia sesión y podrás ver, crear, modificar o eliminar usuarios.

## Herramientas utilizadas

<a href="https://flutter.dev/" target="_blank">
  <img src="https://github.com/VictorBejarano/flutter_form/blob/main/assets/doc/logo_flutter.png?raw=true" height="80px">
</a>
<a href="https://dart.dev/" target="_blank">
  <img src="https://github.com/VictorBejarano/flutter_form/blob/main/assets/doc/logo_dart.png?raw=true" height="80px">
</a>
<a href="https://bloclibrary.dev/" target="_blank">
  <img src="https://github.com/VictorBejarano/flutter_form/blob/main/assets/doc/logo_bloc.png?raw=true" height="80px">
</a>
<a href="https://www.android.com/" target="_blank">
  <img src="https://github.com/VictorBejarano/flutter_form/blob/main/assets/doc/logo_android.png?raw=true" height="80px">
</a>

## Ejecutar el proyecto

Para ejecutar el proyecto, asegúrate de tener un equipo con Windows, Linux o Mac y sigue los siguientes pasos:

1. Descarga el repositorio de [Flutter Form](https://github.com/VictorBejarano/flutter_form).

2. Instala el SDK de Flutter a la versión latest siguiendo las [instrucciones](https://docs.flutter.dev/get-started/install/windows/mobile?tab=virtual).

3. En la terminal, en la carpeta raíz del proyecto, ejecuta el siguiente comando para instalar las dependencias del proyecto:
   ```
   flutter pub get
   ```
4. Una vez que todas las dependencias se hayan instalado correctamente, puedes ejecutar el proyecto Flutter con el siguiente comando:
   ```
   flutter run
   ```
   Este comando iniciará el proceso de compilación y ejecutará la aplicación en un emulador de Android o en un dispositivo conectado, dependiendo de la configuración [Ver ejemplo](https://docs.flutter.dev/get-started/test-drive).

## Instalación del APK

Para instalar la aplicación en tu dispositivo Android, sigue estos pasos:

1. **Descarga del Archivo APK:** Descarga el archivo APK desde la sección de [releases](https://github.com/VictorBejarano/flutter_form/releases) del repositorio.

2. **Transferencia del Archivo:** Se recomienda transferir el archivo directamente desde un dispositivo Android o mediante un cable USB conectado a una PC.

3. **Explorador de Archivos:** Utiliza el explorador de archivos de Android o descarga aplicaciones similares desde Google Play Store para buscar y ejecutar el archivo APK.

4. **Instalación y Permisos:** Al ejecutar el archivo APK, sigue las instrucciones en pantalla para completar la instalación. Es posible que se te solicite aceptar los permisos necesarios durante el proceso.

## Instrucciones de uso.

- Abrir la aplicacion Flutter Form.
- Al ingresar saldra la ventana de home donse se visualiza el logo de la aplicacion y un boton de continuar
- La siguiente ventana donde se observa el listado por defecto que tambien se puede ver en archivo json dando clic [acá](https://github.com/VictorBejarano/flutter_form/blob/main/assets/json/user.json?raw=true).
- Cuando se da clic en el boton de crear saldra un formulario en el cual se deben ingresar los datos solicitados, todos son requeridos.
  Al finalizar se debe dar clic en el boton crear y el nuevo usuario saldra en el listado
- Al dar tap sobre una de las tarjetas saldra el formulario donde solo se puede ver los datos del usuario donde se puede dar tap en el boton editar o el boton eliminar
- Para editar el usuario se da tap en el boton editar y se puede modificar el usuario incluyendo el listado de direcciones.
- Para eliminar el usuario se debe dar tap en el usuario y solo basta con dar en el boton eliminar.
- Para refrescar los datos solo basta con deslizar el listado hasta abajo y el listado vuelve a estar por defecto
- Tambien cuando se eliminan todas los usuarios agregados solo es dar tap sobre el boton actualizar de la siguiente imagen.
