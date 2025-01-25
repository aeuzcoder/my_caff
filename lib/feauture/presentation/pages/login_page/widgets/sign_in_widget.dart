// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/widgets.dart';

import 'package:my_caff/core/utils/app_colors.dart';
import 'package:my_caff/feauture/presentation/pages/login_page/widgets/text_field_widget.dart';

class SignInWidget extends StatefulWidget {
  const SignInWidget({
    super.key,
    required this.usernameCtr,
    required this.passwordCtr,
  });
  final TextEditingController usernameCtr;
  final TextEditingController passwordCtr;

  @override
  State<SignInWidget> createState() => _SignInWidgetState();
}

class _SignInWidgetState extends State<SignInWidget> {
  @override
  void initState() {
    super.initState();

    widget.usernameCtr.clear();
    widget.passwordCtr.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            TextFieldWidget(
              title: 'Username',
              controller: widget.usernameCtr,
              isUsername: true,
            ),
            SizedBox(
              height: 40,
            ),
            TextFieldWidget(
              title: 'Password',
              controller: widget.passwordCtr,
              isPassword: true,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Forgot passcode?',
              style: TextStyle(
                  fontSize: 18,
                  color: AppColors.widgetColor,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
