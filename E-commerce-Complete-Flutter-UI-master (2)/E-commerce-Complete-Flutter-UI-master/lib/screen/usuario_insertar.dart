import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shop_app/models/UsuarioViewModel.dart';


class CrearUsuarioView extends StatefulWidget {
  const CrearUsuarioView({Key? key}) : super(key: key);
  static String routeName = "/Modificar";
  @override
  _CrearUsuarioViewState createState() => _CrearUsuarioViewState();
}

class _CrearUsuarioViewState extends State<CrearUsuarioView> {
  final _formKey = GlobalKey<FormState>();
  UsuariosViewModel _usuarioViewModel = UsuariosViewModel(); 
  List<Rol> _roles = [];
  List<Empleados1> _Empl = [];
  List<Clienete2> _Clien = [];
  int? _selectedRoleId;
  int? _selectedEmplId;
  int? _selectedClienId;
  bool _isAdmin = false; 
  String urlCrearUsuario = "http://www.gestioneventooooss.somee.com/Api/Usuario/Create";
  String urlRoles = "http://www.gestioneventooooss.somee.com/Api/Rol/List";
  String urlEmpl = "http://www.gestioneventooooss.somee.com/Api/Empleado/List";
  String urlCliente = "http://www.gestioneventooooss.somee.com/Api/Cliente/List";

  @override
  void initState() {
  super.initState();
  _fetchRoles();
  _fetchClien();
  _fetchEmple();
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
        throw Exception("Error al obtener roles");
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
        throw Exception("Error al obtener roles");
      }
    } catch (e) {
      print("Error: $e");
    }
  }

 Future<void> _crearUsuario() async {
  if (_formKey.currentState!.validate()) {
    try {
      print("Enviando solicitud...");

      final response = await http.post(
        Uri.parse(urlCrearUsuario),
      body: jsonEncode({
  "usua_Usuario": _usuarioViewModel.Usua_Usuario,
  "usua_Contra": _usuarioViewModel.Usua_Contra,
  "Rol_Id": _selectedRoleId,
  "Clie_Id": _selectedClienId,
  "empl_Id": _selectedEmplId,
  "usua_EsAdmin": _isAdmin, 
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
            content: Text("Usuario creado exitosamente"),
            backgroundColor: Colors.green,
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Error al crear usuario"),
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
    return Scaffold(
      appBar: AppBar(
        title: Text("Crear Usuario"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
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
                decoration: InputDecoration(labelText: 'Contraseña'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa una contraseña';
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
                items: _Empl.map((Empl) {
                  return DropdownMenuItem<int>(
                    value: Empl.id,
                    child: Text(Empl.descripcion),
                  );
                }).toList(),
                decoration: InputDecoration(labelText: 'Empleados'),
                validator: (value) {
                  if (value == null || value == -1) {
                    return 'Por favor selecciona un Empleado';
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
                items: _Clien.map((Clien) {
                  return DropdownMenuItem<int>(
                    value: Clien.id,
                    child: Text(Clien.descripcion),
                  );
                }).toList(),
                decoration: InputDecoration(labelText: 'Cliente'),
                validator: (value) {
                  if (value == null || value == -1) {
                    return 'Por favor selecciona un Cliente';
                  }
                  return null;
                },
              ),             
              SizedBox(height: 16),
              Row(
                children: [
                  Checkbox(
                    value: _isAdmin,
                    onChanged: (value) {
                      setState(() {
                        _isAdmin = value ?? false; 
                      });
                    },
                  ),
                  Text('Administrador'),
                ],
              ),
              SizedBox(height: 32),
              Center(
                child: ElevatedButton(
                  onPressed: _crearUsuario,
                  child: Text('Crear Usuario'),
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



