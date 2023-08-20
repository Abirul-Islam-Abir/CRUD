import 'package:flutter/material.dart';
import 'package:rest_api/Const/route%20name/routes_name.dart';
import 'package:rest_api/Const/routes/routes.dart';

import 'Utils/style.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: mainTheme(),
      title: 'Flutter Demo',
      initialRoute: RouteName.homePage,
      routes: routes,
    );
  }
}
