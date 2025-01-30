// ignore_for_file: deprecated_member_use

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_caff/core/utils/app_colors.dart';
import 'package:my_caff/core/utils/app_functions.dart';
import 'package:my_caff/feauture/domain/entites/user_entity.dart';
import 'package:my_caff/feauture/presentation/controllers/profile_controller.dart';
import 'package:my_caff/feauture/presentation/pages/login_page/login_page.dart';
import 'package:my_caff/feauture/presentation/pages/login_page/widgets/text_field_widget.dart';
import 'package:my_caff/feauture/presentation/widgets/custom_app_bar_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final FocusNode _usernameFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _addressFocusNode = FocusNode();

  @override
  void dispose() {
    _usernameFocusNode.dispose();
    _passwordFocusNode.dispose();
    _nameFocusNode.dispose();
    _emailFocusNode.dispose();
    _addressFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(builder: (controller) {
      if (controller.isLoading) {
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: AppColors.widgetColor,
            ),
          ),
        );
      } else {
        return controller.userInfo == null
            ? Center(
                child: ElevatedButton(
                  onPressed: () async {
                    await controller.exitProfile();
                    Get.offAll(LoginPage());
                  },
                  child: Text(
                    'EXIT',
                    style: TextStyle(color: AppColors.white),
                  ),
                ),
              )
            : Container(
                color: AppColors.bgColor,
                child: SafeArea(
                  child: Scaffold(
                    appBar: CustomAppBarWidget(
                      leftIcon: null,
                      rightIcon: null,
                      leftSize: 28.w,
                      rightSize: 0,
                      title: 'My Profile',
                    ),
                    body: SingleChildScrollView(
                      child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 36.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //MALUMOTLAR
                              Text(
                                controller.isEditing
                                    ? 'Tahrirlash'
                                    : 'Ma\'lumotlar',
                                style: TextStyle(
                                  color: AppColors.black,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),

                              //CONTAINER
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: AppColors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4,
                                      offset: Offset(0, 1),
                                      color: Colors.grey.withOpacity(0.2),
                                    )
                                  ],
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(16.0.r),
                                  child: controller.isEditing

                                      //EDIT
                                      ? Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 12.0.w),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Spacer(),
                                                  GestureDetector(
                                                    onTap: () async {
                                                      controller.editing(false);
                                                    },
                                                    child: Container(
                                                      color: AppColors.white,
                                                      child: Text(
                                                        'Chiqish',
                                                        style: TextStyle(
                                                          color: AppColors
                                                              .widgetColor,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              TextFieldWidget(
                                                title: 'Username',
                                                isUsername: true,
                                                controller:
                                                    controller.usernameCtr,
                                                focusNode: _usernameFocusNode,
                                                controllerH: controller,
                                              ),
                                              SizedBox(height: 12.h),
                                              TextFieldWidget(
                                                title: 'Parol',
                                                isPassword: true,
                                                controller:
                                                    controller.passwordCtr,
                                                focusNode: _passwordFocusNode,
                                                controllerH: controller,
                                              ),
                                              SizedBox(height: 12.h),
                                              TextFieldWidget(
                                                title: 'Ism',
                                                isName: true,
                                                controller: controller.nameCtr,
                                                focusNode: _nameFocusNode,
                                                controllerH: controller,
                                              ),
                                              SizedBox(height: 12.h),
                                              TextFieldWidget(
                                                title: 'Email',
                                                isEmail: true,
                                                controller: controller.emailCtr,
                                                focusNode: _emailFocusNode,
                                                controllerH: controller,
                                              ),
                                              SizedBox(height: 12.h),
                                              TextFieldWidget(
                                                title: 'Manzil',
                                                isAddress: true,
                                                controller:
                                                    controller.addressCtr,
                                                focusNode: _addressFocusNode,
                                                controllerH: controller,
                                              ),
                                              SizedBox(height: 20.h),
                                              GestureDetector(
                                                onTap: () async {
                                                  if (controller.isValide) {
                                                    if (controller.isChanged) {
                                                      await controller
                                                          .changeUser(
                                                        UserEntity(
                                                          name: controller
                                                              .nameCtr.text,
                                                          email: controller
                                                              .emailCtr.text,
                                                          address: controller
                                                              .addressCtr.text,
                                                          username: controller
                                                              .usernameCtr.text,
                                                          password: controller
                                                              .passwordCtr.text,
                                                        ),
                                                      );
                                                    }
                                                  }
                                                },
                                                child: Container(
                                                  height: 56,
                                                  decoration: BoxDecoration(
                                                    color: controller
                                                                .isChanged &&
                                                            controller.isValide
                                                        ? AppColors.widgetColor
                                                        : AppColors.grey,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Center(
                                                        child: controller
                                                                .isLoading2
                                                            ? Center(
                                                                child:
                                                                    CircularProgressIndicator(
                                                                color: AppColors
                                                                    .white,
                                                                strokeWidth: 2,
                                                              ))
                                                            : Text(
                                                                'O\'zgartirish',
                                                                style:
                                                                    TextStyle(
                                                                  color:
                                                                      AppColors
                                                                          .white,
                                                                  fontSize:
                                                                      18.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                              ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        )

                                      //PROFILE
                                      : Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            //EDIT
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Spacer(),
                                                GestureDetector(
                                                  onTap: () async {
                                                    controller.editing(true);
                                                  },
                                                  child: Container(
                                                    color: AppColors.white,
                                                    child: Text(
                                                      'O\'zgartirish',
                                                      style: TextStyle(
                                                        color: AppColors
                                                            .widgetColor,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 12.h),
                                            //IMAGE
                                            Center(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  GestureDetector(
                                                    onTap: () async {
                                                      if (controller
                                                          .isUploadImage) {
                                                      } else {
                                                        return await controller
                                                            .pickAndUploadPhoto();
                                                      }
                                                    },
                                                    child: Container(
                                                      width: 160,
                                                      height: 160,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                          color: controller
                                                                  .isUploadImage
                                                              ? AppColors.white
                                                              : AppColors
                                                                  .widgetColor),
                                                      child:
                                                          controller.userInfo!
                                                                      .image ==
                                                                  null
                                                              ? Icon(
                                                                  Icons.image,
                                                                  color:
                                                                      AppColors
                                                                          .white,
                                                                  size: 32.w,
                                                                )
                                                              : SizedBox(
                                                                  width: 160,
                                                                  height: 160,
                                                                  child:
                                                                      ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                    child:
                                                                        CachedNetworkImage(
                                                                      fit: BoxFit
                                                                          .cover,
                                                                      imageUrl: AppFunctions.imageUrl(controller
                                                                          .userInfo!
                                                                          .image!),
                                                                    ),
                                                                  ),
                                                                ),
                                                    ),
                                                  ),
                                                  controller.isUploadImage
                                                      ? GestureDetector(
                                                          onTap: () async {
                                                            await controller
                                                                .pickAndUploadPhoto();
                                                          },
                                                          child: Text(
                                                            'Rasmni yangilash',
                                                            style: TextStyle(
                                                              color: AppColors
                                                                  .widgetColor,
                                                              fontSize: 12.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                        )
                                                      : GestureDetector(
                                                          onTap: () async {
                                                            await controller
                                                                .pickAndUploadPhoto();
                                                          },
                                                          child: Text(
                                                            'Rasmni joylash',
                                                            style: TextStyle(
                                                              color: AppColors
                                                                  .widgetColor,
                                                              fontSize: 12.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                        ),

                                                  SizedBox(height: 12.h),
                                                  //ism
                                                  Text(
                                                    controller.userInfo!.name,
                                                    style: TextStyle(
                                                        color: AppColors.black,
                                                        fontSize: 20.sp,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Container(
                                                    color: AppColors.grey
                                                        .withOpacity(0.5),
                                                    width: ScreenUtil()
                                                            .screenWidth /
                                                        2,
                                                    height: 1,
                                                  ),

                                                  //address
                                                  Text(
                                                    controller
                                                        .userInfo!.address,
                                                    style: TextStyle(
                                                      color: AppColors.black,
                                                      fontSize: 16.sp,
                                                    ),
                                                  ),
                                                  Container(
                                                    color: AppColors.grey
                                                        .withOpacity(0.5),
                                                    width: ScreenUtil()
                                                            .screenWidth /
                                                        2,
                                                    height: 1,
                                                  ),

                                                  //email
                                                  Text(
                                                    controller.userInfo!.email,
                                                    style: TextStyle(
                                                      color: AppColors.black,
                                                      fontSize: 16.sp,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),

                                            //column
                                          ],
                                        ),
                                ),
                              )
                            ],
                          )),
                    ),
                  ),
                ),
              );
      }
    });
  }
}
