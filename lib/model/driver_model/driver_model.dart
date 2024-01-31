class DriverModel {
  final int id;
  final String name;
  final String? mobile;
  final String licenseNo;

  DriverModel({
    required this.id,
    required this.name,
    this.mobile,
    required this.licenseNo,
  });

  factory DriverModel.fromJson(Map<String, dynamic> json) {
    return DriverModel(
      id: json['id'],
      name: json['name'],
      mobile: json['mobile'],
      licenseNo: json['license_no'],
    );
  }
}
