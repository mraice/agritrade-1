import 'dart:developer';

import 'package:agritrade/screens/auth_screens/signup_screens/forget_password.dart';
import 'package:agritrade/screens/auth_screens/signup_screens/register_screen.dart';
import 'package:agritrade/screens/navigation_bar.dart';
import 'package:agritrade/screens/portals/admin_portal/admin_portal.dart';
import 'package:agritrade/screens/portals/farmer_portal/navigation_bar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:agritrade/screens/auth_screens/signup_screens/loginFailed.dart';

import 'package:agritrade/screens/auth_screens/auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = AuthService();

  bool rememberFlag = false;
  bool loginAsFarmerFlag = false;
  bool showPassword = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 32,
              ),
              SizedBox(
                  height: 170,
                  child:
                      Image.asset("assets/brand_artworks/agri_trade_logo.png")),
              const SizedBox(
                height: 12,
              ),
              Text(
                "Welcome Back,",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                "Discover Limitless Agricultural Seeds and Unmatched Convenience",
                style: Theme.of(context).textTheme.labelLarge,
              ),
              const SizedBox(
                height: 24,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right),
                  labelText: "E-mail",
                ),
                controller: emailController,
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: "Password",
                    prefixIcon: const Icon(Iconsax.password_check),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            showPassword = !showPassword;
                          });
                        },
                        icon: Icon(
                            showPassword ? Iconsax.eye : Iconsax.eye_slash))),
                obscureText: showPassword,
                controller: passwordController,
              ),
              const SizedBox(
                height: 16 / 2,
              ),

              // -- Remember Me
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                              value: rememberFlag,
                              onChanged: (value) {
                                setState(() {
                                  rememberFlag = value!;
                                });
                              }),
                          Text(
                            "Remember Me",
                            style: Theme.of(context).textTheme.titleSmall,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                              value: loginAsFarmerFlag,
                              onChanged: (value) {
                                setState(() {
                                  loginAsFarmerFlag = value!;
                                });
                              }),
                          Text(
                            "Login as Farmer",
                            style: Theme.of(context).textTheme.titleSmall,
                          )
                        ],
                      ),
                    ],
                  ),
                  TextButton(
                      onPressed: () => Get.to(const ForgetPassword()),
                      child: const Text(
                        "Forget Password?",
                        style: TextStyle(color: Colors.green),
                      ))
                ],
              ),

              const SizedBox(
                height: 24,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _login,
                  child: const Text("Sign in"),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () => Get.to(const RegisterScreen()),
                  child: const Text("Create Account"),
                ),
              ),
              const SizedBox(
                height: 24,
              ),

              // --- Divider With Text
              Row(
                children: [
                  const Flexible(
                    child: Divider(
                      color: Colors.grey,
                      thickness: 0.5,
                      indent: 60,
                      endIndent: 5,
                    ),
                  ),
                  Text(
                    "Or Sign Up With",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  const Flexible(
                    child: Divider(
                      color: Colors.grey,
                      thickness: 0.5,
                      indent: 5,
                      endIndent: 60,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 24,
              ),

              // --- Google & Facebook
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: IconButton(
                        onPressed: () {},
                        icon: const Image(
                          height: 24,
                          width: 24,
                          image: AssetImage(
                              "assets/brand_artworks/google-logo.png"),
                        )),
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: IconButton(
                        onPressed: () {},
                        icon: const Image(
                          height: 24,
                          width: 24,
                          image: AssetImage(
                              "assets/brand_artworks/facebook-logo.png"),
                        )),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  _login() async {
    final user = await _auth.loginUserWithEmailAndPassword(
        emailController.text, passwordController.text);

    if (user != null) {
      log("User Logged In");
      if (loginAsFarmerFlag == true) {
        Get.offAll(const FarmerNavigationMenue());
      } else if (emailController.text == "admin" &&
          passwordController.text == "admin") {
        Get.to(const AdminPortal());
      } else {
        Get.to(const loginFailed());
      }
    }
    else{
      Get.to(const loginFailed());
    }
  }
}
