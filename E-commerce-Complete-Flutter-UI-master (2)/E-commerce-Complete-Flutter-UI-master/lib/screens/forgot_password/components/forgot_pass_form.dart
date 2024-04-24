import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


import '../../../components/custom_surfix_icon.dart';
import '../../../components/form_error.dart';
import '../../../components/no_account_text.dart';
import '../../../constants.dart';
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
    // Aquí llamas a la API para validar el usuario y restablecer la contraseña
    String url = 'http://www.gestioneventooooss.somee.com/Api/Usuario/ValidarReestablecer/$usuario';
    var response = await http.get(Uri.parse(url));
    // Puedes manejar la respuesta de la API aquí
    print('Validar Usuario: ${response.statusCode}');
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
            onChanged: (value) {
              if (value.isNotEmpty && errors.contains(kEmailNullError)) {
                setState(() {
                  errors.remove(kEmailNullError);
                });
              } else if (value.isNotEmpty && errors.contains(kInvalidEmailError)) {
                setState(() {
                  errors.remove(kInvalidEmailError);
                });
              }
              return;
            },
            decoration: const InputDecoration(
              labelText: "Usuario",
              hintText: "Ingresa tu usuario",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
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
