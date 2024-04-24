import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
        width: MediaQuery.of(context).size.width * 0.6,
        height: showUtilerias ? 250 : 150,
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
                    Icon(Icons.shopping_bag, color: const Color.fromARGB(255, 138, 170, 178)),
                    SizedBox(width: 5),
                    Text(
                      widget.category,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 138, 170, 178),
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
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        showUtilerias = !showUtilerias;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 138, 170, 178),
                    ),
                    child: Text(
                      showUtilerias ? "Ocultar detalles" : "Detalles",
                      style: TextStyle(color: Colors.white),
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
