import 'package:flutter/widgets.dart';
import 'package:my_caff/feauture/presentation/pages/login_page/widgets/text_field_widget.dart';

class SignUpWidget extends StatelessWidget {
  const SignUpWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            TextFieldWidget(title: 'Name'),
            SizedBox(
              height: 10,
            ),
            TextFieldWidget(title: 'Username'),
            SizedBox(
              height: 10,
            ),
            TextFieldWidget(title: 'Password'),
            SizedBox(
              height: 10,
            ),
            TextFieldWidget(title: 'Email'),
            SizedBox(
              height: 10,
            ),
            TextFieldWidget(title: 'Address'),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
