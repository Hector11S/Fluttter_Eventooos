import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CategoriaMesas extends StatefulWidget {
  static const String routeName = '/categoria_mesas';

  const CategoriaMesas({Key? key}) : super(key: key);

  @override
  State<CategoriaMesas> createState() => _CategoriaMesasState();
}

class _CategoriaMesasState extends State<CategoriaMesas> {
  String categori =
      "http://gestioneventooooss.somee.com/Api/Utileria/API/Utileria/ListCategoriaMesas";

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
        title: Text("Categoría de Mesas"),
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
          Image.network(
            imagenUrl,
            height: 80,
            width: double.infinity,
            fit: BoxFit.contain,
          ),
          SizedBox(height: 1),
          Text(
            descripcion,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 5),
          Text(
            '\L$precio',
            style: TextStyle(
              fontSize: 14,
              color: Color.fromARGB(255, 195, 0, 255),
            ),
          ),
          SizedBox(height: 5),
          ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(Size(150, 40)),
            ),
            child: Text('Añadir al carrito'),
          ),
        ],
      ),
    );
  }
}
