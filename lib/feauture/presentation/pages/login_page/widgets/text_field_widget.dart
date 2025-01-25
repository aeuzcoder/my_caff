import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_caff/core/utils/app_colors.dart';
import 'package:my_caff/feauture/presentation/controllers/login_controller.dart';

class TextFieldWidget extends StatefulWidget {
  final String title;
  final bool isName;
  final bool isUsername;
  final bool isEmail;
  final bool isAddress;
  final bool isPassword;
  final TextEditingController controller;

  const TextFieldWidget({
    super.key,
    required this.title,
    required this.controller,
    this.isName = false,
    this.isUsername = false,
    this.isEmail = false,
    this.isAddress = false,
    this.isPassword = false,
  });

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  String? errorMessage;
  final controllerLogin = Get.find<LoginController>();

  // Универсальная функция валидации
  String? validate(String value) {
    if (widget.isName) {
      if (value.isEmpty) return 'Имя не должно быть пустым';
      if (!RegExp(r'^[a-zA-Zа-яА-Я]+$').hasMatch(value)) {
        return 'Имя должно содержать только буквы';
      }
    }
    if (widget.isUsername) {
      if (value.isEmpty) return 'Имя пользователя не должно быть пустым';
      if (value.contains(' ')) {
        return 'Имя пользователя не должно содержать пробелов';
      }
    }
    if (widget.isEmail) {
      if (value.isEmpty) return 'Email не должен быть пустым';
      if (!RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(value)) {
        return 'Введите корректный Email';
      }
    }
    if (widget.isAddress) {
      if (value.isEmpty) return 'Адрес не должен быть пустым';
    }
    if (widget.isPassword) {
      if (value.isEmpty) return 'Пароль не должен быть пустым';
      if (value.length < 6) {
        return 'Пароль должен содержать не менее 6 символов';
      }
    }
    return null; // Нет ошибок
  }

  // Метод для проверки валидности

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: TextStyle(
            fontSize: 16,
            color: AppColors.blvk03,
            fontWeight: FontWeight.w500,
          ),
        ),
        TextFormField(
          onTapOutside: (tab) => FocusScope.of(context).unfocus(),
          controller: widget.controller,
          decoration: InputDecoration(
            errorText: errorMessage,
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.blvk01),
            ),
          ),
          style: const TextStyle(
            decorationColor: AppColors.bgColor,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
          onChanged: (value) {
            // Обновляем состояние с ошибкой
            setState(() {
              errorMessage = validate(value);
              if (errorMessage == null) {
                controllerLogin.checkerValide(true);
              } else {
                controllerLogin.checkerValide(false);
              }
            });
          },
        ),
      ],
    );
  }
}
