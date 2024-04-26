import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shop_app/models/PedidosViewModel.dart';
import 'package:http/http.dart' as http;
import 'package:shop_app/screens/sign_in/sign_in_screen.dart';
import 'package:shop_app/screens/sign_up/components/sign_up_form.dart';

//import '../../otp/otp_screen.dart';

class RealizarPedidoForm extends StatefulWidget {
  const RealizarPedidoForm({super.key});
  static String routeName = "/realizarpedido";
  @override
  _RealizarPedidoFormState createState() => _RealizarPedidoFormState();
}

class _RealizarPedidoFormState extends State<RealizarPedidoForm> {
  final _formKey = GlobalKey<FormState>();
  PedidosViewModel _ClienteModel = PedidosViewModel(); 
  List<EstadoCivil> _civil = [];
  List<Municipio> _Muni = [];
  List<Evento> _Even = [];
  int? _selectedCivilId;
  int? _selectedMuniId ;
  int? _selectedEventoId;
  
  String urlClienteregistro = "http://www.gestioneventooooss.somee.com/Api/Cliente/API/Cliente/PaquetesInsertar";
  String urlCivil = "http://www.gestioneventooooss.somee.com/Api/Cliente/ListCivil";
  String urlMuni = "http://www.gestioneventooooss.somee.com/Api/Cliente/ListMuni";
  String urlEven = "http://www.gestioneventooooss.somee.com/Api/Cliente/LisEventosElecl";

@override
void initState() {
  super.initState();
  _fetchMuni();
  _fetchCivil();
  _fetchEven();


  if (_Even.isNotEmpty) {
    _selectedEventoId = _Even.first.id;
  }
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
  Future<void> _fetchEven() async {
    try {
      final response = await http.get(Uri.parse(urlEven));
      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.body);
        setState(() {
          _Even = responseData.map((evento) => Evento.fromJson(evento)).toList();
        });
      } else {
        throw Exception("Error al obtener el Evento");
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
 'ever_Id': _selectedEventoId,
 'paDe_Subtotal': _ClienteModel.paDe_Subtotal,
  'paDe_Total': _ClienteModel.paDe_Total,
   'even_Descripcion': _ClienteModel.even_Descripcion,
    'even_FechaInicio': _ClienteModel.even_FechaInicio,
     'even_FechaFin': _ClienteModel.even_FechaFin,
      'even_Sexo': _ClienteModel.even_Sexo,
       'util_IdList': _ClienteModel.util_IdList,

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
            content: Text("Pedido añadido exitosamente"),
            backgroundColor: Colors.green,
            
          ),
          
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Error al crear el Pedido"),
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
  final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
  final double subtotal = args['subtotal'];
  final double total = args['total'];
  final String utilIds = args['utilIds'];
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
              DropdownButtonFormField<int>(
                value: _selectedMuniId,
                onChanged: (newValue) {
                  setState(() {
                    _selectedMuniId = newValue!;
                  });
                },
                items: _Muni.map((muni) {
                  return DropdownMenuItem<int>(
                    value: int.parse(muni.id),
                    child: Text(muni.descripcion),
                  );
                }).toList(),
                decoration: InputDecoration(labelText: 'Municipios'),
                validator: (value) {
                  if (value == null || value == -1) {
                    return 'Por favor selecciona un Municipio';
                  }
                  return null;
                },
              ),

              SizedBox(height: 16),
              DropdownButtonFormField<int>(
                value: _selectedEventoId,
                onChanged: (newValue) {
                  setState(() {
                    _selectedEventoId = newValue!;
                  });
                },
                items: _Even.map((evento) {
                  return DropdownMenuItem<int>(
                    value: evento.id,
                    child: Text(evento.descripcion),
                  );
                }).toList(),
                decoration: InputDecoration(labelText: 'Evento'),
                validator: (value) {
                  if (value == null || value == -1) {
                    return 'Por favor selecciona un Evento';
                  }
                  return null;
                },
              ), 
             const SizedBox(height: 20),
            TextFormField(
          initialValue: subtotal.toString(),
          onChanged: (value) {
                try {
                  _ClienteModel.paDe_Subtotal = double.parse(value);
                } catch (e) {
              
                  print('Error al convertir a double: $e');
                }
              },
              decoration: InputDecoration(labelText: 'Subtotal'),
          validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingresa un Subtotal';
                }
                return null;
              },
            ),
           const SizedBox(height: 20),
           TextFormField(
          initialValue: total.toString(),
          onChanged: (value) {
        
                try {
                  _ClienteModel.paDe_Total = double.parse(value);
                } catch (e) {
              
                  print('Error al convertir a double: $e');
                }
              },
               decoration: InputDecoration(labelText: 'Total'),
                validator: (value){
                if (value == null || value.isEmpty) {
                  return 'Por favor ingresa un Total';
                }
                return null;
              },
            ),

            const SizedBox(height: 20),
          TextFormField(
           onChanged: (value) => _ClienteModel.even_Descripcion = value,
                decoration: InputDecoration(labelText: 'Evento Descripcion'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa una Descripcion';
                  }
                  return null;
                },
          ),
         const SizedBox(height: 20),
          TextFormField(
            onChanged: (value) {
  
              try {
                _ClienteModel.even_FechaInicio = DateTime.parse(value);
              } catch (e) {
          
                print('Error al convertir la fecha: $e');
              }
            },
            decoration: InputDecoration(labelText: 'Fecha Incio del evento'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor ingresa una fecha';
              }
              return null;
            },
          ),

         const SizedBox(height: 20),
          TextFormField(
            onChanged: (value) {
  
              try {
                _ClienteModel.even_FechaFin = DateTime.parse(value);
              } catch (e) {
          
                print('Error al convertir la fecha: $e');
              }
            },
            decoration: InputDecoration(labelText: 'Fecha fin del evento'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor ingresa una fecha';
              }
              return null;
            },
          ),

            const SizedBox(height: 20),
          TextFormField(
           onChanged: (value) => _ClienteModel.even_Sexo = value,
                decoration: InputDecoration(labelText: 'Sexo de el que recibe el servicio'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa una Descripcion';
                  }
                  return null;
                },
          ),
           const SizedBox(height: 20),
            TextFormField(
              initialValue: utilIds,
              onChanged: (value) {
                _ClienteModel.util_IdList = value;
              },
              decoration: InputDecoration(labelText: 'Utilerías'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingresa una Descripción';
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

class Evento {
  final int id;
  final String descripcion;

  Evento({
    required this.id,
    required this.descripcion,
  });

  factory Evento.fromJson(Map<String, dynamic> json) {
    return Evento(
      id: json['ever_Id'],
      descripcion: json['ever_Descripcion'],
    );
  }
}