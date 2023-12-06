import 'package:quotes_app_flutter/models/categories_model.dart';

class LocalJsonModel {
  String jsonData;
  List<CategoryModel> categories;

  LocalJsonModel({
    required this.jsonData,
    required this.categories,
  });
}
