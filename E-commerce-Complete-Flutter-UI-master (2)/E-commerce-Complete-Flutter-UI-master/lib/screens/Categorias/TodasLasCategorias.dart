import 'package:flutter/material.dart';
import 'package:shop_app/screens/Categorias/CategoriaSilla.dart';
import 'package:shop_app/screens/Categorias/CategoriaCubiertos.dart';
import 'package:shop_app/screens/Categorias/CategoriaMesas.dart';
import 'package:shop_app/screens/Categorias/CategoriaManteles.dart';

class TodasLasCategorias extends StatefulWidget {
  static const String routeName = '/TodasLasCategorias';

  const TodasLasCategorias({Key? key}) : super(key: key);

  @override
  _TodasLasCategoriasState createState() => _TodasLasCategoriasState();
}

class _TodasLasCategoriasState extends State<TodasLasCategorias> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todas las Categorías"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildCategoriaRectangulo(
            image: "assets/images/SillasCategoria.jpg",
            category: "Sillas",
            numOfBrands: 18,
            press: () {
              Navigator.pushNamed(context, CategoriaSilla.routeName);
            },
          ),
          _buildCategoriaRectangulo(
            image: "assets/images/PlatosCategoria.jpg",
            category: "Cristaleria, Cubiertos, Vajillas",
            numOfBrands: 24,
            press: () {
              Navigator.pushNamed(context, CategoriaCubiertos.routeName);
            },
          ),
          _buildCategoriaRectangulo(
            image: "assets/images/MesasCategoria.jpg",
            category: "Mesas",
            numOfBrands: 24,
            press: () {
              Navigator.pushNamed(context, CategoriaMesas.routeName);
            },
          ),
          _buildCategoriaRectangulo(
            image: "assets/images/MantelesCategoria.jpg",
            category: "Manteles y Servilletas",
            numOfBrands: 24,
            press: () {
              Navigator.pushNamed(context, CategoriaManteles.routeName);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCategoriaRectangulo({
    required String image,
    required String category,
    required int numOfBrands,
    required VoidCallback press,
  }) {
    return GestureDetector(
      onTap: press,
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Text(
            category,
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
