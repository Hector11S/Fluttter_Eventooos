import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//import 'package:shop_app/screen/usuario_insertar.dart';

class EditarUsuarioView extends StatefulWidget {
  final int userId;

  const EditarUsuarioView({Key? key, required this.userId}) : super(key: key);

  @override
  _EditarUsuarioViewState createState() => _EditarUsuarioViewState();
}

class _EditarUsuarioViewState extends State<EditarUsuarioView> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _usuarioController = TextEditingController();
 
  int? _selectedRoleId;
  int? _selectedEmplId;
  int? _selectedClienId;
  bool _esAdministrador = false;
  List<Rol> _roles = [];
  List<Empleados1> _Empl = [];
  List<Clienete2> _Clien = [];
 // String urlUsuario = "http://www.gestioneventooooss.somee.com/Api/Usuario/FillUsuarios";
  String urlActualizarUsuario = "http://www.gestioneventooooss.somee.com/Api/Usuario/API/Usuario/Update";
  String urlRoles = "http://www.gestioneventooooss.somee.com/Api/Rol/List";
  String urlEmpl = "http://www.gestioneventooooss.somee.com/Api/Empleado/List";
  String urlCliente = "http://www.gestioneventooooss.somee.com/Api/Cliente/List";

  @override
  void initState() {
    super.initState();
    _fetchUsuario(widget.userId);
    _fetchRoles(); 
    _fetchClien();
    _fetchEmple();
  }

 Future<void> _fetchUsuario(int userId) async {
  try {
    final urlLlenar = "http://www.gestioneventooooss.somee.com/Api/Usuario/FillUsuarios/$userId";
    final response = await http.get(Uri.parse(urlLlenar));

    if (response.statusCode == 200) {
      final List<dynamic> userDataList = jsonDecode(response.body);
      if (userDataList.isNotEmpty) {
        final Map<String, dynamic> userData = userDataList[0]; // Toma el primer elemento de la lista, suponiendo que solo hay un usuario

        setState(() {
          _usuarioController.text = userData['usua_Usuario'].toString();

          _selectedRoleId = userData['rol_Id'] != null ? int.parse(userData['rol_Id'].toString()) : null;
          _selectedEmplId = userData['empl_Id'] != null ? int.parse(userData['empl_Id'].toString()) : null;
          _selectedClienId = userData['clie_Id'] != null ? int.parse(userData['clie_Id'].toString()) : null;
          _esAdministrador = userData['usua_Administrador'] ?? false;
        });
      } else {
        throw Exception("No se encontraron datos de usuario");
      }
    } else {
      throw Exception("Error al obtener información del usuario");
    }
  } catch (e) {
    print("Error: $e");
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Error al obtener información del usuario"),
        backgroundColor: Colors.red,
      ),
    );
  }
}



  Future<void> _fetchRoles() async {
    try {
      final response = await http.get(Uri.parse(urlRoles));
      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.body);
        setState(() {
          _roles = responseData.map((role) => Rol.fromJson(role)).toList();
        });
      } else {
        throw Exception("Error al obtener roles");
      }
    } catch (e) {
      print("Error: $e");
    }
  }
  Future<void> _fetchEmple() async {
    try {
      final response = await http.get(Uri.parse(urlEmpl));
      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.body);
        setState(() {
          _Empl = responseData.map((Empl1) => Empleados1.fromJson(Empl1)).toList();
        });
      } else {
        throw Exception("Error al obtener Empleado");
      }
    } catch (e) {
      print("Error: $e");
    }
  }
    Future<void> _fetchClien() async {
    try {
      final response = await http.get(Uri.parse(urlCliente));
      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.body);
        setState(() {
          _Clien = responseData.map((Clien1) => Clienete2.fromJson(Clien1)).toList();
        });
      } else {
        throw Exception("Error al obtener Cliente");
      }
    } catch (e) {
      print("Error: $e");
    }
  }


  Future<void> _actualizarUsuario() async {
    if (_formKey.currentState!.validate()) {
      try {
        print("Enviando solicitud...");

        final response = await http.put(
          Uri.parse(urlActualizarUsuario),
          body: jsonEncode({
            'usua_Id': widget.userId,
            'usua_Usuario': _usuarioController.text,
            'rol_Id': _selectedRoleId,
            'clie_Id': _selectedClienId,
            'empl_Id': _selectedEmplId,
            'usua_Admin': _esAdministrador,
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
              content: Text("Error al actualizar usuario: $errorMessage"),
              backgroundColor: Colors.red,
            ),
          );
        }
      } catch (e) {
        print("Error: $e");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Error al actualizar usuario: $e"),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Editar Usuario"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                controller: _usuarioController,
                decoration: InputDecoration(labelText: 'Usuario'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa un usuario';
                  }
                  return null;
                },
              ),
           
              SizedBox(height: 16),
              DropdownButtonFormField<int>(
                value: _selectedRoleId,
                onChanged: (newValue) {
                  setState(() {
                    _selectedRoleId = newValue!;
                  });
                },
                items: _roles.map((rol) {
                  return DropdownMenuItem<int>(
                    value: rol.id,
                    child: Text(rol.descripcion),
                  );
                }).toList(),
                decoration: InputDecoration(labelText: 'Roles'),
                validator: (value) {
                  if (value == null || value == -1) {
                    return 'Por favor selecciona un rol';
                  }
                  return null;
                },
              ),
               SizedBox(height: 16),
              DropdownButtonFormField<int>(
                value: _selectedEmplId,
                onChanged: (newValue) {
                  setState(() {
                    _selectedEmplId = newValue!;
                  });
                },
                items: _Empl.map((empl) {
                  return DropdownMenuItem<int>(
                    value: empl.id,
                    child: Text(empl.descripcion),
                  );
                }).toList(),
                decoration: InputDecoration(labelText: 'Empleado'),
                validator: (value) {
                  if (value == null || value == -1) {
                    return 'Por favor selecciona un rol';
                  }
                  return null;
                },
              ),
               SizedBox(height: 16),
              DropdownButtonFormField<int>(
                value: _selectedClienId,
                onChanged: (newValue) {
                  setState(() {
                    _selectedClienId = newValue!;
                  });
                },
                items: _Clien.map((cli) {
                  return DropdownMenuItem<int>(
                    value: cli.id,
                    child: Text(cli.descripcion),
                  );
                }).toList(),
                decoration: InputDecoration(labelText: 'Cliente'),
                validator: (value) {
                  if (value == null || value == -1) {
                    return 'Por favor selecciona un rol';
                  }
                  return null;
                },
              ),
             
              SizedBox(height: 16),
              CheckboxListTile(
                title: Text('¿Es administrador?'),
                value: _esAdministrador,
                onChanged: (newValue) {
                  setState(() {
                    _esAdministrador = newValue ?? false;
                  });
                },
              ),
              SizedBox(height: 32),
              Center(
                child: ElevatedButton(
                  onPressed: _actualizarUsuario,
                  child: Text('Actualizar Usuario'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Rol {
   final int id;
  final String descripcion;

  Rol({
    required this.id,
    required this.descripcion,
  });

   factory Rol.fromJson(Map<String, dynamic> json) {
    return Rol(
      id: json['rol_Id'],
      descripcion: json['role_Descripcion'],
    );
  }
}

class Empleados1 {
  final int id;
  final String descripcion;

  Empleados1({
    required this.id,
    required this.descripcion,
  });

  factory Empleados1.fromJson(Map<String, dynamic> json) {
    return Empleados1(
      id: json['empl_Id'],
      descripcion: json['empl_Nombre'],
    );
  }
}

class Clienete2 {
  final int id;
  final String descripcion;

  Clienete2({
    required this.id,
    required this.descripcion,
  });

  factory Clienete2.fromJson(Map<String, dynamic> json) {
    return Clienete2(
      id: json['clie_Id'],
      descripcion: json['clieNombre'],
    );
  }
}




