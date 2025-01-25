import 'package:flutter/widgets.dart';
import 'package:my_caff/feauture/presentation/pages/login_page/widgets/text_field_widget.dart';

class SignUpWidget extends StatefulWidget {
  const SignUpWidget(
      {super.key,
      required this.usernameCtr,
      required this.passwordCtr,
      required this.nameCtr,
      required this.emailCtr,
      required this.addressCtr});
  final TextEditingController usernameCtr;
  final TextEditingController passwordCtr;
  final TextEditingController nameCtr;
  final TextEditingController emailCtr;
  final TextEditingController addressCtr;

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  @override
  void initState() {
    super.initState();

    widget.usernameCtr.clear();
    widget.nameCtr.clear();
    widget.emailCtr.clear();
    widget.addressCtr.clear();
    widget.passwordCtr.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50),
          TextFieldWidget(
            title: 'Name',
            controller: widget.nameCtr,
            isName: true,
          ),
          SizedBox(
            height: 10,
          ),
          TextFieldWidget(
            title: 'Username',
            controller: widget.usernameCtr,
            isUsername: true,
          ),
          SizedBox(
            height: 10,
          ),
          TextFieldWidget(
            title: 'Password',
            controller: widget.passwordCtr,
            isPassword: true,
          ),
          SizedBox(
            height: 10,
          ),
          TextFieldWidget(
            title: 'Email',
            controller: widget.emailCtr,
            isEmail: true,
          ),
          SizedBox(
            height: 10,
          ),
          TextFieldWidget(
            title: 'Address',
            controller: widget.addressCtr,
            isAddress: true,
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
