import 'package:delivery_app/pages/client/products/list/client_products_list_page.dart';
import 'package:delivery_app/pages/login/login_page.dart';
import 'package:delivery_app/pages/register/register_page.dart';
import 'package:delivery_app/utils/my_colors.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      theme: ThemeData(
        useMaterial3: false,
        colorScheme: ColorScheme.fromSeed(seedColor: MyColors.primaryColor, brightness: Brightness.light)
      ),
      initialRoute: 'login',
      routes: {
        'login': (context) => const LoginPage(),
        'register': (context) => const RegisterPage(),
        'client/products/list': (context) => const ClientProductsListPage()

      },
    );
  }
}
