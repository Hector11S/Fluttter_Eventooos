import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../constants.dart';

class OtpForm extends StatefulWidget {
  const OtpForm({
    Key? key,
  }) : super(key: key);

  @override
  _OtpFormState createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  FocusNode? pin2FocusNode;
  FocusNode? pin3FocusNode;
  FocusNode? pin4FocusNode;

  @override
  void initState() {
    super.initState();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    pin2FocusNode!.dispose();
    pin3FocusNode!.dispose();
    pin4FocusNode!.dispose();
  }

Future<void> validateOtp(BuildContext context, String otp) async {
  final url = 'http://www.gestioneventooooss.somee.com/Api/Usuario/MostrarCodigo/$otp';
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    // Mostrar mensaje de éxito
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Código OTP válido. Redirigiendo...'),
        duration: Duration(seconds: 2), // Duración del SnackBar
      ),
    );

    // Redirigir a otra página después de un breve retraso
    Future.delayed(Duration(seconds: 2), () {
      // Aquí puedes navegar a otra pantalla, por ejemplo:
      // Navigator.pushNamed(context, '/nueva_pagina');
    });
  } else {
    // Mostrar mensaje de error si la solicitud falla
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Error al validar el código OTP. Por favor, inténtalo de nuevo.'),
        duration: Duration(seconds: 2), // Duración del SnackBar
      ),
    );
  }
}

  void nextField(String value, FocusNode? focusNode) {
    if (value.length == 1) {
      focusNode!.requestFocus();
    } else if (value.length == 0 && focusNode != pin2FocusNode) {
      // Cuando se elimina un dígito, retrocede al campo anterior
      focusNode!.previousFocus();
    } else if (value.length == 0 && focusNode == pin2FocusNode) {
      // Cuando se elimina el primer dígito del segundo campo, retrocede al primer campo
      pin2FocusNode!.unfocus();
    } else if (value.length == 0 && focusNode == pin3FocusNode) {
      pin3FocusNode!.unfocus();
    } else if (value.length == 0 && focusNode == pin4FocusNode) {
      pin4FocusNode!.unfocus();
    }

    // Si el valor tiene longitud 1 y el campo es el último campo del OTP
    if (value.length == 1 && focusNode == pin4FocusNode) {
      // Validar el OTP
      validateOtp(context,value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 60,
                child: TextFormField(
                  autofocus: true,
                  obscureText: true,
                  style: const TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    nextField(value, pin2FocusNode);
                  },
                ),
              ),
              SizedBox(
                width: 60,
                child: TextFormField(
                  focusNode: pin2FocusNode,
                  obscureText: true,
                  style: const TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) => nextField(value, pin3FocusNode),
                ),
              ),
              SizedBox(
                width: 60,
                child: TextFormField(
                  focusNode: pin3FocusNode,
                  obscureText: true,
                  style: const TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) => nextField(value, pin4FocusNode),
                ),
              ),
              SizedBox(
                width: 60,
                child: TextFormField(
                  focusNode: pin4FocusNode,
                  obscureText: true,
                  style: const TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    nextField(value, null); // No hay siguiente campo
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.15),
          ElevatedButton(
            onPressed: () {},
            child: const Text("Continuar"),
          ),
        ],
      ),
    );
  }
}
