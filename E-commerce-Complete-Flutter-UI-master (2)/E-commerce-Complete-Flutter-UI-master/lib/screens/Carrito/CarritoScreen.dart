import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CarritoScreen extends StatefulWidget {
  static const String routeName = '/Carritooo';
  const CarritoScreen({Key? key}) : super(key: key);

  @override
  _CarritoScreenState createState() => _CarritoScreenState();
}

class _CarritoScreenState extends State<CarritoScreen> {
  late List<Map<String, dynamic>> _carrito = [];

  @override
  void initState() {
    super.initState();
    _cargarCarrito();
  }

  Future<void> _cargarCarrito() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String carritoJson = prefs.getString('carrito') ?? '[]';
    final List<dynamic> carrito = jsonDecode(carritoJson).cast<Map<String, dynamic>>();
    setState(() {
      _carrito.addAll(carrito.map((producto) => {
        ...producto,
        'cantidad': 1, 
      }));
    });
  }

  void _eliminarDelCarrito(dynamic producto) async {
    setState(() {
      _carrito.remove(producto);
    });
    await _guardarCarrito();
  }

  void _actualizarCantidad(dynamic producto, int nuevaCantidad) async {
    setState(() {
      final index = _carrito.indexOf(producto);
      _carrito[index]['cantidad'] = nuevaCantidad;
    });
    await _guardarCarrito();
  }

  Future<void> _guardarCarrito() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('carrito', jsonEncode(_carrito));
  }

  double _calcularTotal() {
    double total = 0.0;
    for (var producto in _carrito) {
      final precioOriginal = double.parse(producto['util_Precio'].toString());
      final subtotal = precioOriginal * producto['cantidad'];
      total += subtotal;
    }
    return total;
  }

  void _realizarPedido() {
    // Lógica para realizar el pedido
    // Puedes implementar esta función según tus requisitos
    // Por ahora, simplemente imprimiremos un mensaje
    print('Pedido realizado');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carrito de compras'),
      ),
      body: _carrito.isEmpty
          ? Center(
              child: Text('El carrito está vacío.'),
            )
          : ListView.separated(
              itemCount: _carrito.length,
              separatorBuilder: (BuildContext context, int index) => Divider(),
              itemBuilder: (context, index) {
                final producto = _carrito[index];
                final precioOriginal = double.parse(producto['util_Precio'].toString());
                final subtotal = precioOriginal * producto['cantidad'];
                return ListTile(
                  leading: Image.network(
                    producto['util_Imagen'],
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(producto['util_Descripcion']),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Precio Unitario: \L.${precioOriginal.toStringAsFixed(2)}'),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: () {
                              if (producto['cantidad'] > 1) {
                                _actualizarCantidad(producto, producto['cantidad'] - 1);
                              }
                            },
                          ),
                          Text(producto['cantidad'].toString()),
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () {
                              _actualizarCantidad(producto, producto['cantidad'] + 1);
                            },
                          ),
                        ],
                      ),
                      Text('Subtotal: \L.${subtotal.toStringAsFixed(2)}'),
                    ],
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      _eliminarDelCarrito(producto);
                    },
                  ),
                );
              },
            ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Total: \L.${_calcularTotal().toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _realizarPedido,
              child: Text('Realizar pedido'),
            ),
          ],
        ),
      ),
    );
  }
}
