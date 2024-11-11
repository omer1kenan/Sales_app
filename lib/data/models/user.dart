import 'address.dart';

class User {
  final int id;
  final String email;
  final String username;
  final String phone;
  final String firstname;
  final String lastname;
  final Address address;

  User({
    required this.id,
    required this.email,
    required this.username,
    required this.phone,
    required this.firstname,
    required this.lastname,
    required this.address,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? 0,
      email: json['email'] ?? '',
      username: json['username'] ?? '',
      phone: json['phone'] ?? '',
      firstname: json['name']['firstname'] ?? '',
      lastname: json['name']['lastname'] ?? '',
      address: Address.fromJson(json['address'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'username': username,
      'phone': phone,
      'name': {
        'firstname': firstname,
        'lastname': lastname,
      },
      'address': address.toJson(),
    };
  }
}
