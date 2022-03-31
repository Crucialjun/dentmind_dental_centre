import 'dart:convert';

class DentmindServices {
  String serviceName;
  String serviceDescription;
  String imageName;
  String label;
  DentmindServices({
    required this.serviceName,
    required this.serviceDescription,
    required this.imageName,
    required this.label,
  });

  DentmindServices copyWith({
    String? serviceName,
    String? serviceDescription,
    String? imageName,
  }) {
    return DentmindServices(
      serviceName: serviceName ?? this.serviceName,
      serviceDescription: serviceDescription ?? this.serviceDescription,
      imageName: imageName ?? this.imageName,
      label: serviceName ?? this.serviceName,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'serviceName': serviceName,
      'serviceDescription': serviceDescription,
      'imageName': imageName,
      'label': serviceName,
    };
  }

  factory DentmindServices.fromMap(Map<String, dynamic> map) {
    return DentmindServices(
      serviceName: map['serviceName'] ?? '',
      serviceDescription: map['serviceDescription'] ?? '',
      imageName: map['imageName'] ?? '',
      label: map['serviceName'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory DentmindServices.fromJson(Map<String, dynamic> map) {
    return DentmindServices(
      serviceName: map['serviceName'] ?? '',
      serviceDescription: map['serviceDescription'] ?? '',
      imageName: map['imageName'] ?? '',
      label: map['serviceName'] ?? '',
    );
  }

  @override
  String toString() =>
      'DentmindServices(serviceName: $serviceName, serviceDescription: $serviceDescription, imageName: $imageName)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DentmindServices &&
        other.serviceName == serviceName &&
        other.serviceDescription == serviceDescription &&
        other.imageName == imageName;
  }

  @override
  int get hashCode =>
      serviceName.hashCode ^ serviceDescription.hashCode ^ imageName.hashCode;

  factory DentmindServices.fromRawJson(String str) =>
      DentmindServices.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());
}
