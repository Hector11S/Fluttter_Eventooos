import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shop_app/screens/Utilerias/Utilerias.dart';
import 'package:shop_app/screens/home/components/section_title.dart';

class Paquetes extends StatefulWidget {
  static const String routeName = '/PaquetesMostrar';

  const Paquetes({Key? key}) : super(key: key);

  @override
  State<Paquetes> createState() => _PaquetesState();
}

class _PaquetesState extends State<Paquetes> {
  Map<String, List<dynamic>> paquetesUtilerias = {};

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

        if (paquetesUtilerias.containsKey(descripcion)) {
          paquetesUtilerias[descripcion]!.add(utileria);
        } else {
          paquetesUtilerias[descripcion] = [utileria];
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
  padding: const EdgeInsets.symmetric(horizontal: 20),
  child: SectionTitle(
    title: "Paquetes",
    press: () {
      Navigator.pushNamed(context, Utilerias.routeName);
    },
  ),
),


        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: paquetesUtilerias.entries.map((entry) {
              final descripcion = entry.key;
              final utilerias = entry.value;

              return SpecialOfferCard(
                category: descripcion,
                utilerias: utilerias,
                press: () {},
                isFirst: paquetesUtilerias.keys.first == descripcion,
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
    required this.press,
    this.isFirst = false,
  }) : super(key: key);

  final String category;
  final List<dynamic> utilerias;
  final GestureTapCallback press;
  final bool isFirst;

  @override
  _SpecialOfferCardState createState() => _SpecialOfferCardState();
}

class _SpecialOfferCardState extends State<SpecialOfferCard> {
  bool showUtilerias = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(widget.isFirst ? 20 : 10, 5, 10, 5),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.6,
        height: showUtilerias ? 250 : 115, // Ajusta la altura según si las utilerías están visibles o no
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromRGBO(184, 134, 11, 1.0), // Dorado más oscuro
                      Color.fromRGBO(218, 165, 32, 1.0), // Dorado
                      Color.fromRGBO(218, 165, 32, 1.0), // Dorado
                      Color.fromRGBO(218, 165, 32, 1.0), // Dorado
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.shopping_bag, color: Colors.white), // Icono agregado
                        SizedBox(width: 5), // Espacio entre el icono y el texto
                        Text(
                          widget.category,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    if (showUtilerias)
                      for (var utileria in widget.utilerias)
                        Text(
                          utileria.toString(),
                          style: const TextStyle(color: Colors.white),
                        ),
                    Spacer(),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            showUtilerias = !showUtilerias;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 87, 169, 236), // Cambia Colors.blue por el color que desees
                        ),
                        child: Text(
                          showUtilerias ? "Ocultar detalles" : "Detalles",
                          style: TextStyle(color: Colors.white), // Cambia Colors.white por el color que desees
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
