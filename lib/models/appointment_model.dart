import 'dart:convert';

class Appointment {
  String clientuid;
  String phonenumber;
  String branch;
  String service;
  DateTime time;
  String additionalInfo;
  Appointment({
    required this.clientuid,
    required this.phonenumber,
    required this.branch,
    required this.service,
    required this.time,
    required this.additionalInfo,
  });

  Appointment copyWith({
    String? clientuid,
    String? phonenumber,
    String? branch,
    String? service,
    DateTime? time,
    String? additionalInfo,
  }) {
    return Appointment(
      clientuid: clientuid ?? this.clientuid,
      phonenumber: phonenumber ?? this.phonenumber,
      branch: branch ?? this.branch,
      service: service ?? this.service,
      time: time ?? this.time,
      additionalInfo: additionalInfo ?? this.additionalInfo,
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
        other.additionalInfo == additionalInfo;
  }

  @override
  int get hashCode {
    return clientuid.hashCode ^
        phonenumber.hashCode ^
        branch.hashCode ^
        service.hashCode ^
        time.hashCode ^
        additionalInfo.hashCode;
  }
}
