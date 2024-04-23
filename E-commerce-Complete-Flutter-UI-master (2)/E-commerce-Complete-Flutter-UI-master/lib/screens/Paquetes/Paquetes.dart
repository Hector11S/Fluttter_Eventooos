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

class SpecialOfferCard extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(isFirst ? 20 : 10, 5, 10, 5),
      child: GestureDetector(
        onTap: press,
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.6,
          height: 200,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black54,
                        Colors.black38,
                        Colors.black26,
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  child: Text.rich(
                    TextSpan(
                      style: const TextStyle(color: Colors.white),
                      children: [
                        TextSpan(
                          text: "$category\n",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        for (var utileria in utilerias)
                          TextSpan(text: "$utileria\n"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
