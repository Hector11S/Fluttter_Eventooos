import 'package:flutter/material.dart';

import 'components/forgot_pass_form.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static String routeName = "/forgot_password";

  const ForgotPasswordScreen({super.key});
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Recuperar Contraseña"),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255), // Personaliza el color del app bar
        elevation: 0, // Elimina la sombra del app bar
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16),
            Icon(
              Icons.lock_open, // Icono de candado abierto
              size: 100,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 16),
            Text(
              "¡Olvidó su contraseña?",
              style: TextStyle(
                fontSize: 24,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              "No se preocupe, estamos aquí para ayudarle. Por favor, introduzca su Usuario y le enviaremos un codigo para restablecer su contraseña.",
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            ForgotPassForm(),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Acción al presionar el botón
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: const Color.fromARGB(255, 255, 255, 255), // Color del texto del botón
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20), // Bordes redondeados
                ),
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
              child: Text(
                "Recuperar Contraseña",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
