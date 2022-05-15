import 'package:flutter/material.dart';
import 'package:panda_flutter/utility/settings_utility.dart';

import '../../global_components/info_box.dart';
import 'instructions_toggle.dart';

class Instructions extends StatelessWidget {
  const Instructions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeManager = SettingsManager();
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 80, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InfoBox(
            settings: themeManager,
            text:
                "Its getting too bright ?... Difficulty accessing sidebar fiddle with stuff below",
          ),
          ThemeToggle(settingsManager: themeManager),
        ],
      ),
    );
  }
}
