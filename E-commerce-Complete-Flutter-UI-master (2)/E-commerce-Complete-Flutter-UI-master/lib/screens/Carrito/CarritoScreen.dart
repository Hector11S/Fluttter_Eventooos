import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:shop_app/screens/Carrito/RealizarPedido.dart';

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
      _carrito.addAll(carrito.map((item) => item));
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
    for (var item in _carrito) {
      if (item.containsKey('util_Precio')) {
        final precioOriginal = double.parse(item['util_Precio'].toString());
        final subtotal = precioOriginal * (item['cantidad'] ?? 0);
        total += subtotal;
      } else if (item.containsKey('precio')) {
        final precioPaquete = double.parse(item['precio'].toString());
        final subtotal = precioPaquete * (item['cantidad'] ?? 0);
        total += subtotal;
      }
    }
    return total;
  }

  void _realizarPedido() {

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
          final item = _carrito[index];
          if (item.containsKey('util_Descripcion')) {
            // Es un producto individual
            final precioOriginal = item['util_Precio'] != null ? double.parse(item['util_Precio'].toString()) : 0.0;

            final subtotal = (precioOriginal ?? 0.0) * (item['cantidad'] ?? 0);

            return ListTile(
              leading: Image.network(
                item['util_Imagen'],
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text(item['util_Descripcion']),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Precio Unitario: \L.${precioOriginal.toStringAsFixed(2)}'),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          if (item['cantidad'] > 1) {
                            _actualizarCantidad(item, item['cantidad'] - 1);
                          }
                        },
                      ),
                      Text(item['cantidad'].toString()),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          _actualizarCantidad(item, item['cantidad'] + 1);
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
                  _eliminarDelCarrito(item);
                },
              ),
            );
          } else if (item.containsKey('paquete')) {
            // Es un paquete
            final precioPaquete = item['precio'] != null ? double.parse(item['precio'].toString()) : 0.0;

            final subtotal = precioPaquete * (item['cantidad'] ?? 0);

            return ListTile(
              leading: Icon(Icons.card_giftcard, size: 50), // Icono de paquete
              title: Text(item['paquete']),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Precio del paquete: \L.${precioPaquete.toStringAsFixed(2)}'),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          if (item['cantidad'] > 1) {
                            _actualizarCantidad(item, item['cantidad'] - 1);
                          }
                        },
                      ),
                      Text(item['cantidad'].toString()),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          _actualizarCantidad(item, item['cantidad'] + 1);
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
                  _eliminarDelCarrito(item);
                },
              ),
            );
          } else {
            return SizedBox.shrink(); //si hay error
          }
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
                        onPressed: () {
                          Navigator.pushNamed(context, RealizarPedido.routeName );
                        },
                        child: const Text("Continuar"),
                      ),
          ],
        ),
      ),
    );
  }
}
