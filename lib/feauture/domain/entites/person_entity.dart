class PersonEntity {
  final String username;
  final String role;
  final String? image;
  final String address;
  final int id;
  final String name;
  final String password;
  final String? token;
  final String email;

  PersonEntity({
    required this.username,
    required this.role,
    this.image,
    required this.address,
    required this.id,
    required this.name,
    required this.password,
    this.token,
    required this.email,
  });
}
