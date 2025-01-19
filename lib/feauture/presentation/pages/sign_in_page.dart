import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_caff/feauture/presentation/controllers/sign_in_controller.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final usernameCtr = TextEditingController();
  final passwordCtr = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignInController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'S I G N  I N',
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
            backgroundColor: Colors.blue,
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: TextField(
                    controller: usernameCtr,
                    decoration: InputDecoration(
                      hintText: 'username',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: TextField(
                    controller: passwordCtr,
                    decoration: InputDecoration(
                      hintText: 'password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                ElevatedButton(
                  onPressed: () async {
                    final message = await controller.onLogin(
                        username: usernameCtr.text, password: passwordCtr.text);
                    Get.snackbar('Message', message.toString());
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: Text(
                    'Sign Up',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
