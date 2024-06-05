import 'package:agritrade/screens/auth_screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // TODO: Headings
            Text("Forget Password",style: Theme.of(context).textTheme.headlineMedium,),
            const SizedBox(
              height: 24,
            ),
            const Text("Don't worry sometimes poeple can forget too, enter your email and we will send you a password reset link."),
            const SizedBox(
              height: 24 * 2,
            ),
            TextFormField(
              decoration: const InputDecoration(
                  labelText: "E-mail",
                  prefixIcon: Icon(Iconsax.direct_right)
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: (){
                  Get.snackbar("Password Reset","Secure Link Send to your email");
                  Get.to(const LoginScreen());
                },
                child: const Text("Submit"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
