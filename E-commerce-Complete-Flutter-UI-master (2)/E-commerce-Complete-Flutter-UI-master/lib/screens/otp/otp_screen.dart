import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//import '../../constants.dart';

class OtpForm extends StatefulWidget {
  const OtpForm({Key? key}) : super(key: key);
 static String routeName = "/otp";
  @override
  _OtpFormState createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  final TextEditingController _otpController = TextEditingController();

  Future<void> _validateOtp(String otp) async {
    String url = 'http://www.gestioneventooooss.somee.com/Api/Usuario/MostrarCodigo/$otp';
    var response = await http.get(Uri.parse(url));
    print('Validar OTP: ${response.statusCode}');
    // Puedes manejar la respuesta de la API aquí según tus necesidades
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            controller: _otpController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Enter OTP",
              hintText: "Enter the OTP code",
              suffixIcon: IconButton(
                onPressed: () => _otpController.clear(),
                icon: Icon(Icons.clear),
              ),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              String otp = _otpController.text.trim();
              if (otp.isNotEmpty) {
                _validateOtp(otp);
              } else {
                // Handle empty OTP code
              }
            },
            child: Text("Verify OTP"),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }
}
