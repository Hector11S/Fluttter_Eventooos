import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CategoriaSilla extends StatefulWidget {
  static const String routeName = '/categoria_silla';

  const CategoriaSilla({Key? key}) : super(key: key);

  @override
  State<CategoriaSilla> createState() => _CategoriaSillaState();
}

class _CategoriaSillaState extends State<CategoriaSilla> {
  String categori =
      "http://gestioneventooooss.somee.com/Api/Utileria/API/Utileria/ListCategoriaSillas";
  late List<dynamic> _categorias = [];
  late List<dynamic> _categoriasFiltradas = [];
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _getListado();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _getListado() async {
    final result = await http.get(Uri.parse(categori));
    if (result.statusCode == 200) {
      setState(() {
        _categorias = jsonDecode(result.body)['data'];
        _categoriasFiltradas = List.from(_categorias);
      });
    } else {
      print("Error en el Endpoint");
    }
  }

  void _updateFilteredCategories(List<dynamic> filteredCategories) {
    setState(() {
      _categoriasFiltradas = filteredCategories;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Categoría de Sillas"),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: _SearchDelegate(
                  categorias: _categorias,
                  updateFilteredCategories: _updateFilteredCategories,
                ),
              );
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: _categoriasFiltradas.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _categoriasFiltradas.length,
              itemBuilder: (context, index) {
                var categoria = _categoriasFiltradas[index];
                return _buildCategoriaItem(
                  categoria['util_Descripcion'] ?? "",
                  categoria['util_Imagen'] ?? "",
                  categoria['util_Precio'] != null
                      ? double.parse(categoria['util_Precio'].toString())
                      : 0.0,
                  categoria, 
                );
              },
            ),
    );
  }

  Widget _buildCategoriaItem(
      String descripcion, String imagenUrl, double precio, Map<String, dynamic> producto) {
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
          '\L$precio',
          style: TextStyle(
            fontSize: 14,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 5),
        ElevatedButton.icon(
          onPressed: () {
         
            _agregarAlCarrito(producto);
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
              const Color.fromARGB(255, 241, 161, 124),
            ),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            minimumSize: MaterialStateProperty.all<Size>(Size(150, 40)),
          ),
          icon: Icon(Icons.add_shopping_cart),
          label: Text('Añadir al carrito'),
        ),
        SizedBox(height: 10),
        Divider(),
      ],
    );
  }

  void _agregarAlCarrito(Map<String, dynamic> producto) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<Map<String, dynamic>> _carrito = [];
    final String carritoJson = prefs.getString('carrito') ?? '[]';
    final List<dynamic> carrito = jsonDecode(carritoJson).cast<Map<String, dynamic>>();


    bool productoExistente = false;
    for (var item in carrito) {
      if (item['util_Descripcion'] == producto['util_Descripcion']) {
        productoExistente = true;
        break;
      }
    }

    if (!productoExistente) {
      _carrito.addAll(carrito.map((producto) => {
        ...producto,
        'cantidad': 1,
      }));
      _carrito.add({
        ...producto,
        'cantidad': 1,
      });
      await prefs.setString('carrito', jsonEncode(_carrito));

   
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Producto añadido al carrito'),
          duration: Duration(seconds: 2),
          backgroundColor: Colors.green, 
        ),
      );
    } else {
 
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('El producto ya está en el carrito.'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }
}

class _SearchDelegate extends SearchDelegate<String> {
  final List<dynamic> categorias;
  final Function(List<dynamic>) updateFilteredCategories;

  _SearchDelegate({
    required this.categorias,
    required this.updateFilteredCategories,
  });

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? []
        : categorias.where((categoria) {
            final descripcion =
                categoria['util_Descripcion'].toString().toLowerCase();
            return descripcion.contains(query.toLowerCase());
          }).toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        var categoria = suggestionList[index];
        return ListTile(
          title: Text(categoria['util_Descripcion']),
          onTap: () {
            close(context, categoria['util_Descripcion']);
            updateFilteredCategories(suggestionList);
          },
        );
      },
    );
  }
}
