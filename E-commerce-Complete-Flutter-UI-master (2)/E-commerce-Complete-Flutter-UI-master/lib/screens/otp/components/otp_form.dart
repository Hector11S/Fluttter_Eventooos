import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
//import 'package:shop_app/screens/forgot_password/forgot_password_screen.dart';
import 'package:shop_app/screens/sign_up/sign_up_screen.dart';

//import '../../../constants.dart';

class OtpForm extends StatefulWidget {
  const OtpForm({
    Key? key,
  }) : super(key: key);

  @override
  _OtpFormState createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  TextEditingController otpController = TextEditingController();
   String urlBase = 'http://www.gestioneventooooss.somee.com/Api/Usuario/MostrarCodigo/';

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

   Future<void> validateOtp(BuildContext context, String otp) async {
    final url = '$urlBase$otp';
    final response = await http.get(Uri.parse(url));

     if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Código OTP válido. Redirigiendo...'),
          duration: Duration(seconds: 2),
        ),
      );
    // Aquí puedes agregar la lógica para la navegación después de validar el OTP
    Navigator.pushNamed(context, SignUpScreen.routeName);
     } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error al validar el código OTP. Por favor, inténtalo de nuevo.'),
          duration: Duration(seconds: 2),
        ),
      );
    }
   }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
TextFormField(
  controller: otpController,
  style: const TextStyle(fontSize: 24),
  keyboardType: TextInputType.number,
  textAlign: TextAlign.center,
  maxLength: 6,
  inputFormatters: [
    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')), // Permite solo dígitos
  ],
  decoration: InputDecoration(
    labelText: 'Ingrese el código OTP',
  ),
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, ingrese el código OTP';
    }
    if (value.length < 6) {
      return 'El código esta incorrecto';
    }
    if (value.length > 6) {
      return 'El código esta incorrecto';
    }
    return null;
  },
),

          SizedBox(height: MediaQuery.of(context).size.height * 0.15),
          ElevatedButton(
            onPressed: () {
              
              final String otp = otpController.text;
              validateOtp(context, otp);
         
            },
            child: const Text("Continuar"),
          ),
        ],
      ),
    );
  }
}
