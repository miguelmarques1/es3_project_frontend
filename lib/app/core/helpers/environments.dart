import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environments {
  Environments._();

  static String? param(String paramName) {
    return dotenv.get(paramName);
  }

  static Future<void> loadEnvs() async {
    if (!kDebugMode) {
      await dotenv.load();
    }
  }
}
