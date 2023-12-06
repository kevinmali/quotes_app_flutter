import 'package:get/get.dart';
import 'package:quotes_app_flutter/models/database_check_model.dart';
import 'package:quotes_app_flutter/utils/globals.dart';


class DataBaseCheckController extends GetxController {
  DataBaseCheckModel dataBaseCheckModel =
      DataBaseCheckModel(isTableInserted: false);

  dataInserted() {
    dataBaseCheckModel.isTableInserted = true;

    getStorage.write("isTableInserted", dataBaseCheckModel.isTableInserted);
    update();
  }
}
