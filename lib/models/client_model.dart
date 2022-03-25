import 'dart:convert';

class Client {
  String firstName;
  String lastName;
  String email;
  String phoneNumber;
  String uid;

  Client({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.uid,
  });

  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phoneNumber': phoneNumber,
      'uid': uid,
    };
  }

  factory Client.fromMap(Map<String, dynamic> map) {
    return Client(
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      email: map['email'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      uid: map['uid'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Client.fromJson(String source) => Client.fromMap(json.decode(source));
}
