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

  late List<dynamic> _productos = [];
  late List<dynamic> _productosFiltrados = []; 
  late TextEditingController _searchController;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _getListado();
    _searchController = TextEditingController();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _getListado() async {
    final result = await http.get(Uri.parse(categori));
    if (result.statusCode == 200) {
      setState(() {
        _productos = jsonDecode(result.body)['data'];
        _productosFiltrados = List.from(_productos); 
      });
    } else {
      print("Error en el Endpoint");
    }
  }

  void _updateFilteredProducts(List<dynamic> filteredProducts) {
    setState(() {
      _productosFiltrados = filteredProducts;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Productos Disponibles"),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: _SearchDelegate(
                  productos: _productos,
                  updateFilteredProducts: _updateFilteredProducts,
                ),
              );
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: _productosFiltrados.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              controller: _scrollController,
              itemCount: _productosFiltrados.length,
              itemBuilder: (context, index) {
                var producto = _productosFiltrados[index];
                return _buildProductoItem(
                  producto['util_Descripcion'] ?? "",
                  producto['util_Imagen'] ?? "",
                  producto['util_Precio'] != null
                      ? double.parse(producto['util_Precio'].toString())
                      : 0.0,
                );
              },
            ),
    );
  }

  Widget _buildProductoItem(
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
          onPressed: () {
            _addToCart(descripcion, imagenUrl, precio);
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            minimumSize: MaterialStateProperty.all(Size(120, 40)),
          ),
          child: Text('Añadir al carrito'),
        ),
        SizedBox(height: 10), 
        Divider(), 
      ],
    );
  }

  List<CarritoItem> _carrito = [];

  void _addToCart(String descripcion, String imagenUrl, double precio) {
    setState(() {
      _carrito.add(CarritoItem(
        descripcion: descripcion,
        imagenUrl: imagenUrl,
        precio: precio,
      ));
    });
  }
}

class CarritoItem {
  final String descripcion;
  final String imagenUrl;
  final double precio;

  CarritoItem({
    required this.descripcion,
    required this.imagenUrl,
    required this.precio,
  });
}

class _SearchDelegate extends SearchDelegate<String> {
  final List<dynamic> productos;
  final Function(List<dynamic>) updateFilteredProducts;

  _SearchDelegate({
    required this.productos,
    required this.updateFilteredProducts,
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
        : productos.where((producto) { 
            final descripcion = producto['util_Descripcion'].toString().toLowerCase();
            return descripcion.contains(query.toLowerCase());
          }).toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        var producto = suggestionList[index];
        return ListTile(
          title: Text(producto['util_Descripcion']),
          onTap: () {
            close(context, producto['util_Descripcion']);
            updateFilteredProducts(suggestionList);
          },
        );
      },
    );
  }
}
