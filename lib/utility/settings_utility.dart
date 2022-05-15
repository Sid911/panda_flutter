import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class SettingsManager {
  final box = Hive.box("settings");

  bool get darkMode => box.get("darkMode", defaultValue: false);

  set darkMode(bool value) {
    box.put("darkMode", value);
  }

  bool get showAppBar => box.get("showAppBar", defaultValue: false);

  set showAppBar(bool value) {
    box.put("showAppBar", value);
  }

  Color correctVariant(
      {Color light = Colors.white, Color dark = Colors.black}) {
    return darkMode ? dark : light;
  }
}
