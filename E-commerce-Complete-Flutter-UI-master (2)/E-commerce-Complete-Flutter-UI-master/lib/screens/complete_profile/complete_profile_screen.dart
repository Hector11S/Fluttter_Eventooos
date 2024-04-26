import 'package:flutter/material.dart';

import '../../constants.dart';
import 'components/complete_profile_form.dart';

class CompleteProfileScreen extends StatelessWidget {
  static String routeName = "/complete_profile";

  const CompleteProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Regístrate'), // Cambiado acento en "Regístrate"
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10), // Añadido padding vertical
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20), // Aumentado espacio
              Text("Complete tu perfil", style: headingStyle), // Traducción y estilo
              SizedBox(height: 10), // Ajustado espacio
              Text(
                "Completa tus detalles o continua \ncon redes sociales",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey), // Estilo del texto
              ),
              SizedBox(height: 20), // Aumentado espacio
              CompleteProfileForm(), // Mantenido formulario existente
              SizedBox(height: 20), // Aumentado espacio
              Text(
                "Al continuar, confirmas que estás de acuerdo \ncon nuestros Términos y Condiciones",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, color: Colors.grey), // Estilo del texto
              ),
            ],
          ),
        ),
      ),
    );
  }
}
