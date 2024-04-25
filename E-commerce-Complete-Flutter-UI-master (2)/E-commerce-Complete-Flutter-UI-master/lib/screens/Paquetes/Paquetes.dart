import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class Paquetes extends StatefulWidget {
  static const String routeName = '/PaquetesMostrar';

  const Paquetes({Key? key}) : super(key: key);

  @override
  State<Paquetes> createState() => _PaquetesState();
}

class _PaquetesState extends State<Paquetes> {
  Map<String, List<dynamic>> paquetesUtilerias = {};
  Map<String, double> preciosPorPaquete = {};

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse(
        'http://www.gestioneventooooss.somee.com/API/Paquete/ListPaquetesMostrar'));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final List<dynamic> paquetesData = jsonData['data'];

      paquetesData.forEach((paquete) {
        final descripcion = paquete['paqe_Descripcion'];
        final utileria = paquete['util_Descripcion'];
        final precio = paquete['paqe_Precio'];

        // que el precio no sea null antes de agregarlo al mapa
        if (precio != null) {
          if (!paquetesUtilerias.containsKey(descripcion)) {
            paquetesUtilerias[descripcion] = [utileria];
          } else {
            paquetesUtilerias[descripcion]!.add(utileria);
          }

          if (!preciosPorPaquete.containsKey(descripcion)) {
            preciosPorPaquete[descripcion] = precio;
          }
        }
      });

      setState(() {});
    } else {
      throw Exception('Error al cargar la API');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Padding(
            padding: const EdgeInsets.only(right: 280),
            child: Text(
              "Paquetes",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: paquetesUtilerias.entries.map((entry) {
              final descripcion = entry.key;
              final utilerias = entry.value;
              final precio = preciosPorPaquete[descripcion] ?? 0.0;

              return SpecialOfferCard(
                category: descripcion,
                utilerias: utilerias,
                precio: precio,
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

class SpecialOfferCard extends StatefulWidget {
  const SpecialOfferCard({
    Key? key,
    required this.category,
    required this.utilerias,
    required this.precio,
  }) : super(key: key);

  final String category;
  final List<dynamic> utilerias;
  final double precio;

  @override
  _SpecialOfferCardState createState() => _SpecialOfferCardState();
}

class _SpecialOfferCardState extends State<SpecialOfferCard> {
  bool showUtilerias = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.7,
        height: showUtilerias ? 400 : 200,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(1.0),
                child: Row(
                  children: [
                    Icon(Icons.shopping_bag,
                        color: const Color.fromARGB(255, 194, 163, 27)),
                    SizedBox(width: 5),
                    Text(
                      widget.category,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 194, 163, 27),
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      '\L.${widget.precio.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 2),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Visibility(
                  visible: showUtilerias,
                  child: Text(
                    "Este paquete Contiene:",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5),
              Visibility(
                visible: showUtilerias,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (var utileria in widget.utilerias)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(
                          utileria.toString(),
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                  ],
                ),
              ),
              Spacer(),
             Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton.icon(
                    onPressed: () async {
                      final SharedPreferences prefs = await SharedPreferences.getInstance();
                      List<Map<String, dynamic>> _carrito = [];
                      final String carritoJson = prefs.getString('carrito') ?? '[]';
                      final List<dynamic> carrito = jsonDecode(carritoJson).cast<Map<String, dynamic>>();

                      bool paqueteExistente = false;
                      for (var item in carrito) {
                        if (item['paquete'] == widget.category) {
                          paqueteExistente = true;
                          break;
                        }
                      }

                      if (!paqueteExistente) {
                        _carrito.addAll(carrito.map((paquete) => {
                          ...paquete,
                          'cantidad': 1,
                        }));
                        _carrito.add({
                          'paquete': widget.category,
                          'utilerias': widget.utilerias,
                          'precio': widget.precio,
                          'cantidad': 1,
                        });
                        await prefs.setString('carrito', jsonEncode(_carrito));

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Paquete añadido al carrito'),
                            duration: Duration(seconds: 2),
                            backgroundColor: Colors.green,
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('El paquete ya está en el carrito.'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 194, 163, 27),
                    ),
                    icon: Icon(
                      showUtilerias ? Icons.visibility_off : Icons.visibility,
                      color: Colors.white,
                    ),
                    label: Text(
                      showUtilerias ? "Ocultar detalles" : "Detalles",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              Visibility(
                visible: !showUtilerias, // Ocultar
                child: Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: ElevatedButton.icon(
                      onPressed: () async {
                        //Para añadir al carrito
                        final SharedPreferences prefs = await SharedPreferences.getInstance();
                        List<Map<String, dynamic>> _carrito = [];
                        final String carritoJson = prefs.getString('carrito') ?? '[]';
                        final List<dynamic> carrito = jsonDecode(carritoJson).cast<Map<String, dynamic>>();

                        bool paqueteExistente = false;
                        for (var item in carrito) {
                          if (item['paquete'] == widget.category) {
                            paqueteExistente = true;
                            break;
                          }
                        }

                        if (!paqueteExistente) {
                          _carrito.addAll(carrito.map((paquete) => {
                            ...paquete,
                            'cantidad': 1,
                          }));
                          _carrito.add({
                            'paquete': widget.category,
                            'utilerias': widget.utilerias,
                            'precio': widget.precio,
                            'cantidad': 1,
                          });
                          await prefs.setString('carrito', jsonEncode(_carrito));

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Paquete añadido al carrito'),
                              duration: Duration(seconds: 2),
                              backgroundColor: Colors.green,
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('El paquete ya está en el carrito.'),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 241, 161, 124),
                        ),
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                        minimumSize: MaterialStateProperty.all<Size>(Size(50, 40)),
                      ),
                      icon: Icon(Icons.add_shopping_cart),
                      label: Text('Añadir al carrito'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
