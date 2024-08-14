import 'package:auth_user/app/routes/app_pages.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../data/models/user_model.dart';
import '../../../data/services/db_helper.dart';

class DaftarController extends GetxController {
  final DatabaseHelper _dbHelper = DatabaseHelper.instance;

  Future<void> register(String name, String username, String password) async {
    UserModel user =
        UserModel(name: name, username: username, password: password);
    await _dbHelper.createUser(user);
    Get.snackbar("Success", "Pendaftaran berhasil");
    Get.toNamed(Routes.DAFTAR);
  }

  void registerForm(String username, String name, String password) {
    if (username.isEmpty) {
      Get.snackbar("Error", "Silahkan isi username anda");
    } else if (name.isEmpty) {
      Get.snackbar("Error", "Silahkan isi nama anda");
    } else if (password.isEmpty) {
      Get.snackbar("Error", "Silahkan isi password anda");
    } else {
      register(name, username, password);
    }
  }
}
