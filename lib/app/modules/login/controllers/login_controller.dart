import 'package:auth_user/app/routes/app_pages.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../data/models/user_model.dart';
import '../../../data/services/db_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  var isLoggedIn = false.obs;
  final DatabaseHelper _dbHelper = DatabaseHelper.instance;

  @override
  void onInit() {
    super.onInit();
    checkLoginStatus();
  }

  Future<void> checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? loginStatus = prefs.getBool('isLoggedIn');
    if (loginStatus == true) {
      isLoggedIn.value = true;
      Get.offAllNamed(Routes.HOME);
    }
  }

  Future<void> login(String username, String password) async {
    UserModel? user = await _dbHelper.getUser(username, password);
    if (user != null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true);
      await prefs.setString('username', user.username);
      isLoggedIn.value = true;
      Get.offAllNamed(Routes.HOME);
    } else {
      Get.snackbar('Error', 'Username atau password salah');
    }
  }

  void loginForm(String username, String password) {
    if (username.isEmpty) {
      Get.snackbar("Error", "Silahkan isi username anda");
    } else if (password.isEmpty) {
      Get.snackbar("Error", "Silahkan isi password anda");
    } else {
      login(username, password);
    }
  }
}
