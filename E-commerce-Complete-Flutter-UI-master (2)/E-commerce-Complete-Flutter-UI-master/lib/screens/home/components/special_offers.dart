import 'package:flutter/material.dart';
//import 'package:shop_app/screens/products/products_screen.dart';
import 'package:shop_app/screens/Categorias/CategoriaSilla.dart';
import 'package:shop_app/screens/Categorias/CategoriaCubiertos.dart';
import 'package:shop_app/screens/Categorias/CategoriaMesas.dart';
import 'package:shop_app/screens/Categorias/CategoriaManteles.dart';
import 'package:shop_app/screens/Categorias/TodasLasCategorias.dart';
//import 'package:shop_app/screens/usuario_index.dart';

import 'section_title.dart';

class SpecialOffers extends StatelessWidget {
  const SpecialOffers({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SectionTitle(
            title: "Categorias",
            press: () {
              Navigator.pushNamed(context, TodasLasCategorias.routeName);
            },
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SpecialOfferCard(
                image: "assets/images/SillasCategoria.jpg",
                category: "Sillas",
                numOfBrands: "",
                press: () {
                  Navigator.pushNamed(context, CategoriaSilla.routeName);
                },
              ),
              SpecialOfferCard(
                image: "assets/images/MesasCategoria.jpg",
                category: "Mesas",
                numOfBrands: "",
                press: () {
                  Navigator.pushNamed(context, CategoriaMesas.routeName);
                },
              ),
              SpecialOfferCard(
                image: "assets/images/PlatosCategoria.jpg",
                category: "Cristaleria, Cubiertos, Vajillas",
                numOfBrands: "",
                press: () {
                  Navigator.pushNamed(context, CategoriaCubiertos.routeName);
                },
              ),
              SpecialOfferCard(
                image: "assets/images/MantelesCategoria.jpg",
                category: "Manteles y Servilletas",
                numOfBrands: "",
                press: () {
                  Navigator.pushNamed(context, CategoriaManteles.routeName);
                },
              ),
              const SizedBox(width: 20),
            ],
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
    required this.image,
    required this.numOfBrands,
    required this.press,
  }) : super(key: key);

  final String category, image;
  final String numOfBrands;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: GestureDetector(
        onTap: press,
        child: SizedBox(
          width: 242,
          height: 100,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
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
                        TextSpan(text: "$numOfBrands ")
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
