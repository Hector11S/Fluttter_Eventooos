import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shop_app/models/UsuarioViewModel.dart';
import 'package:http/http.dart' as http;

class UsuarioDetallesScreen extends StatefulWidget {
  final int userId;
  
  const UsuarioDetallesScreen({Key? key, required this.userId}) : super(key: key);
  
  @override
  _UsuarioDetallesScreenState createState() => _UsuarioDetallesScreenState();
}

class _UsuarioDetallesScreenState extends State<UsuarioDetallesScreen> {
  late Future<UsuariosViewModel> _detalleUsuario;

  @override
  void initState() {
    super.initState();
    _detalleUsuario = obtenerDetalleUsuario(widget.userId);
  }

  Future<UsuariosViewModel> obtenerDetalleUsuario(int userId) async {
    final respuesta = await http.get(Uri.parse('http://www.gestioneventooooss.somee.com/Api/Usuario/FillUsuarios/$userId'));
    if (respuesta.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(respuesta.body);
      if (jsonData.isNotEmpty) {
        return UsuariosViewModel.fromJson(jsonData.first);
      } else {
        throw Exception('User details are empty');
      }
    } else {
      throw Exception('Failed to load user details');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalle del Usuario'),
      ),
      body: FutureBuilder<UsuariosViewModel>(
        future: _detalleUsuario,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }

            if (!snapshot.hasData) {
              return Center(child: Text('No hay datos disponibles'));
            }

            final usuario = snapshot.data!;
            return ListView(
              children: <Widget>[
                ListTile(title: Text('ID: ${usuario.Usua_Id}')),
                ListTile(title: Text('Usuario: ${usuario.Usua_Usuario}')),
               
                ListTile(title: Text('Nombre: ${usuario.Usua_Usuario}')),
                ListTile(title: Text('Rol: ${usuario.Role_Id}')),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Auditoría',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                DataTable(
                  columns: const [
                    DataColumn(label: Text('Acción')),
                    DataColumn(label: Text('Usuario')),
                  ],
                  rows: [
                    DataRow(
                      cells: [
                        DataCell(Text('Creación')),
                        DataCell(Text(usuario.Usua_Creacion?.toString() ?? 'Desconocido')),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(Text('Modificación')),
                        DataCell(Text(usuario.Usua_Creacion?.toString() ?? 'Desconocido')),
                      ],
                    ),
                  ],
                ),
                // Añadir más Widgets para los demás detalles
              ],
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}