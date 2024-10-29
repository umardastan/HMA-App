import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Helper {
  final storage = const FlutterSecureStorage();
  final Future<SharedPreferences> prefs0 = SharedPreferences.getInstance();
  
  Future<void> saveToken(String token) async {
    await storage.write(key: 'auth_token', value: token);
  }

  Future<String?> getToken() async {
    return await storage.read(key: 'auth_token');
  }

  Future<void> deleteToken() async {
    await storage.delete(key: 'auth_token');
  }

  Future<void> saveDataUser(String data) async {
    final SharedPreferences prefs = await prefs0;
    prefs.setString('user', data);
  }

  Future<String?> getDataUser(String data) async {
    final SharedPreferences prefs = await prefs0;
    return prefs.getString('user');
  }

  Future<void> removeDataUser(String data) async {
    final SharedPreferences prefs = await prefs0;
    prefs.remove('user');
  }

  Future<void> saveInitialLocation(String data) async {
    final SharedPreferences prefs = await prefs0;
    prefs.setString('initialLocation', data);
  }

  Future<String?> getInitialLocation(String data) async {
    final SharedPreferences prefs = await prefs0;
    return prefs.getString('initialLocation');
  }

  Future<void> removeInitialLocation(String data) async {
    final SharedPreferences prefs = await prefs0;
    prefs.remove('initialLocation');
  }

  static String convertStatus(int Status) {
    return "";
  }

  static String? validateNotEmpty(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldName tidak boleh kosong';
    }
    return null;
  }
}
