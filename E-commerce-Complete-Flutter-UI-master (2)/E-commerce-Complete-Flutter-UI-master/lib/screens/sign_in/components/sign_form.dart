import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shop_app/screens/login_success/login_success_screen.dart';
import '../../../components/custom_surfix_icon.dart';
import '../../../helper/keyboard.dart';

class SignForm extends StatefulWidget {
  const SignForm({Key? key}) : super(key: key);

  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final String loginUrl =
      'http://www.gestioneventooooss.somee.com/Api/Usuario/API/Usuario/IniciarSesion'; // URL de inicio de sesión

  final _formKey = GlobalKey<FormState>();
  TextEditingController usuarioController = TextEditingController();
  TextEditingController contraController = TextEditingController();

  void _login() async {
    try {
      final response = await http.post(
        Uri.parse(loginUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'usua_Usuario': usuarioController.text,
          'usua_Contra': contraController.text,
        }),
      );

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        print('Response: $jsonResponse');

        bool success = jsonResponse['success'] ?? false;
        if (success) {
          // Inicio de sesión exitoso, navegar a la pantalla de éxito
          Navigator.pushNamed(context, LoginSuccessScreen.routeName);
        } else {
          // Inicio de sesión fallido, mostrar mensaje de error
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Usuario o contraseña incorrectos')),
          );
        }
      } else {
        // Mostrar un mensaje de error si la solicitud no es exitosa
        print('Error en la solicitud: ${response.statusCode}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text('Error en la solicitud: ${response.statusCode}')),
        );
      }
    } catch (e) {
      // Manejar errores de solicitud
      print('Error al realizar la solicitud: $e');
      print('Error al realizar la solicitud');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al realizar la solicitud: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormField(
            controller: usuarioController,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              labelText: "Usuario",
              hintText: "Ingresa tu Usuario",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: contraController,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: "Contraseña",
              hintText: "Ingresa tu Contraseña",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _login();
                KeyboardUtil.hideKeyboard(context);
              }
            },
            child: const Text("Continuar"),
          ),
        ],
      ),
    );
  }
}
