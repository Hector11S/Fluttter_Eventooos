import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../cart/cart_screen.dart';
import 'icon_btn_with_counter.dart';
import 'search_field.dart';
import 'package:shop_app/screens/sign_in/sign_in_screen.dart';
import 'package:shop_app/screens/Carrito/CarritoScreen.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

@override
Widget build(BuildContext context) {
  return Container(
    color: const Color.fromARGB(255, 255, 255, 255), 
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(child: SearchField()),
          const SizedBox(width: 16),
        PopupMenuItem(
          child: Text("Cerrar Sesión"),
          onTap: () async {
            // Eliminar datos de SharedPreferences
          Navigator.of(context).pushNamedAndRemoveUntil(SignInScreen.routeName, (route)=>false);

          },
        ),
          const SizedBox(width: 8),
          IconBtnWithCounter(
            svgSrc: "assets/icons/Cart Icon.svg",
            press: () => Navigator.pushNamed(context, CarritoScreen.routeName),
          ),
        ],
      ),
    ),
  );
}
}
