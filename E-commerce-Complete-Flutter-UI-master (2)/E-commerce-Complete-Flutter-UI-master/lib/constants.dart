import 'package:flutter/material.dart';

const kPrimaryColor = Color.fromARGB(255, 194, 163, 27);
const kPrimaryLightColor = Color.fromARGB(255, 194, 247, 169);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    Color.fromARGB(255, 170, 90, 235),
    Color.fromARGB(255, 111, 18, 186)
  ],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Colors.black;

const kAnimationDuration = Duration(milliseconds: 200);

const headingStyle = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

const defaultDuration = Duration(milliseconds: 250);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Porfavor Ingresa tu correo";
const String kInvalidEmailError = "Porfavor Ingresa un correo valido";
const String kPassNullError = "Porfavor Ingresa tu contraseña";
const String kShortPassError = "Contraseña muy corta";
const String kMatchPassError = "Las contraseñas no coinciden";
const String kNamelNullError = "Porfavor Ingresa tu Nombre";
const String kPhoneNumberNullError = "Porfavor Ingresa Tu Numero de Telefono";
const String kAddressNullError = "Porfavor Ingresa tu Correo";

final otpInputDecoration = InputDecoration(
  contentPadding: const EdgeInsets.symmetric(vertical: 16),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: const BorderSide(color: kTextColor),
  );
}
