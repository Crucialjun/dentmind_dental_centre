import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Client {
  String firstName;
  String lastName;
  String email;
  String phoneNumber;
  String uid;
  String? profileImageUrl;

  Client({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.uid,
    this.profileImageUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phoneNumber': phoneNumber,
      'uid': uid,
      'profileImageUrl': profileImageUrl,
    };
  }

  factory Client.fromMap(Map<String, dynamic> map) {
    return Client(
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      email: map['email'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      uid: map['uid'] ?? '',
      profileImageUrl: map['profileImageUrl'],
    );
  }

  factory Client.fromDocumentSnapshot(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Client(
      firstName: snapshot['firstName'] ?? '',
      lastName: snapshot['lastName'] ?? '',
      email: snapshot['email'] ?? '',
      phoneNumber: snapshot['phoneNumber'] ?? '',
      uid: snapshot['uid'] ?? '',
      profileImageUrl: snapshot['profileImageUrl'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Client.fromJson(String source) => Client.fromMap(json.decode(source));

  Client copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? phoneNumber,
    String? uid,
    String? profileImageUrl,
  }) {
    return Client(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      uid: uid ?? this.uid,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
    );
  }

  @override
  String toString() {
    return 'Client(firstName: $firstName, lastName: $lastName, email: $email, phoneNumber: $phoneNumber, uid: $uid, profileImageUrl: $profileImageUrl)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Client &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.email == email &&
        other.phoneNumber == phoneNumber &&
        other.uid == uid &&
        other.profileImageUrl == profileImageUrl;
  }

  @override
  int get hashCode {
    return firstName.hashCode ^
        lastName.hashCode ^
        email.hashCode ^
        phoneNumber.hashCode ^
        uid.hashCode ^
        profileImageUrl.hashCode;
  }
}
