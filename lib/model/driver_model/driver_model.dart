class Driver {
  final int id;
  final String name;
  final String? mobile;
  final String licenseNo;

  Driver({
    required this.id,
    required this.name,
    this.mobile,
    required this.licenseNo,
  });

  factory Driver.fromJson(Map<String, dynamic> json) {
    return Driver(
      id: json['id'],
      name: json['name'],
      mobile: json['mobile'],
      licenseNo: json['license_no'],
    );
  }
}
