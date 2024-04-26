import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';
import 'package:shop_app/screen/usuario_insertar.dart';
import 'package:shop_app/screen/usuario_modificar.dart';
import 'package:shop_app/screen/usuariodetalle.dart';
class UsuariosViewModel {
  int usuarId;
  String? usuarUsuario;
  String? usuaAdmin;

  UsuariosViewModel({
    required this.usuarId,
    required this.usuarUsuario,
    this.usuaAdmin,
  });

  factory UsuariosViewModel.fromJson(Map<String, dynamic> json) {
    return UsuariosViewModel(
      usuarId: json['usua_Id'],
      usuarUsuario: json['usua_Usuario'],
      usuaAdmin: json['usua_Admin'].toString(),
    );
  }
}

class BootstrapPagination extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final Function(int) onPageChanged;

  BootstrapPagination({
    required this.currentPage,
    required this.totalPages,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(Icons.chevron_left),
          onPressed:
              currentPage > 1 ? () => onPageChanged(currentPage - 1) : null,
        ),
        Text(
          'Página $currentPage de $totalPages',
          style: TextStyle(fontSize: 16),
        ),
        IconButton(
          icon: Icon(Icons.chevron_right),
          onPressed: currentPage < totalPages
              ? () => onPageChanged(currentPage + 1)
              : null,
        ),
      ],
    );
  }
}

class WidgetUsuario extends StatefulWidget {
  const WidgetUsuario({Key? key});

  static String routeName = "/profile";
  @override
  State<WidgetUsuario> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<WidgetUsuario> {
  String url = "http://www.gestioneventooooss.somee.com/Api/Usuario/List";
  List<UsuariosViewModel> _usuarios = [];

  @override
  void initState() {
    super.initState();
    _getListado();
  }

  Future<void> _getListado() async {
    final response = await http.get(Uri.parse(url));
    final List<dynamic> responseData = json.decode(response.body);
    final List<UsuariosViewModel> usuarios = responseData.map((user) {
      return UsuariosViewModel.fromJson(user);
    }).toList();
    setState(() {
      _usuarios = usuarios;
    });
  }

  Future<void> _eliminarUsuario(int usua_Id) async {
    final deleteUrl =
        "http://www.gestioneventooooss.somee.com/Api/Usuario/Delete/$usua_Id";
    final response = await http.delete(Uri.parse(deleteUrl));

    if (response.statusCode == 200) {
      await _getListado();
    } else {
      throw Exception("Error eliminando usuario");
    }
  }

 @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text("Listado de Usuarios"),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255), // Cambia el color de fondo del AppBar
      centerTitle: true,
      elevation: 0,
      actions: [
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CrearUsuarioView()),
            );
          },
        ),
      ],
    ),
    body: SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                headingTextStyle: TextStyle(
                  color: Colors.black87, // Cambia el color del texto del encabezado
                  fontWeight: FontWeight.bold,
                ),
                dataRowColor: MaterialStateColor.resolveWith(
                  (states) => Colors.white,
                ),
                columns: [
                  DataColumn(
                    label: Text('ID'),
                  ),
                  DataColumn(
                    label: Text('Usuario'),
                  ),
                  DataColumn(
                    label: Text('Admin'),
                  ),
                  DataColumn(
                    label: Text('Acciones'),
                  ),
                ],
                rows: _usuarios.map((user) {
                  return DataRow(
                    cells: [
                      DataCell(Text(user.usuarId.toString())),
                      DataCell(Text(user.usuarUsuario.toString())),
                      DataCell(Text(user.usuaAdmin ?? "")),
                      DataCell(
                        Row(
                          children: [
                            IconButton( // Cambia los botones a iconos para las acciones
                              icon: Icon(Icons.edit),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EditarUsuarioView(userId: user.usuarId)),
                                );
                              },
                            ),
                            SizedBox(width: 10),
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                _confirmarEliminacion(user.usuarId);
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.details),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => UsuarioDetallesScreen(userId: user.usuarId)),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 20),
            BootstrapPagination(
              currentPage: 1,
              totalPages: 10,
              onPageChanged: (page) {},
            ),
          ],
        ),
      ),
    ),
  );
}


  Future<void> _confirmarEliminacion(int usua_Id) async {
    bool confirmacion = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Confirmar eliminación"),
          content: Text("¿Estás seguro de que deseas eliminar este usuario?"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: Text("Sí"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text("No"),
            ),
          ],
        );
      },
    );

    if (confirmacion == true) {
      await _eliminarUsuario(usua_Id);
    }
  }
}
