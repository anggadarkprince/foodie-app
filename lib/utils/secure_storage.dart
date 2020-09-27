import 'package:flutter_secure_storage/flutter_secure_storage.dart';

enum AppSecureStorageKeys {
  accessToken,
  refreshToken,
}

class SecureStorage {
  final storage = new FlutterSecureStorage();

  Future<void> setData(key, dynamic value) async {
    return await storage.write(key: key.toString(), value: value);
  }

  Future getData(key, dynamic defaultValue) async {
    return (await storage.read(key: key.toString())) ?? defaultValue;
  }

  Future<Map<String, String>> getAllData() async {
    return await storage.readAll();
  }

  Future<void> deleteData(key) async {
    return await storage.delete(key: key.toString());
  }

  Future<void> deleteAllData() async {
    return await storage.deleteAll();
  }
}