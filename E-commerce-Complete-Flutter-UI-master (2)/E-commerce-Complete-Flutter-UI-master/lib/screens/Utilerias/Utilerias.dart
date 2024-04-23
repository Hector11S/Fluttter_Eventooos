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
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
              ),
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
    return Card(
      elevation: 3.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 80,
            child: Image.network(
              imagenUrl,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: 8),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
          ),
          SizedBox(height: 5),
          Text(
            '\L$precio',
            style: TextStyle(
              fontSize: 14,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
          SizedBox(height: 5),
          ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(Size(70, 40)),
            ),
            child: Text('Añadir al carrito'),
          ),
        ],
      ),
    );
  }
}
