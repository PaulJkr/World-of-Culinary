import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/controller/logincontroller.dart';

class CustomTextField extends StatelessWidget {
  LoginController loginController = Get.put(LoginController());
  final String? hint;
  final IconData? icon;
  final IconData? prefIcon;
  final bool isPassword;
  CustomTextField(
      {super.key,
      this.hint,
      this.icon,
      this.prefIcon,
      this.isPassword = false,
      required TextEditingController controller,
      required String hintMessage,
      required bool obscureText});

  @override
  Widget build(BuildContext context) {
    return Obx(() => TextField(
          obscureText: loginController.isHidden.value,
          decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: hint,
              prefixIcon: Icon(icon),
              suffixIcon: Obx(() => GestureDetector(
                    child: Icon(loginController.isHidden.value
                        ? Icons.visibility_off
                        : Icons.visibility),
                    onTap: () => loginController.toggleHide(),
                  ))),
        ));
  }
}
