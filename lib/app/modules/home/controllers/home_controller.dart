import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/models/user_model.dart';
import '../../../data/services/db_helper.dart';
import '../../../routes/app_pages.dart';

class HomeController extends GetxController {
  final nameController = TextEditingController();
  final usernameController = TextEditingController();
  final DatabaseHelper _dbHelper = DatabaseHelper.instance;

  var user = UserModel(name: '', username: '', password: '').obs;

  @override
  void onInit() {
    super.onInit();
    loadUserData();
  }

  Future<void> loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? username = prefs.getString('username');
    if (username != null) {
      UserModel? currentUser = await _dbHelper.getUserByUsername(username);
      if (currentUser != null) {
        user.value = currentUser;
        nameController.text = currentUser.name;
        usernameController.text = currentUser.username;
        print("User data loaded: ${user.value.name}, ${user.value.username}");
      } else {
        print("User not found in database");
      }
    } else {
      print("No username in shared preferences");
    }
  }

  Future<void> updateUserData() async {
    String newName = nameController.text;
    String newUsername = usernameController.text;

    if (newName.isNotEmpty && newUsername.isNotEmpty) {
      UserModel updatedUser =
          user.value.copyWith(name: newName, username: newUsername);
      await _dbHelper.updateUser(updatedUser);
      user.value = updatedUser;

      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('username', newUsername);

      Get.snackbar('Success', 'User data updated successfully');
    } else {
      Get.snackbar('Error', 'Name and username cannot be empty');
    }
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('isLoggedIn');
    await prefs.remove('username');

    Get.offAllNamed(Routes.LOGIN);
  }
}
