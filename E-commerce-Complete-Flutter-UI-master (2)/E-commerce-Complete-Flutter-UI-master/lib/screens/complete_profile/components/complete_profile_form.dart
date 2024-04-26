import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shop_app/models/Clienteviewmodel.dart';
import 'package:http/http.dart' as http;
import 'package:shop_app/screens/sign_in/sign_in_screen.dart';
//import 'package:shop_app/screens/sign_up/components/sign_up_form.dart';

//import '../../otp/otp_screen.dart';

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
  String? _selectedMuniId ;
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
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Cliente creado exitosamente"),
          content: Text("El cliente ha sido creado exitosamente."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cerrar el diálogo
              },
              child: Text("OK"),
            ),
          ],
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Error al crear el cliente"),
          content: Text("Ha ocurrido un error al crear el cliente."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cerrar el diálogo
              },
              child: Text("OK"),
            ),
          ],
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
                    return 'Por favor ingresa un correoElectronico';
                  }
                  return null;
                },
          ),
Row(
  children: [
    Text(
      "Sexo:",
      style: TextStyle(fontSize: 15), // Modifica el tamaño de fuente aquí
    ),
    Row(
      children: [
        Radio<String>(
          value: "F",
          groupValue: _ClienteModel.Clie_Sexo,
          onChanged: (value) {
            setState(() {
              _ClienteModel.Clie_Sexo = value!;
            });
          },
        ),
        Text("F"),
      ],
    ),
    Row(
      children: [
        Radio<String>(
          value: "M",
          groupValue: _ClienteModel.Clie_Sexo,
          onChanged: (value) {
            setState(() {
              _ClienteModel.Clie_Sexo = value!;
            });
          },
        ),
        Text("M"),
      ],
    ),
  ],
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
              ),        const SizedBox(height: 16),
              const Text('Municipio', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
            DropdownButtonFormField<String>(
            value: _selectedMuniId,
            onChanged: (String? newValue) {
            setState(() {
            _selectedMuniId = newValue;
            _selectedMuniId = newValue ?? ''; // Aquí actualizamos el controlador del rol.
            });
            },
            items: _Muni.map<DropdownMenuItem<String>>((Municipio mun) {
              return DropdownMenuItem<String>(
                value: mun.id,
                child: Text(mun.nombre),
              );
            }).toList(),
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
  obscureText: true, // Hace que los caracteres ingresados se oculten
  decoration: InputDecoration(
    labelText: 'Contraseña',
  ),
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Por favor ingresa su nueva contraseña';
    }
    return null;
  },
),

        const SizedBox(height: 15),
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
  final String nombre;

  Municipio({required this.id, required this.nombre});

  factory Municipio.fromJson(Map<String, dynamic> json) {
    return Municipio(
      id: json['muni_Id'].toString(),
      nombre: json['muni_Descripcion'],
    );
  }
}