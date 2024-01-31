class BusModel {
  final int id;
  final String image;
  final String name;
  final String type;
  final String driverName;
  final String driverLicenseNo;

  BusModel({
    required this.id,
    required this.image,
    required this.name,
    required this.type,
    required this.driverName,
    required this.driverLicenseNo,
  });

  factory BusModel.fromJson(Map<String, dynamic> json) {
    return BusModel(
      id: json['id'] as int,
      image: json['image'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
      driverName: json['driver_name'] as String,
      driverLicenseNo: json['driver_license_no'] as String,
    );
  }
}
