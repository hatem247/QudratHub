import 'package:dio/dio.dart';
import 'package:qudrathub/Models/Company.dart';

class CompanyService {
  static Dio dio = Dio();

  static Future<Company> registerService({
    required String name,
    required String email,
    required String phone,
    required String password,
    required String taxRecord,
    required String adminName,
    required String adminEmail,
    required String adminPhone,
    required String adminPassword,
    required String directorName,
    required String directorEmail,
    required String directorPhone,
    required String directorPassword,
  }) async {
    try {
      Response response = await dio.post(
        "http://qudratapi.runasp.net/api/Company/SignUp",
        data: {
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
        },
      );

      if (response.statusCode == 200) {
        return Company.fromJson(response.data);
      } else {
        throw "Unexpected response status: ${response.statusCode}";
      }
    } catch (error) {
      if (error is DioException) {
        if (error.response?.statusCode == 400) {
          Map<String, dynamic>? errors = error.response?.data['errors'];
          if (errors != null) {
            String errorMessage = errors.entries
                .map((entry) => "${entry.key}: ${entry.value.join(", ")}")
                .join("\n");
            throw "Validation errors:\n$errorMessage";
          }
        }
        throw "API error: ${error.response?.data['title'] ?? 'Unknown error'}";
      }
      throw "Registration error: $error";
    }
  }

  static Future<Company> logService({
    required String email,
    required String password,
  }) async {
    try {
      Response response = await dio.post(
        "http://qudratapi.runasp.net/api/Company/Login",
        queryParameters: {
          "email": email,
          "password": password,
        },
      );

      if (response.statusCode == 200) {
        return Company.fromJson(response.data);
      } else {
        throw "Issue with login";
      }
    } catch (error) {
      throw "Login error: $error";
    }
  }

  static Future<Company> updatePassword({
    required String email,
    required String password,
  }) async {
    try {
      Response response = await dio.put(
        "http://qudratapi.runasp.net/api/Company/ForgetPassword",
        queryParameters: {"email": email, "password": password}
      );

      if (response.statusCode == 200) {
        return Company.fromJson(response.data);
      } else {
        throw "Issue with password update";
      }
    } catch (error) {
      throw "Password update error: $error";
    }
  }
}