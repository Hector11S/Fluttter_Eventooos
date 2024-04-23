  import 'package:flutter/material.dart';

 // import 'components/categories.dart';
  //import 'components/discount_banner.dart';
  import 'components/home_header.dart';
  //import 'components/popular_product.dart';
  import 'components/special_offers.dart';
  import 'package:shop_app/screens/Utilerias/UtileriasHome.dart';
 import 'package:shop_app/screens/Paquetes/Paquetes.dart';
  
  class HomeScreen extends StatelessWidget {
    static String routeName = "/home";

    const HomeScreen({super.key});
    @override
    Widget build(BuildContext context) {
      return const Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Column(
              children: [
                HomeHeader(),
                Paquetes(),
                //DiscountBanner(),       
                SpecialOffers(),
                SizedBox(height: 20),
                UtileriasHome(),
                SizedBox(height: 20),
             
              ],
            ),
          ),
        ),
      );
    }
  }
