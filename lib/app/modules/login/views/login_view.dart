import 'package:auth_user/app/routes/app_pages.dart';
import 'package:auth_user/core/themes/app_colors.dart';
import 'package:auth_user/core/themes/app_fonts.dart';
import 'package:auth_user/core/widget/custom_button.dart';
import 'package:auth_user/core/widget/custom_textfield.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  LoginView({Key? key}) : super(key: key);

  final username = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: whiteColor,
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: primaryColor,
                  child: Icon(
                    Icons.person,
                    color: whiteColor,
                    size: 40,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    "Login Sekarang",
                    style: AppFonts.poppins(
                        fontSize: 18,
                        color: blackColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  "Silahkan masukkan username dan password anda",
                  style: AppFonts.poppins(fontSize: 12, color: blackColor),
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextfield(
                  label: "Username",
                  controller: username,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextfield(
                  label: "Password",
                  controller: password,
                  isObsecure: true,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                    onPressed: () {
                      controller.loginForm(username.text, password.text);
                    },
                    text: "Masuk"),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Belum Memiliki Akun?",
                      style: AppFonts.poppins(fontSize: 12, color: textColor),
                    ),
                    TextButton(
                        onPressed: () {
                          Get.toNamed(Routes.DAFTAR);
                        },
                        child: Text(
                          "Daftar Sekarang",
                          style: AppFonts.poppins(
                              fontSize: 13,
                              color: primaryColor,
                              fontWeight: FontWeight.bold),
                        ))
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
