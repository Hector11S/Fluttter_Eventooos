import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Usuario extends StatefulWidget {
  static const String routeName = '/usuario';

  const Usuario({Key? key}) : super(key: key);

  @override
  State<Usuario> createState() => _UsuarioState();
}

class _UsuarioState extends State<Usuario> {
  String categori = "http://gestioneventooooss.somee.com/Api/Usuario/List";

  Future<dynamic> _getListado() async {
    final result = await http.get(Uri.parse(categori));
    if (result.statusCode == 200) {
      return jsonDecode(result.body);
    } else {
      print("Error en el Endpoint");
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listado Usuario"),
      ),
      body: FutureBuilder<dynamic>(
        future: _getListado(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: DataTable(
                headingRowColor: MaterialStateColor.resolveWith(
                    (states) => Colors.blueGrey[50]!),
                headingTextStyle: TextStyle(fontWeight: FontWeight.bold),
                dataRowColor: MaterialStateColor.resolveWith(
                    (states) => Colors.blueGrey[100]!),
                dataTextStyle: TextStyle(fontStyle: FontStyle.italic),
                columns: [
                  DataColumn(label: Text('ID')),
                  DataColumn(label: Text('Nombre')),
                ],
                rows: _listado(snapshot.data),
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.error}"),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  List<DataRow> _listado(List<dynamic>? info) {
    List<DataRow> lista = [];
    if (info != null) {
      info.forEach((element) {
        lista.add(DataRow(
          cells: [
            DataCell(Text(element["usua_Id"].toString())),
            DataCell(Text(element["usua_Usuario"])),
          ],
        ));
      });
    }
    return lista;
  }
}
