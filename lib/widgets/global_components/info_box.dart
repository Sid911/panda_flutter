import 'package:flutter/material.dart';

import '../../utility/settings_utility.dart';

class InfoBox extends StatelessWidget {
  const InfoBox({
    Key? key,
    required this.text,
    required this.settings,
    this.backgroundColorLight = Colors.white,
    this.backgroundColorDark = Colors.black,
  }) : super(key: key);

  final SettingsManager settings;
  final String text;
  final Color backgroundColorLight;
  final Color backgroundColorDark;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      color: settings.darkMode ? backgroundColorDark : backgroundColorLight,
      padding: const EdgeInsets.all(10),
      child: Text(
        text,
        style: theme.textTheme.bodyText2,
      ),
    );
  }
}
