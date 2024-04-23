import 'package:flutter/widgets.dart';
//import 'package:shop_app/models/UsuarioViewModel.dart';
import 'package:shop_app/screens/products/products_screen.dart';
import 'package:shop_app/screens/usuario_index.dart';

import 'screens/cart/cart_screen.dart';
import 'screens/complete_profile/complete_profile_screen.dart';
import 'screens/details/details_screen.dart';
import 'screens/forgot_password/forgot_password_screen.dart';
import 'screens/home/home_screen.dart';
import 'screens/init_screen.dart';
import 'screens/login_success/login_success_screen.dart';
import 'screens/otp/otp_screen.dart';
import 'screens/profile/profile_screen.dart';
import 'screens/sign_in/sign_in_screen.dart';
import 'screens/sign_up/sign_up_screen.dart';
import 'screens/splash/splash_screen.dart';
import 'screens/Categorias/CategoriaSilla.dart';
import 'screens/Categorias/CategoriaManteles.dart';
import 'screens/Categorias/CategoriaMesas.dart';
import 'screens/Categorias/CategoriaCubiertos.dart';
import 'screens/Categorias/TodasLasCategorias.dart';
import 'screens/Graficos/Graficos.dart';
import 'screens/Utilerias/Utilerias.dart';
import 'screens/Utilerias/UtileriasHome.dart';
import 'screens/Paquetes/Paquetes.dart';
import 'screen/usuario_insertar.dart';

final Map<String, WidgetBuilder> routes = {
  InitScreen.routeName: (context) => const InitScreen(),
  SplashScreen.routeName: (context) => const SplashScreen(),
  SignInScreen.routeName: (context) => const SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => const ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => const LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => const SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => const CompleteProfileScreen(),
  OtpScreen.routeName: (context) => const OtpScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  ProductsScreen.routeName: (context) => const ProductsScreen(),
  DetailsScreen.routeName: (context) => const DetailsScreen(),
  CartScreen.routeName: (context) => const CartScreen(),
  WidgetUsuario.routeName: (context) => const WidgetUsuario(),
  Usuario.routeName: (context) => const Usuario(),
  CategoriaSilla.routeName: (context) => const CategoriaSilla(),
  CategoriaMesas.routeName: (context) => const CategoriaMesas(),
  CategoriaManteles.routeName: (context) => const CategoriaManteles(),
  CategoriaCubiertos.routeName: (context) => const CategoriaCubiertos(),
  TodasLasCategorias.routeName: (context) => const TodasLasCategorias(),
  Graficos.routeName: (context) => const Graficos(),
  Utilerias.routeName: (context) => const Utilerias(),
  UtileriasHome.routeName: (context) => const UtileriasHome(),
  Paquetes.routeName: (context) => const Paquetes(),
  CrearUsuarioView.routeName: (context) => const CrearUsuarioView(),
};
