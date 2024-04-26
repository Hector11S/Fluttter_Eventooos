import 'package:flutter/material.dart';

import '../../constants.dart';
import 'package:shop_app/screens/Carrito/RealizarPedido.dart';

class RealizarPedidoScreen extends StatelessWidget {
  static String routeName = "/realizarpedido";

  const RealizarPedidoScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Realizar Pedido'),
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  const Text("Completa esta Informacion", style: headingStyle),
                  const Text(
                    "Ingresa cada campo",
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  const RealizarPedidoForm(),
                  const SizedBox(height: 30),
                  Text(
                    "Si continuas se enviara tu Pedido",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
