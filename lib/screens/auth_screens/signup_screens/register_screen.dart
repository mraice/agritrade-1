import 'package:agritrade/screens/auth_screens/signup_screens/verify_screen.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';
import 'package:agritrade/screens/auth_screens/auth_service.dart';
import 'dart:developer';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _auth = AuthService();
  final _fname = TextEditingController();
  final _lname = TextEditingController();
  final _username = TextEditingController();
  final _email = TextEditingController();
  final _cnic = TextEditingController();
  final _ph = TextEditingController();
  final _address = TextEditingController();
  final _password = TextEditingController();

  bool loginAsAdminFlag = false;
  bool agreeTo = false;
  bool showPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 62),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Let's create your account",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: 24,
              ),

              // -- Form Field
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.user),
                          labelText: "First Name"),
                      controller: _fname,
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.user),
                          labelText: "Last Name"),
                      controller: _lname,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),

              TextFormField(
                decoration: const InputDecoration(
                    labelText: "User Name",
                    prefixIcon: Icon(Iconsax.user_edit)),
                controller: _username,
              ),
              const SizedBox(
                height: 16,
              ),

              TextFormField(
                decoration: const InputDecoration(
                    labelText: "E-mail", prefixIcon: Icon(Iconsax.activity)),
                controller: _email,
              ),
              const SizedBox(
                height: 16,
              ),

              TextFormField(
                decoration: const InputDecoration(
                    labelText: "CNIC Number", prefixIcon: Icon(Iconsax.card)),
                controller: _cnic,
              ),

              const SizedBox(
                height: 16,
              ),
              TextFormField(
                decoration: const InputDecoration(
                    labelText: "Phone Number", prefixIcon: Icon(Iconsax.call)),
                controller: _ph,
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                decoration: const InputDecoration(
                    labelText: "Address", prefixIcon: Icon(Iconsax.add)),
                controller: _address,
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
                controller: _password,
              ),

              const SizedBox(
                height: 20,
              ),

              Row(
                children: [
                  Checkbox(
                      value: loginAsAdminFlag,
                      onChanged: (value) {
                        setState(() {
                          loginAsAdminFlag = value!;
                        });
                      }),
                  Text(
                    "Login as Farmer",
                    style: Theme.of(context).textTheme.titleSmall,
                  )
                ],
              ),

              Row(
                children: [
                  Checkbox(
                      value: agreeTo,
                      onChanged: (value) {
                        setState(() {
                          agreeTo = value!;
                        });
                      }),
                  const SizedBox(
                    width: 10,
                  ),
                  Text.rich(TextSpan(children: [
                    TextSpan(
                        text: "I Agree to ",
                        style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(
                        text: "Privacy Policy",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            decoration: TextDecoration.underline,
                            color: Colors.green)),
                    TextSpan(
                        text: " and ",
                        style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(
                        text: "Condition",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Colors.green,
                            decoration: TextDecoration.underline))
                  ]))
                ],
              ),
              const SizedBox(
                height: 20,
              ),

              // -- Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _signup,
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  _signup() async {
    final user =
        await _auth.createUserWithEmailAndPassword(_email.text, _password.text);
    
    if (user != null) {
      log("User Created Succesfully");
      Get.to(const VerifyScreen());
    }

  }
}
