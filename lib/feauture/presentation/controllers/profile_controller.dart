import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import 'package:my_caff/core/errors/exception.dart';
import 'package:my_caff/feauture/data/datasources/database/db_service.dart';
import 'package:my_caff/feauture/domain/entites/person_entity.dart';
import 'package:my_caff/feauture/domain/entites/user_entity.dart';
import 'package:my_caff/feauture/presentation/controllers/base_controller.dart';

class ProfileController extends BaseController {
  PersonEntity? userInfo;
  bool isUploadImage = false;
  bool isEditing = false;
  bool isValide = false;
  bool isChanged = false;
  bool isLoading2 = false;
  final usernameCtr = TextEditingController();
  final passwordCtr = TextEditingController();
  final nameCtr = TextEditingController();
  final emailCtr = TextEditingController();
  final addressCtr = TextEditingController();

  @override
  void onClose() {
    super.onClose();
    usernameCtr.dispose();
    passwordCtr.dispose();
    nameCtr.dispose();
    emailCtr.dispose();
    addressCtr.dispose();
  }

  @override
  void onInit() async {
    super.onInit();
    changeLoading(true);
    userInfo = await getUser();
    if (userInfo != null && userInfo!.image != null) {
      isUploadImage = true;
    }
    changeLoading(false);
  }

  Future<PersonEntity?> getUser() async {
    var resultEither = await userRepo.getUser();
    if (resultEither.isRight()) {
      return resultEither.getOrElse(() => throw ServerException());
    }
    return null;
  }

  Future<void> pickAndUploadPhoto() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );
    bool resOrErr = false;

    if (result != null) {
      File file = File(result.files.single.path!);
      changeLoading(true);
      var response = await userRepo.sendPhoto(path: file.path);
      response.fold(
        (error) {
          Get.snackbar('Xatolik', error);
          resOrErr = false;
        },
        (message) {
          Get.snackbar('Muvaffaqiyatli', 'Rasm yuklandi');
          resOrErr = true;
        },
      );
      changeLoading(false);
    }

    if (resOrErr) {
      changeLoading(true);
      userInfo = await getUser();

      isUploadImage = true;
    }
    changeLoading(false);
  }

  Future<String?> changeUser(UserEntity user) async {
    changeLoading2(true);
    bool state = false;
    var response = await userRepo.changeProfile(user: user);
    response.fold(
      (error) {
        Get.snackbar('Xatolik', error);
        changeLoading(false);

        return null;
      },
      (message) {
        Get.snackbar('Muvaffaqiyatli', message);
        state = true;

        return message;
      },
    );
    if (state) {
      changeLoading2(false);
      editing(false);
      changeLoading(true);
      final response = await userRepo.signIn(
          username: user.username!, password: user.password!);
      if (response.isRight()) {
        final token = response.getOrElse(() => throw ServerException());
        await DBService.to.delAccessToken();
        await DBService.to.setAccessToken(token.accessToken);
      }

      userInfo = await getUser();

      changeLoading(false);
    } else {
      editing(false);

      changeLoading(false);
    }

    return null;
  }

  void checkInitialState() {
    if (usernameCtr.text.isNotEmpty &&
        passwordCtr.text.isNotEmpty &&
        nameCtr.text.isNotEmpty &&
        emailCtr.text.isNotEmpty &&
        addressCtr.text.isNotEmpty) {
      isChanged = true;
      update();
    } else {
      isChanged = false;
      update();
    }
  }

  void changeState(bool state) {
    isChanged = state;
    update();
  }

  void checkerValide(bool isValidate) {
    isValide = isValidate;
    update();
  }

  void changeLoading2(bool state) {
    isLoading2 = state;
    update();
  }

  void editing(bool state) {
    isEditing = state;
    update();
  }

  Future<void> exitProfile() async {
    await DBService.to.delAccessToken();
    update();
  }
}
