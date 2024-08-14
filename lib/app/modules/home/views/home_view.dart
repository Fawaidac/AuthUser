import 'package:auth_user/core/themes/app_colors.dart';
import 'package:auth_user/core/themes/app_fonts.dart';
import 'package:auth_user/core/widget/custom_button.dart';
import 'package:auth_user/core/widget/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: Text(
          "Home",
          style: AppFonts.poppins(
              fontSize: 18, color: primaryColor, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.logout,
              size: 20,
              color: primaryColor,
            ),
            onPressed: () {
              controller.logout();
            },
          )
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() => Text(
                    'Welcome, ${controller.user.value.name}',
                    style: AppFonts.poppins(
                        fontSize: 20,
                        color: blackColor,
                        fontWeight: FontWeight.bold),
                  )),
              const SizedBox(height: 20),
              CustomTextfield(
                  label: "Nama", controller: controller.nameController),
              const SizedBox(height: 10),
              CustomTextfield(
                  label: "Username", controller: controller.usernameController),
              const SizedBox(height: 20),
              CustomButton(
                  onPressed: () {
                    controller.updateUserData();
                  },
                  text: "Update Profil"),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
