class Employee {
  final String name;
  final String email;
  final String gender;
  final String password;
  final String statement;
  final String phoneNumber;
  final String nationalCardFile;
  final String socialSolidarity;

  Employee({
    required this.name,
    required this.email,
    required this.gender,
    required this.password,
    required this.statement,
    required this.phoneNumber,
    required this.nationalCardFile,
    required this.socialSolidarity,
  });

  // Convert JSON to Employee object
  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      name: json["name"] ?? "",
      email: json["email"] ?? "",
      gender: json["gender"] ?? "",
      password: json["password"] ?? "",
      statement: json["statement"] ?? "",
      phoneNumber: json["phoneNumber"] ?? "",
      nationalCardFile: json["nationalCardFile"] ?? "",
      socialSolidarity: json["socialSolidarity"] ?? "",
    );
  }

  // Convert Employee object to JSON
  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "gender": gender,
    "password": password,
    "statement": statement,
    "phoneNumber": phoneNumber,
    "nationalCardFile": nationalCardFile,
    "socialSolidarity": socialSolidarity,
  };
}