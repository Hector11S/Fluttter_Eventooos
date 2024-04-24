import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shop_app/models/Clienteviewmodel.dart';
import 'package:http/http.dart' as http;
import 'package:shop_app/screens/sign_in/sign_in_screen.dart';
import 'package:shop_app/screens/sign_up/components/sign_up_form.dart';

import '../../otp/otp_screen.dart';

class CompleteProfileForm extends StatefulWidget {
  const CompleteProfileForm({super.key});
  static String routeName = "/complete_profile";
  @override
  _CompleteProfileFormState createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  final _formKey = GlobalKey<FormState>();
  clienteViewmodel _ClienteModel = clienteViewmodel(); 
  List<EstadoCivil> _civil = [];
  List<Municipio> _Muni = [];
  int? _selectedCivilId;
  int? _selectedMuniId ;
  String urlClienteregistro = "http://www.gestioneventooooss.somee.com/Api/Usuario/API/Usuario/Registrar";
  String urlCivil = "http://www.gestioneventooooss.somee.com/Api/Cliente/ListCivil";
  String urlMuni = "http://www.gestioneventooooss.somee.com/Api/Cliente/ListMuni";

  @override
  void initState() {
  super.initState();
  _fetchMuni();
  _fetchCivil();
}

  Future<void> _fetchCivil() async {
    try {
      final response = await http.get(Uri.parse(urlCivil));
      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.body);
        setState(() {
          _civil = responseData.map((civil) => EstadoCivil.fromJson(civil)).toList();
        });
      } else {
        throw Exception("Error al obtener el estadoCivil");
      }
    } catch (e) {
      print("Error: $e");
    }
  }
    Future<void> _fetchMuni() async {
    try {
      final response = await http.get(Uri.parse(urlMuni));
      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.body);
        setState(() {
          _Muni = responseData.map((muni) => Municipio.fromJson(muni)).toList();
        });
      } else {
        throw Exception("Error al obtener el Municipio");
      }
    } catch (e) {
      print("Error: $e");
    }
  }

 Future<void> _RegistroCliente() async {
  if (_formKey.currentState!.validate()) {
    try {
      print("Enviando solicitud...");

      final response = await http.post(
        Uri.parse(urlClienteregistro),
      body: jsonEncode({
  "clie_Identidad": _ClienteModel.Clie_Identidad,
  "clie_Nombre": _ClienteModel.Clie_Nombre,
  "clie_Apellido": _ClienteModel.Clie_Apellido,
  "clie_Telefono": _ClienteModel.Clie_Telefono,
  "clie_CorreoElectronico": _ClienteModel.Clie_CorreoElectronico,
  "clie_Sexo": _ClienteModel.Clie_Sexo,
  "esta_Id": _selectedCivilId,
 "muni_Id": _selectedMuniId,
 'usua_Usuario': _ClienteModel.Usua_Usuario,
 'usua_Contra': _ClienteModel.Usua_Contra

}),

        headers: {
          "Content-Type": "application/json",
        },
      );

      print("Respuesta recibida: ${response.statusCode}");
      print("Cuerpo de la respuesta: ${response.body}");

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Cliente creado exitosamente"),
            backgroundColor: Colors.green,
            
          ),
          
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Error al crear el cliente"),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      print("Error: $e");
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
             onChanged: (value) => _ClienteModel.Clie_Identidad = value,
                decoration: InputDecoration(labelText: 'Identidad'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa una Identidad';
                  }
                  return null;
                },
          ),
          const SizedBox(height: 20),
          TextFormField(
           onChanged: (value) => _ClienteModel.Clie_Nombre = value,
                decoration: InputDecoration(labelText: 'Nombre'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa un nombre';
                  }
                  return null;
                },
          ),
          const SizedBox(height: 20),
          TextFormField(
             onChanged: (value) => _ClienteModel.Clie_Apellido = value,
                decoration: InputDecoration(labelText: 'apellido'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa un apellido';
                  }
                  return null;
                },
          ),
          const SizedBox(height: 20),
          TextFormField(
            onChanged: (value) => _ClienteModel.Clie_Telefono = value,
                decoration: InputDecoration(labelText: 'Telefono'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa un numero de Telefono';
                  }
                  return null;
                },
          ),
            const SizedBox(height: 20),
          TextFormField(
            onChanged: (value) => _ClienteModel.Clie_CorreoElectronico = value,
                decoration: InputDecoration(labelText: 'Correo'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa un numero de Telefono';
                  }
                  return null;
                },
          ),
        const SizedBox(height: 20),
DropdownButtonFormField<String>(
  value: _ClienteModel.Clie_Sexo,
  onChanged: (value) {
    setState(() {
      _ClienteModel.Clie_Sexo = value!;
    });
  },
  items: [
    DropdownMenuItem(child: Text("F"), value: "F"),
    DropdownMenuItem(child: Text("M"), value: "M"),
  ],
  decoration: InputDecoration(labelText: 'Sexo'),
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Por favor selecciona el sexo';
    }
    return null;
  },
),
 SizedBox(height: 16),
              DropdownButtonFormField<int>(
                value: _selectedCivilId,
                onChanged: (newValue) {
                  setState(() {
                    _selectedCivilId = newValue!;
                  });
                },
                items: _civil.map((civil) {
                  return DropdownMenuItem<int>(
                    value: civil.id,
                    child: Text(civil.descripcion),
                  );
                }).toList(),
                decoration: InputDecoration(labelText: 'EstadoCivil'),
                validator: (value) {
                  if (value == null || value == -1) {
                    return 'Por favor selecciona un Estadocivil';
                  }
                  return null;
                },
              ), 
               const SizedBox(height: 20),
          TextFormField(
           onChanged: (value) => _ClienteModel.Usua_Usuario = value,
                decoration: InputDecoration(labelText: 'Usuario'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa un Usuario';
                  }
                  return null;
                },
          ),
           const SizedBox(height: 20),
          TextFormField(
           onChanged: (value) => _ClienteModel.Usua_Contra = value,
                decoration: InputDecoration(labelText: 'Contraseña'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa una contraseña';
                  }
                  return null;
                },
          ),
        const SizedBox(height: 10),
ElevatedButton(
  onPressed: () {
    if (_formKey.currentState!.validate()) {
      _RegistroCliente();
      Navigator.pushNamed(context, SignInScreen.routeName);
    }
  },
  child: const Text("Guardar"),
),

        ],
      ),
    );
  }
}


class EstadoCivil {
   final int id;
  final String descripcion;

  EstadoCivil({
    required this.id,
    required this.descripcion,
  });

   factory EstadoCivil.fromJson(Map<String, dynamic> json) {
    return EstadoCivil(
      id: json['esta_Id'],
      descripcion: json['esta_Descripcion'],
    );
  }
}

class Municipio {
  final String id;
  final String descripcion;

  Municipio({
    required this.id,
    required this.descripcion,
  });

  factory Municipio.fromJson(Map<String, dynamic> json) {
    return Municipio(
      id: json['muni_Id'].toString(),
      descripcion: json['muni_Descripcion'],
    );
  }
}