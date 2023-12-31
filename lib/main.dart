import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:quotes_app_flutter/controllers/theme_controller.dart';
import 'package:quotes_app_flutter/utils/globals.dart';
import 'package:quotes_app_flutter/views/screens/splash_screen.dart';
import 'models/theme_model.dart';
import 'views/screens/category_page.dart';
import 'views/screens/favorite_page.dart';
import 'views/screens/home_page.dart';
import 'views/screens/quote_details_page.dart';
import 'views/screens/theme_page.dart';

void main() async {
  await GetStorage.init();

  bool isDark = getStorage.read("isDark") ?? false;

  runApp(
    ChangeNotifierProvider(
      create: (context) =>
          ThemeController(themeModel: ThemeModel(isDark: isDark)),
      builder: (context, _) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(useMaterial3: true),
        darkTheme: ThemeData.dark(useMaterial3: true),
        themeMode: (Provider.of<ThemeController>(context).themeModel.isDark)
            ? ThemeMode.dark
            : ThemeMode.light,
        getPages: [
          GetPage(
            name: "/",
            page: () => const SplashScreen(),
          ),
          GetPage(
            name: "/homePage",
            page: () => const HomePage(),
          ),
          GetPage(
            name: "/categoryPage",
            page: () => const CategoryPage(),
          ),
          GetPage(
            name: "/quoteDetailsPage",
            page: () => const QuoteDetailsPage(),
          ),
          GetPage(
            name: "/favoritePage",
            page: () => const FavoritePage(),
          ),
          GetPage(
            name: "/backGroundThemePage",
            page: () => const BackGroundThemePage(),
          ),
        ],
      ),
    ),
  );
}
