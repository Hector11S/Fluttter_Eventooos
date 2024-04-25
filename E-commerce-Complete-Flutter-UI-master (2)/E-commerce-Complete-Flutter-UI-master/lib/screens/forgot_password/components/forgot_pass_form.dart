import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shop_app/screens/otp/otp_screen.dart';


//import '../../../components/custom_surfix_icon.dart';
import '../../../components/form_error.dart';
import '../../../components/no_account_text.dart';
//import '../../../constants.dart';
//import '../../otp/otp_screen.dart';

class ForgotPassForm extends StatefulWidget {
  const ForgotPassForm({Key? key}) : super(key: key);

  @override
  _ForgotPassFormState createState() => _ForgotPassFormState();
}

class _ForgotPassFormState extends State<ForgotPassForm> {
  final _formKey = GlobalKey<FormState>();
  List<String> errors = [];
  String? usuario;

Future<void> _validateUsuario(String usuario) async {
  try {
    String url = 'http://www.gestioneventooooss.somee.com/Api/Usuario/ValidarReestablecer/$usuario';
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      // Acción si la validación del usuario es exitosa
      // Por ejemplo, mostrar un mensaje de éxito y navegar a la pantalla OTP
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Éxito'),
          content: Text('La validación del usuario fue exitosa.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, OtpScreen.routeName);
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    } else if (response.statusCode == 404) {
      // Acción si el usuario no existe (código de estado 404)
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('El usuario no existe. Por favor, verifique e intente de nuevo.'),
          duration: Duration(seconds: 2),
        ),
      );
    } else {
      // Acción si ocurre otro tipo de error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error al validar el usuario. Por favor, inténtelo de nuevo.'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  } catch (e) {
    // Manejar errores de solicitud
    print('Error al realizar la solicitud: $e');
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
        children: [
          TextFormField(
             keyboardType: TextInputType.text,
                onSaved: (newValue) => usuario = newValue,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingresa tu usuario';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  labelText: "Usuario",
                  hintText: "Ingresa tu usuario",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  suffixIcon: Icon(Icons.person), // Cambiado por un icono estándar
                ),
              ),
          const SizedBox(height: 8),
          FormError(errors: errors),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                // Llama a la función para validar el usuario
                _validateUsuario(usuario!);
                 
              }
            },
            child: const Text("Continuar"),
          ),
          
          const SizedBox(height: 16),
          const NoAccountText(),
        ],
      ),
    );
  }
}
