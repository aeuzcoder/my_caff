import 'package:my_caff/feauture/domain/entites/sign_in_entity.dart';

class SignInModel extends SignInEntity {
  SignInModel({
    required super.accessToken,
    required super.tokenType,
    required super.role,
  });
  Map<String, dynamic> toJson() {
    return {
      'accessToken': accessToken,
      'tokenType': tokenType,
      'role': role,
    };
  }

  factory SignInModel.fromJson(Map<String, dynamic> json) {
    return SignInModel(
      accessToken: json['accessToken'],
      tokenType: json['tokenType'],
      role: json['role'],
    );
  }
}
