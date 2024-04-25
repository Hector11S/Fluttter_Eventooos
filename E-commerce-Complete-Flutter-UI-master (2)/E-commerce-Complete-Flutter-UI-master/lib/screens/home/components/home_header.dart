import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
          PopupMenuButton(
            icon: SvgPicture.asset("assets/icons/User.svg"),
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text("Login"),
                onTap: () {
                  Navigator.pushNamed(context, SignInScreen.routeName);
                },
              ),
            ],
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
