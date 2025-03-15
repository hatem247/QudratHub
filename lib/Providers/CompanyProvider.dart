import 'package:flutter/cupertino.dart';
import 'package:qudrathub/Models/Company.dart';
import '../Services/CompanyService.dart';

class CompanyProvider extends ChangeNotifier {
  Company? company;
  bool isLoading = false;
  String? errorMessage;

  Future<void> registerCompany({
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
      isLoading = true;
      notifyListeners();

      company = await CompanyService.registerService(
        name: name,
        email: email,
        phone: phone,
        password: password,
        taxRecord: taxRecord,
        adminName: adminName,
        adminEmail: adminEmail,
        adminPhone: adminPhone,
        adminPassword: adminPassword,
        directorName: directorName,
        directorEmail: directorEmail,
        directorPhone: directorPhone,
        directorPassword: directorPassword,
      );
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> logCompany({
    required String email,
    required String password,
  }) async {
    try {
      isLoading = true;
      notifyListeners();

      company = await CompanyService.logService(
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

      company = await CompanyService.updatePassword(
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