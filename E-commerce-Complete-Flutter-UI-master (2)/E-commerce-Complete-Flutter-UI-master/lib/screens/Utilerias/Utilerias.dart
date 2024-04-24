import 'dart:convert';

import 'package:flutter/material.dart';


import 'package:http/http.dart' as http;

class Utilerias extends StatefulWidget {
  static const String routeName = '/Utilerias';

  const Utilerias({Key? key}) : super(key: key);

  @override
  State<Utilerias> createState() => _UtileriasState();
}

class _UtileriasState extends State<Utilerias> {
  String categori =
      "http://www.gestioneventooooss.somee.com/Api/Utileria/API/Utileria/ListUtilerias";

  Future<List<dynamic>?> _getListado() async {
    final result = await http.get(Uri.parse(categori));
    if (result.statusCode == 200) {
      return jsonDecode(result.body)['data'];
    } else {
      print("Error en el Endpoint");
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Productos Disponibles"),
      ),
      body: FutureBuilder<List<dynamic>?>(
        future: _getListado(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var categoria = snapshot.data![index];
                return _buildCategoriaItem(
                  categoria['util_Descripcion'] ?? "",
                  categoria['util_Imagen'] ?? "",
                  categoria['util_Precio'] != null
                      ? double.parse(categoria['util_Precio'].toString())
                      : 0.0,
                );
              },
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

  Widget _buildCategoriaItem(
      String descripcion, String imagenUrl, double precio) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.network(
          imagenUrl,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            descripcion,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Text(
          '\$${precio.toStringAsFixed(2)}',
          style: TextStyle(
            fontSize: 14,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 5),
        ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            minimumSize: MaterialStateProperty.all(Size(120, 40)),
          ),
          child: Text('Añadir al carrito'),
        ),
        SizedBox(height: 10), // Añadimos un espacio entre cada elemento de la lista
        Divider(), // Añadimos un divisor entre cada elemento de la lista
      ],
    );
  }
}
