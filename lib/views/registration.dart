import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/configs/constants.dart';
import 'package:recipe_app/views/customtext.dart';
import 'package:recipe_app/views/customtextfield.dart';

class Home extends StatelessWidget {
  Home({Key? key});
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController secondNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailAddressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // Extend body behind the AppBar
      appBar: AppBar(
        title: const Text("World of Culinary"),
        backgroundColor:
            Colors.transparent, // Set AppBar background color to transparent
        foregroundColor: appWhiteColor,
      ),
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/cover.jpg',
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/knife.jpg",
                          height: 120,
                          width: 120,
                        ),
                      ],
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          label: "Registration Screen",
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const CustomText(
                      label: "First name",
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.normal,
                    ),
                    CustomTextField(
                      controller: firstNameController,
                      hintMessage: "Enter first name",
                      icon: Icons.person,
                      obscureText: true,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const CustomText(
                      label: "Second name",
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.normal,
                    ),
                    CustomTextField(
                      controller: secondNameController,
                      icon: Icons.person,
                      hintMessage: "Enter second name",
                      obscureText: false,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const CustomText(
                      label: "Phone number",
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.normal,
                    ),
                    CustomTextField(
                      controller: phoneNumberController,
                      icon: Icons.phone,
                      hintMessage: "Enter phone number",
                      obscureText: false,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const CustomText(
                      label: "Email address",
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.normal,
                    ),
                    CustomTextField(
                      controller: emailAddressController,
                      icon: Icons.email,
                      hintMessage: "Enter email address",
                      obscureText: false,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const CustomText(
                      label: "Password",
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.normal,
                    ),
                    CustomTextField(
                      controller: passwordController,
                      hintMessage: "Enter password",
                      icon: Icons.lock,
                      obscureText: true,
                      isPassword: true,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const CustomText(
                      label: "Re-enter Password",
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.normal,
                    ),
                    CustomTextField(
                      controller: confirmPasswordController,
                      hintMessage: "Enter password again",
                      icon: Icons.lock,
                      obscureText: true,
                      isPassword: true,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    MaterialButton(
                      onPressed: () => Get.toNamed("/dashboard"),
                      color: Colors.transparent,
                      height: 50,
                      minWidth: double.maxFinite,
                      child: const Text(
                        "Register",
                        style: TextStyle(color: appWhiteColor),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
