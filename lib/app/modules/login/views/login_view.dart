import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:e_tourism/app/modules/login/controllers/login_controller.dart';
import 'package:e_tourism/app/modules/login/views/widgets/app_text_field.dart';
import 'package:e_tourism/app/modules/login/views/widgets/auth_background.dart';
import 'package:e_tourism/config/translations/strings_enum.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AuthBackground(title: Strings.login.tr),
            SizedBox(height: 30.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: AppTextField(
                controller: controller.emailController,
                labelText: Strings.email.tr,
                keyboardType: TextInputType.text,
                hint: "example@gmail.com",
              ),
            ),
            SizedBox(height: 30.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: AppTextField(
                controller: controller.passwordController,
                obscureText: true,
                labelText: Strings.password.tr,
                keyboardType: TextInputType.text,
                hint: '12345',
              ),
            ),
            SizedBox(height: 20.h),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(340.h, 50.w),
                backgroundColor: Colors.deepPurple,
              ),
              // onPressed: () => controller.signIn(
              //   controller.nameController.text,
              //   controller.passwordController.text,
              // ),
              onPressed:() {
                Navigator.pushNamed(
                    context, '/home_dash');
              },
              child: Text(Strings.login.tr,style: TextStyle(color: Colors.white)),
            ),
            SizedBox(height: 20.h),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: Strings.notHaveAccount.tr,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  const TextSpan(text: ' '),
                  TextSpan(
                    recognizer: controller.tapGestureRecognizer,
                    text: Strings.newAccount.tr,
                    style: TextStyle(
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
