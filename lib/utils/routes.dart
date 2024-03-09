import 'package:get/get.dart';
import 'package:recipe_app/views/categories.dart';
import 'package:recipe_app/views/dashboard.dart';
import 'package:recipe_app/views/login.dart';
import 'package:recipe_app/views/registration.dart';

class Routes {
  static var routes = [
    GetPage(name: "/", page: () => Login()),
    GetPage(name: "/registration", page: () => Home()),
    GetPage(name: "/dashboard", page: () => Dashboard()),
    GetPage(name: "/categories", page: () => CategoriesCatalog())
  ];
}
