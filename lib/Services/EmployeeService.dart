import 'package:dio/dio.dart';
import '../Models/Employee.dart';

class EmployeeService {
  static Dio dio = Dio();

  static Future<Employee> registerEmployee({
    required String name,
    required String email,
    required String gender,
    required String password,
    required String statement,
    required String phoneNumber,
    required String nationalCardFile,
    required String socialSolidarity,
  }) async {
    try {
      Response response = await dio.post(
        "http://qudratapi.runasp.net/api/Employee/Register",
        data: {
          "name": name,
          "email": email,
          "gender": gender,
          "password": password,
          "statement": statement,
          "phoneNumber": phoneNumber,
          "nationalCardFile": nationalCardFile,
          "socialSolidarity": socialSolidarity,
        },
      );

      if (response.statusCode == 200) {
        return Employee(
          name: name,
          email: email,
          gender: gender,
          password: password,
          statement: statement,
          phoneNumber: phoneNumber,
          nationalCardFile: nationalCardFile,
          socialSolidarity: socialSolidarity,
        );
      } else {
        throw "Unexpected response status: ${response.statusCode}";
      }
    } catch (error) {
      throw "Employee registration error: $error";
    }
  }

  static Future<Employee> loginEmployee({
    required String email,
    required String password,
  }) async {
    try {
      Response response = await dio.post(
        "http://qudratapi.runasp.net/api/Employee/Login",
        queryParameters: {
          "email": email,
          "password": password,
        },
      );

      if (response.statusCode == 200) {
        return Employee.fromJson(response.data);
      } else {
        throw "Login failed";
      }
    } catch (error) {
      throw "Login error: $error";
    }
  }

  static Future<Employee> updateEmployee({
    required String email,
    required String name,
    required String phoneNumber,
  }) async {
    try {
      Response response = await dio.put(
        "http://qudratapi.runasp.net/api/Employee/Update",
        data: {
          "email": email,
          "name": name,
          "phoneNumber": phoneNumber,
        },
      );

      if (response.statusCode == 200) {
        return Employee.fromJson(response.data);
      } else {
        throw "Update failed";
      }
    } catch (error) {
      throw "Update error: $error";
    }
  }

  static Future<void> deleteEmployee({
    required String email,
  }) async {
    try {
      Response response = await dio.delete(
        "http://qudratapi.runasp.net/api/Employee/Delete",
        data: {
          "email": email,
        },
      );

      if (response.statusCode != 200) {
        throw "Failed to delete employee";
      }
    } catch (error) {
      throw "Delete error: $error";
    }
  }

  static Future<Employee> updatePassword({
    required String email,
    required String password,
  }) async {
    try {
      Response response = await dio.put(
        "http://qudratapi.runasp.net/api/Employee/ForgetPassword",
        queryParameters: {"email": email, "password": password}
      );

      if (response.statusCode == 200) {
        return Employee.fromJson(response.data);
      } else {
        throw "Issue with password update";
      }
    } catch (error) {
      throw "Password update error: $error";
    }
  }
}