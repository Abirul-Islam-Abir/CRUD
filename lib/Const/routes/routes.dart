import 'package:flutter/material.dart';
import 'package:rest_api/Const/route%20name/routes_name.dart';
import 'package:rest_api/Screen/create%20product%20screen/page/create_product_screen.dart';

import '../../Screen/home page screen/page/home_page_screen.dart';

Map<String, WidgetBuilder> get routes {
  return {
    RouteName.homePage: (context) => const HomePageScreen(),
    RouteName.createScreenPage: (context) => const CreateProductScreen(),
    // RouteName.detailsScreenPage: (context) =>   DetailsScreen(),
  };
}
