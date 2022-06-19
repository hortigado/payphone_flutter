<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->





 <img alt="FONLES CIA. LTDA." src="https://github.com/Matiasfons/payphone_flutter/blob/main/images/captura.png">
  
<a href="https://github.com/Matiasfons/payphone_flutter/blob/main/images/captura.png">
    <img src="https://github.com/Matiasfons/payphone_flutter/blob/main/images/captura.png" alt="FONLES logo" title="FONLES" align="right" height="60" />
</a>




Método de pago seguro usando PAYPHONE.

Tus clientes no van a poder creer, lo simple que fue pagarte.
Y tu tampoco.
En menos tiempo que tomar un café. Comienza a cobrar con tarjeta, sin papeleos ni comisiones.

## WIDGET IMPLEMENTADO AUTOMÁTICAMENTE.

## Getting started

1. Debes crear una cuenta BUSINESS en https://appstore.payphonetodoesposible.com/registerini

2. Dirígete a la sección de “Usuarios” a continuación selecciona “Crear Usuario”, ingresa todos los datos del desarrollador en el formulario, no olvides que en el campo “Roles” debes ingresar “Desarrollador”. (El administrador debe entregarel correo electrónico y la contraseña ingresadas).

3. Ingresa en la página https://appdeveloper.payphonetodoesposible.com/ e inicia sesión con las credenciales de tu usuario desarrollador (Ruc, correo y contraseña).

4. Crear Aplicación Payphone. Las aplicaciones de desarrollo Payphone te permiten configurar tu ambiente de pruebas, parámetros de conexión o usuarios de test, y te ayuda a obtener tus credenciales de autenticación como el token. Para crear tu aplicación haz click en  el “+”  de la parte superior, se abrirá un formulario donde debes ingresar los campos de tu aplicación el tipo de aplicación debe ser API 

5. Obtener Token de autenticación. Con la aplicación configurada debes hacer click el menú superior en la pestaña credenciales, y tendrás el botón para copiar tu token.


## Features

## Los datos confidenciales se envían directamente a PAYPHONE en lugar de pasar por su servidor.

IOS: DISPONIBLE
ANDROID: DISPONIBLE
WEB: DISPONIBLE

## Requirements

## Android

Es necesario minSdkVersion 21

## iOS
Compatible con aplicaciones dirigidas a iOS 11 o superior.

## WEB
¡Ahora puedes usar PAYPHONE con Flutter web! 


## Usage

```dart
  @override
  Widget build(BuildContext context) {
    return Container(
      child: PayphoneWidget(
          width: width,
          height: height,
          token: token,
          success: success,
          cancelled: cancelled,
          amount: amount,
          tax: tax,
          amountWithTax: amountWithTax,
          expireIn: expireIn,
          clientTransactionId: clientTransactionId,
          currency: currency,
          reference: reference),
    );
  }
```

## Additional information

Plugin creado por Matias Fonseca. CEO EN FONLES CIA. LTDA.

