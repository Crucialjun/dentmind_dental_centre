import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dentmind_dental_centre/models/doctor_model.dart';

class Appointment {
  String clientuid;
  String phonenumber;
  String branch;
  String service;
  DateTime time;
  String additionalInfo;
  Doctor doctor;
  Appointment({
    required this.clientuid,
    required this.phonenumber,
    required this.branch,
    required this.service,
    required this.time,
    required this.additionalInfo,
    required this.doctor,
  });

  Appointment copyWith({
    String? clientuid,
    String? phonenumber,
    String? branch,
    String? service,
    DateTime? time,
    String? additionalInfo,
    Doctor? doctor,
  }) {
    return Appointment(
      clientuid: clientuid ?? this.clientuid,
      phonenumber: phonenumber ?? this.phonenumber,
      branch: branch ?? this.branch,
      service: service ?? this.service,
      time: time ?? this.time,
      additionalInfo: additionalInfo ?? this.additionalInfo,
      doctor: doctor ?? this.doctor,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'clientuid': clientuid,
      'phonenumber': phonenumber,
      'branch': branch,
      'service': service,
      'time': time.millisecondsSinceEpoch,
      'additionalInfo': additionalInfo,
      'doctor': doctor.toMap()
    };
  }

  factory Appointment.fromMap(Map<String, dynamic> map) {
    return Appointment(
      clientuid: map['clientuid'] ?? '',
      phonenumber: map['phonenumber'] ?? '',
      branch: map['branch'] ?? '',
      service: map['service'] ?? '',
      time: DateTime.fromMillisecondsSinceEpoch(map['time']),
      additionalInfo: map['additionalInfo'] ?? '',
      doctor: map['doctor'] ?? '',
    );
  }

  factory Appointment.fromDocumentSnapshot(DocumentSnapshot snap) {
    return Appointment(
      clientuid: snap['clientuid'] ?? '',
      phonenumber: snap['phonenumber'] ?? '',
      branch: snap['branch'] ?? '',
      service: snap['service'] ?? '',
      time: DateTime.fromMillisecondsSinceEpoch(snap['time']),
      additionalInfo: snap['additionalInfo'] ?? '',
      doctor: Doctor.fromMap(snap['doctor']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Appointment.fromJson(String source) =>
      Appointment.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Appointment(clientuid: $clientuid, phonenumber: $phonenumber, branch: $branch, service: $service, time: $time, additionalInfo: $additionalInfo)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Appointment &&
        other.clientuid == clientuid &&
        other.phonenumber == phonenumber &&
        other.branch == branch &&
        other.service == service &&
        other.time == time &&
        other.additionalInfo == additionalInfo &&
        other.doctor == doctor;
  }

  @override
  int get hashCode {
    return clientuid.hashCode ^
        phonenumber.hashCode ^
        branch.hashCode ^
        service.hashCode ^
        time.hashCode ^
        additionalInfo.hashCode ^
        doctor.hashCode;
  }
}
