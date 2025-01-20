import 'package:flutter/widgets.dart';
import 'package:my_caff/core/utils/app_colors.dart';
import 'package:my_caff/feauture/presentation/pages/login_page/widgets/text_field_widget.dart';

class SignInWidget extends StatelessWidget {
  const SignInWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            TextFieldWidget(title: 'Email address'),
            SizedBox(
              height: 40,
            ),
            TextFieldWidget(title: 'Password'),
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
