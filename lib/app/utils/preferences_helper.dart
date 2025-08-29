import 'dart:convert';


import 'package:bank_sampah/app/core/response/user_response.dart';
import 'package:encrypt/encrypt.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../main.dart';

final key = "+CpmgXqrLYW+LoXI6WzTUhqbFVRftLPT1tsMNMRVYLo=";
final iv = "ynD3seHoq00N6Dqc2HPfXw==";

class PreferencesHelper {
  // ------------------------- KEYS ----------------------------
  static const String _roleType = 'roleType';
  static const String _roleTypeAdd = '_roleTypeAdd';
  static const String _selectedProfile = 'selectedProfile';

  static const String _eventCode = 'eventCode';
  static const String _isConnect = 'isConnect';
  static const String _interactionType = 'interactionType';
  static const String _isFirstOnboarding = 'isFirstOnboarding';
  static const String _isFirstLogin = 'isFirstLogin';
  static const String _dataUser = 'dataUser';
  static const String _selectedRoleType = 'selectedRoleType';
  static const String _hasSeenIntroActivityPlan = 'hasSeenIntroActivityPlan';
  static const String _hasSeenIntroCampaignBasicInfo =
      'hasSeenIntroCampaignBasicInfo';
  static const String _hasSeenIntroSetupPanel = 'hasSeenIntroSetupPanel';

  // -----------------------------------------------------------

// Add these methods to the PreferencesHelper class
//   void saveSelectedRoleType(String type) async {
//     saveStringToLocalStorage(_selectedRoleType, type);
//   }
//
//   String getSelectedRoleType() {
//     return getStringFromLocalStorage(_selectedRoleType) ?? getRoleType();
//   }

  void saveSelectedProfile(String idProfile) async {
    saveStringToLocalStorage(_selectedProfile, idProfile);
  }

  String getSelectedProfile() {
    return getStringFromLocalStorage(_selectedProfile) ?? 'null';
  }

  void saveDataUser(UserResponse dataUser) async {
    await prefs.setString(_dataUser, jsonEncode(dataUser.toJson()));
  }

  static UserResponse? getDataUser() {
    final userObject = prefs.getString(_dataUser);
    if (userObject != null) {
      return UserResponse.fromJson(jsonDecode(userObject));
    } else {
      return null;
    }
  }

  void saveIsFirstLogin(bool isConnect) async {
    await prefs.setBool(_isFirstLogin, isConnect);
  }

  static bool getIsFirstLogin() {
    return prefs.getBool(_isFirstLogin) ?? false;
  }

  void saveIsFirstOnboarding(bool isConnect) async {
    await prefs.setBool(_isFirstOnboarding, isConnect);
  }

  void saveHasSeenIntroActivityPlan(bool hasSeen) async {
    await prefs.setBool(_hasSeenIntroActivityPlan, hasSeen);
  }

  static bool getHasSeenIntroActivityPlan() {
    return prefs.getBool(_hasSeenIntroActivityPlan) ?? false;
  }

  static bool getHasSeenIntroCampaignBasicInfo() {
    return prefs.getBool(_hasSeenIntroCampaignBasicInfo) ?? false;
  }

  void saveHasSeenIntroCampaignBasicInfo(bool hasSeen) async {
    await prefs.setBool(_hasSeenIntroCampaignBasicInfo, hasSeen);
  }

  void saveHasSeenIntroSetupPanel(bool hasSeen) async {
    await prefs.setBool(_hasSeenIntroSetupPanel, hasSeen);
  }

  static bool getHasSeenIntroSetupPanel() {
    return prefs.getBool(_hasSeenIntroSetupPanel) ?? false;
  }

  static bool getIsFirstOnboarding() {
    return prefs.getBool(_isFirstOnboarding) ?? false;
  }

  void saveIsconnect(bool isConnect) async {
    await prefs.setBool(_isConnect, isConnect);
  }

  static bool getIsConnect() {
    return prefs.getBool(_isConnect) ?? false;
  }

  void saveInteractionType(String type) async {
    saveStringToLocalStorage(_interactionType, type);
  }

  String getInteractionType() {
    return getStringFromLocalStorage(_interactionType) ?? 'null';
  }

  void saveEventCode(String type) async {
    saveStringToLocalStorage(_eventCode, type);
  }

  String getEventCode() {
    return getStringFromLocalStorage(_eventCode) ?? 'null';
  }

  void saveRoleTypeAdd(String type) async {
    saveStringToLocalStorage(_roleTypeAdd, type);
  }

  String getRoleTypeAdd() {
    return getStringFromLocalStorage(_roleTypeAdd) ?? 'null';
  }

  void saveRoleType(String type) async {
    saveStringToLocalStorage(_roleType, type);
  }

  String getRoleType() {
    return getStringFromLocalStorage(_roleType) ?? 'null';
  }

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
