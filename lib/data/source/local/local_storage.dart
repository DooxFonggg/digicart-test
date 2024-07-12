import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class LocalStorageKey {
  const LocalStorageKey._();
  static const accessToken = 'accessToken';
  static const refreshToken = 'refreshToken';
  static const isDarkMode = 'isDarkMode';
  static const languageCode = 'languageCode';
}

abstract class LocalStorage {
  bool get darkMode;

  set darkMode(bool isDarkMode);

  Locale get locale;

  set locale(Locale locale);

  String? get accessToken;

  set accessToken(String? accessToken);
}

class LocalStorageImpl implements LocalStorage {
  late GetStorage _storage;

  LocalStorageImpl() {
    _storage = GetStorage();
  }

  @override
  bool get darkMode {
    return _storage.read(LocalStorageKey.isDarkMode) ?? false;
  }

  @override
  set darkMode(bool isDarkMode) {
    _storage.write(LocalStorageKey.isDarkMode, isDarkMode);
  }

  @override
  Locale get locale {
    String languageCode =
        _storage.read(LocalStorageKey.languageCode) ?? 'vi';
    return Locale(languageCode);
  }

  @override
  set locale(Locale locale) {
    _storage.write(LocalStorageKey.languageCode, locale.languageCode);
  }

  @override
  String? get accessToken {
    return _storage.read(LocalStorageKey.accessToken);
  }

  @override
  set accessToken(String? accessToken) {
    _storage.write(LocalStorageKey.accessToken, accessToken);
  }
}