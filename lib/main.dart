import 'package:flutter/material.dart';
import 'package:rest_api/Screen/create%20product%20screen/page/create_product_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          border: const OutlineInputBorder(),
          fillColor: Colors.grey.shade300,
          filled: true,
        ),
      ),
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => const CreateProductScreen(),
      },
      //  home: HomePageScreen(),
    );
  }
}
