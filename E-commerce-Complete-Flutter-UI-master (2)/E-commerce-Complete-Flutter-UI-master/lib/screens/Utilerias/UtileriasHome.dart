import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app/screens/Utilerias/Utilerias.dart';
import 'package:shop_app/screens/home/components/section_title.dart';

class UtileriasHome extends StatefulWidget {
  static const String routeName = '/Utilerias_Home';

  const UtileriasHome({Key? key}) : super(key: key);

  @override
  State<UtileriasHome> createState() => _UtileriasHomeState();
}

class _UtileriasHomeState extends State<UtileriasHome> {
  List<dynamic> utilerias = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse(
        'http://www.gestioneventooooss.somee.com/Api/Utileria/API/Utileria/ListUtilerias'));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final List<dynamic> utileriasData = jsonData['data'] ?? [];

      setState(() {
        utilerias = utileriasData
            .take(5)
            .toList(); //solo los 5 primeros productos de la lista
      });
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
            title: "Productos Recomendados",
            press: () {
              Navigator.pushNamed(context, Utilerias.routeName);
            },
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(utilerias.length, (index) {
              var utileria = utilerias[index];
              return SpecialOfferCard(
                image: utileria['util_Imagen'],
                category: utileria['util_Descripcion'],
                numOfBrands: '\L${utileria['util_Precio']}',
                press: () {
                  _agregarAlCarrito(utileria);
                },
                isFirst: index == 0,
              );
            }),
          ),
        ),
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

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({
    Key? key,
    required this.category,
    required this.image,
    required this.numOfBrands,
    required this.press,
    this.isFirst = false,
  }) : super(key: key);

  final String category, image;
  final String numOfBrands;
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
                Image.network(
                  image,
                  fit: BoxFit.cover,
                ),
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        category,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        numOfBrands,
                        style: const TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 5),
                      ElevatedButton.icon(
                        onPressed: () {
                          press();
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromARGB(255, 241, 161, 124),
                          ),
                          minimumSize: MaterialStateProperty.all<Size>(Size(140, 35)),
                        ),
                        icon: Icon(Icons.add_shopping_cart),
                        label: Text("Añadir al carrito"),
                      )
                    ],
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
