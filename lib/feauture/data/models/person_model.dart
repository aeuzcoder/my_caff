import 'package:my_caff/feauture/domain/entites/person_entity.dart';

class PersonModel extends PersonEntity {
  PersonModel({
    required super.username,
    required super.role,
    super.image,
    required super.address,
    required super.id,
    required super.name,
    required super.password,
    super.token,
    required super.email,
  });
  // Factory method to create a UserModel from JSON
  factory PersonModel.fromJson(Map<String, dynamic> json) {
    return PersonModel(
      username: json['username'],
      role: json['role'],
      image: json['image'],
      address: json['address'],
      id: json['id'],
      name: json['name'],
      password: json['password'],
      token: json['token'],
      email: json['email'],
    );
  }

  // Method to convert a UserModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'role': role,
      'image': image,
      'address': address,
      'id': id,
      'name': name,
      'password': password,
      'token': token,
      'email': email,
    };
  }
}
