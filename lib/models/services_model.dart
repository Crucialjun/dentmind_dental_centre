import 'dart:convert';

class DentmindServices {
  String serviceName;
  String serviceDescription;
  String imageName;
  DentmindServices({
    required this.serviceName,
    required this.serviceDescription,
    required this.imageName,
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
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'serviceName': serviceName,
      'serviceDescription': serviceDescription,
      'imageName': imageName,
    };
  }

  factory DentmindServices.fromMap(Map<String, dynamic> map) {
    return DentmindServices(
      serviceName: map['serviceName'] ?? '',
      serviceDescription: map['serviceDescription'] ?? '',
      imageName: map['imageName'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory DentmindServices.fromJson(String source) =>
      DentmindServices.fromMap(json.decode(source));

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
}
