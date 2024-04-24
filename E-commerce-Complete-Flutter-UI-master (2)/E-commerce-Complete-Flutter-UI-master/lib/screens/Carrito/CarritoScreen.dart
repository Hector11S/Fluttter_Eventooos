import 'package:flutter/material.dart';

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

class CarritoScreen extends StatelessWidget {
  static const String routeName = '/carrito';

  final List<CarritoItem> carrito;

  const CarritoScreen({Key? key, required this.carrito}) : super(key: key);

  double calcularTotal() {
    double total = 0;
    for (var item in carrito) {
      total += item.precio;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carrito'),
      ),
      body: carrito.isEmpty
          ? Center(
              child: Text('Tu carrito está vacío'),
            )
          : ListView.builder(
              itemCount: carrito.length,
              itemBuilder: (context, index) {
                final item = carrito[index];
                return ListTile(
                  leading: Image.network(item.imagenUrl),
                  title: Text(item.descripcion),
                  subtitle: Text('\L${item.precio.toStringAsFixed(2)}'),
                );
              },
            ),
      bottomNavigationBar: carrito.isEmpty
          ? null
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total: \$${calcularTotal().toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 18),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Aquí puedes implementar la lógica para proceder al pago, por ejemplo
                      // o cualquier otra acción que desees realizar al finalizar la compra.
                    },
                    child: Text('Pagar'),
                  ),
                ],
              ),
            ),
    );
  }
}
