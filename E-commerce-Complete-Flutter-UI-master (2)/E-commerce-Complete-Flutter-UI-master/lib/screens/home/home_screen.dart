import 'package:flutter/material.dart';

import 'components/home_header.dart';
import 'components/special_offers.dart';
import 'package:shop_app/screens/Utilerias/UtileriasHome.dart';
import 'package:shop_app/screens/Paquetes/Paquetes.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 255, 255, 255),
              Color.fromARGB(255, 255, 255, 255).withOpacity(0.8),
              Color.fromARGB(255, 255, 255, 255).withOpacity(0.9),
              Color.fromARGB(255, 255, 255, 255),
            ],
            stops: [0.1, 0.4, 0.7, 0.9],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Column(
              children: [
                HomeHeader(),
                Paquetes(),
                SpecialOffers(),
                SizedBox(height: 20),
                UtileriasHome(),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
