import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:recipe_app/configs/constants.dart';
import 'package:recipe_app/views/customtext.dart';
import 'package:recipe_app/views/customtextfield.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Get the screen size
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/food.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              title: const CustomText(
                label: "World of Culinary",
                fontSize: 100,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w900,
                labelColor: appWhiteColor,
              ),
              backgroundColor: Colors.transparent,
              foregroundColor: appWhiteColor,
              centerTitle: true,
              actions: [
                IconButton(
                  icon: const Icon(Icons.refresh),
                  onPressed: () {
                    // Refresh action
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.dark_mode),
                  onPressed: () {
                    // Toggle dark mode action
                  },
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                screenSize.width * 0.2, // 10% of the screen width on the left
                screenSize.height * 0.2, // 10% of the screen height at the top
                screenSize.width * 0.1, // 10% of the screen width on the right
                screenSize.height *
                    0.1, // 10% of the screen height at the bottom
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/book.jpg',
                        width: 200,
                        height: 200,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        label: "Login Screen",
                        fontSize: 40,
                        labelColor: appWhiteColor,
                        fontWeight: FontWeight.normal,
                        fontStyle: FontStyle.italic,
                      ),
                    ],
                  ),
                  const CustomText(
                    label: "Username",
                    fontWeight: FontWeight.normal,
                    fontStyle: FontStyle.normal,
                  ),
                  CustomTextField(
                    hint: "Phone number or email",
                    icon: Icons.person,
                    hintMessage: '',
                    obscureText: false,
                    controller: phoneNumberController,
                  ),
                  const CustomText(
                    label: "Password",
                    fontWeight: FontWeight.normal,
                    fontStyle: FontStyle.normal,
                  ),
                  CustomTextField(
                    hint: "Secure Pin",
                    icon: Icons.lock,
                    prefIcon: Icons.visibility,
                    isPassword: true,
                    controller: passwordController,
                    hintMessage: '',
                    obscureText: true,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomText(
                        label: "Forgot Password: ",
                        fontSize: 14,
                        labelColor: appGreyColor,
                        fontWeight: FontWeight.normal,
                        fontStyle: FontStyle.normal,
                      ),
                      CustomText(
                        label: "Recover?",
                        fontSize: 12,
                        labelColor: primaryColor,
                        fontWeight: FontWeight.normal,
                        fontStyle: FontStyle.normal,
                      ),
                    ],
                  ),
                  MaterialButton(
                    onPressed: () => Get.toNamed("/dashboard"),
                    color: Colors.transparent,
                    height: 50,
                    minWidth: double.maxFinite,
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        color: appWhiteColor,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () => Get.toNamed("/registration"),
                    child: Text(
                      "Go to SignUp",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> remotelogin() async {
    http.Response response;
    response = await http.get(Uri.parse(
        "https://todaysnewspaper.xyz/paul/Recipe/login.php?phonenumber=${phoneNumberController.text.trim()}&password=${passwordController.text.trim()}"));
    if (response.statusCode == 200) {
      var serverResponse = json.decode(response.body);
      var loginStatus = serverResponse['success'];
      if (loginStatus == 1) {
        //navigate to dashboard
        print("Login Success");
      } else {
        print("Username/Password is invalid");
      }
    } else {
      print("Server Error ${response.statusCode}");
    }
  }
}
