import 'dart:convert';

class Doctor {
  String doctorName;
  String doctorProffesion;
  String imageUrl;
  Doctor({
    required this.doctorName,
    required this.doctorProffesion,
    required this.imageUrl,
  });

  Doctor copyWith({
    String? doctorName,
    String? doctorProffesion,
    String? imageUrl,
  }) {
    return Doctor(
      doctorName: doctorName ?? this.doctorName,
      doctorProffesion: doctorProffesion ?? this.doctorProffesion,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'doctorName': doctorName,
      'doctorProffesion': doctorProffesion,
      'imageUrl': imageUrl,
    };
  }

  factory Doctor.fromMap(Map<String, dynamic> map) {
    return Doctor(
      doctorName: map['doctorName'] ?? '',
      doctorProffesion: map['doctorProffesion'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Doctor.fromJson(String source) => Doctor.fromMap(json.decode(source));

  @override
  String toString() =>
      'Doctor(doctorName: $doctorName, doctorProffesion: $doctorProffesion, imageUrl: $imageUrl)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Doctor &&
        other.doctorName == doctorName &&
        other.doctorProffesion == doctorProffesion &&
        other.imageUrl == imageUrl;
  }

  @override
  int get hashCode =>
      doctorName.hashCode ^ doctorProffesion.hashCode ^ imageUrl.hashCode;
}
