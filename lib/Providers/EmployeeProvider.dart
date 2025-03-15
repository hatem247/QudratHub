import 'package:flutter/cupertino.dart';
import 'package:qudrathub/Models/Employee.dart';
import '../Services/EmployeeService.dart';

class EmployeeProvider extends ChangeNotifier {
  Employee? employee;
  bool isLoading = false;
  String? errorMessage;

  Future<void> registerEmployee({
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
      isLoading = true;
      notifyListeners();

      employee = await EmployeeService.registerEmployee(
        name: name,
        email: email,
        gender: gender,
        password: password,
        statement: statement,
        phoneNumber: phoneNumber,
        nationalCardFile: nationalCardFile,
        socialSolidarity: socialSolidarity,
      );
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> logEmployee({
    required String email,
    required String password,
  }) async {
    try {
      isLoading = true;
      notifyListeners();

      employee = await EmployeeService.loginEmployee(
        email: email,
        password: password,
      );
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> updatePassword({
    required String email,
    required String password,
  }) async {
    try {
      isLoading = true;
      notifyListeners();

      employee = await EmployeeService.updatePassword(
        email: email,
        password: password,
      );
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}