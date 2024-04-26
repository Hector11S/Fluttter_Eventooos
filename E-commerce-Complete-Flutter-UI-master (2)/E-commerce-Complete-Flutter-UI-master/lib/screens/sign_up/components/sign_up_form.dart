import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shop_app/models/UsuarioViewModel.dart';
import 'package:http/http.dart' as http;
import 'package:shop_app/screens/sign_in/sign_in_screen.dart';
//import '../../../components/custom_surfix_icon.dart';
import '../../../components/form_error.dart';
//import '../../../constants.dart';
//import '../../complete_profile/complete_profile_screen.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
    UsuariosViewModel _usuarioViewModel = UsuariosViewModel(); 
  String urlrestablecercontra = "http://www.gestioneventooooss.somee.com/Api/Usuario/API/Usuario/RestablecerContra";
  bool remember = false;
  final List<String?> errors = [];

 Future<void> _actualizarUsuario() async {
    if (_formKey.currentState!.validate()) {
      try {
        print("Enviando solicitud...");

        final response = await http.put(
          Uri.parse(urlrestablecercontra),
          body: jsonEncode({
            'Usua_Usuario': _usuarioViewModel.Usua_Usuario,
            'Usua_Contra': _usuarioViewModel.Usua_Contra,
       
          }),
          headers: {
            'Content-Type': 'application/json',
          },
        );

        print("Respuesta recibida: ${response.statusCode}");
        print("Cuerpo de la respuesta: ${response.body}");

        if (response.statusCode == 200) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Usuario actualizado exitosamente"),
              backgroundColor: Colors.green,
            ),
          );
        } else {
          String errorMessage = response.body;
          print("Error al actualizar usuario: $errorMessage");
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Error al actualizar la nueva contraseña: $errorMessage"),
              backgroundColor: Colors.red,
            ),
          );
        }
      } catch (e) {
        print("Error: $e");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Error al actualizar la contraseña: $e"),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  


  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
             TextFormField(
                onChanged: (value) => _usuarioViewModel.Usua_Usuario = value,
                decoration: InputDecoration(labelText: 'Usuario'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa un usuario';
                  }
                  return null;
                },
              ),
             SizedBox(height: 16),
           TextFormField(
  onChanged: (value) => _usuarioViewModel.Usua_Contra = value,
  obscureText: true, // Hace que los caracteres ingresados se oculten
  decoration: InputDecoration(
    labelText: 'Contraseña Nueva',
  ),
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Por favor ingresa su nueva contraseña';
    }
    return null;
  },
),

         
          FormError(errors: errors),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                // if all are valid then go to success screen
                 _actualizarUsuario();
                Navigator.pushNamed(context, SignInScreen.routeName);
              }
            },
            child: const Text("Continuar"),
          ),
        ],
      ),
    );
  }
}
 