class Company {
  final String name;
  final String email;
  final String phone;
  final String password;
  final String taxRecord;
  final String adminName;
  final String adminEmail;
  final String adminPhone;
  final String adminPassword;
  final String directorName;
  final String directorEmail;
  final String directorPhone;
  final String directorPassword;

  Company({
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    required this.taxRecord,
    required this.adminName,
    required this.adminEmail,
    required this.adminPhone,
    required this.adminPassword,
    required this.directorName,
    required this.directorEmail,
    required this.directorPhone,
    required this.directorPassword,
  });

  // Convert JSON to Company object
  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      name: json["name"] ?? "",
      email: json["email"] ?? "",
      phone: json["phone"] ?? "",
      password: json["password"] ?? "",
      taxRecord: json["taxRecord"] ?? "",
      adminName: json["adminName"] ?? "",
      adminEmail: json["adminEmail"] ?? "",
      adminPhone: json["adminPhone"] ?? "",
      adminPassword: json["adminPassword"] ?? "",
      directorName: json["directorName"] ?? "",
      directorEmail: json["directorEmail"] ?? "",
      directorPhone: json["directorPhone"] ?? "",
      directorPassword: json["directorPassword"] ?? "",
    );
  }

  // Convert Company object to JSON
  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "phone": phone,
    "password": password,
    "taxRecord": taxRecord, // Fixed typo
    "adminName": adminName,
    "adminEmail": adminEmail,
    "adminPhone": adminPhone,
    "adminPassword": adminPassword,
    "directorName": directorName,
    "directorEmail": directorEmail,
    "directorPhone": directorPhone,
    "directorPassword": directorPassword,
  };
}