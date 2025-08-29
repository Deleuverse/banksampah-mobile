import 'package:encrypt/encrypt.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bank_sampah/app/utils/constants.dart';

import '../../../../main.dart';
import '../utils/preferences_helper.dart';

class TokenProvider {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<void> saveToken(String? accessToken, String? refreshToken) async {
    await _storage.write(key: accessTokenData, value: accessToken ?? "");
  }

  Future<String> getAccessToken() async {
    return await _storage.read(key: accessTokenData) ?? "";
  }

  Future<String> getRefereshToken() async {
    return await _storage.read(key: refreshTokenData) ?? "";
  }

  Future<void> clearToken() async {
    await _storage.delete(key: accessTokenData);
  }

  //
  // Future<void> saveToken(String? accessToken, String? refreshToken) async {
  //   saveStringToLocalStorage(accessTokenData,accessToken ?? "null");
  //   saveStringToLocalStorage(refreshTokenData, refreshToken ?? "null");
  // }



  String decryptWithAES(Encrypted encryptedData) {
    final cipherKey = Key.fromBase64(key);
    final initVector = IV.fromBase64(iv);
    final encryptService = Encrypter(AES(cipherKey));
    return encryptService.decrypt(encryptedData, iv: initVector);
  }

  Encrypted encryptWithAES(String plainText) {
    final cipherKey = Key.fromBase64(key);
    final initVector = IV.fromBase64(iv);
    final encryptService = Encrypter(AES(cipherKey));
    Encrypted encryptedData = encryptService.encrypt(plainText, iv: initVector);
    return encryptedData;
  }

  void saveStringToLocalStorage(String key, String valueToSave) async {
    final prefs = await SharedPreferences.getInstance();
    Encrypted encrypted = encryptWithAES(valueToSave);
    String encryptedString = encrypted.base64;
    prefs.setString(key, encryptedString);
  }

  getStringFromLocalStorage(String key) {
    String? encryptedString = prefs.getString(key);
    if (encryptedString == null) {
      return 'null';
    }
    Encrypted encrypted = Encrypted.fromBase64(encryptedString);
    String decryptedText = decryptWithAES(encrypted);
    return decryptedText;
  }
}



