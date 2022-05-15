import 'package:flutter/material.dart';
import 'package:panda_flutter/utility/settings_utility.dart';

class ThemeToggle extends StatefulWidget {
  const ThemeToggle({Key? key, required this.settingsManager})
      : super(key: key);
  final SettingsManager settingsManager;
  @override
  State<ThemeToggle> createState() => _ThemeToggleState();
}

class _ThemeToggleState extends State<ThemeToggle> {
  // late StateMachineController themeAnimController;
  // late SMIBool darkMode;
  late SettingsManager settings;
  late bool showAppBar;

  @override
  void initState() {
    settings = widget.settingsManager;
    showAppBar = settings.showAppBar;
    super.initState();
  }

  // void _riveInit(Artboard artboard) {
  //   themeAnimController = StateMachineController.fromArtboard(
  //       artboard, artboard.stateMachines.first.name)!;
  //   artboard.addController(themeAnimController);
  //   darkMode = themeAnimController.findInput<bool>('On/Of') as SMIBool;
  //   darkMode.value = settings.darkMode;
  // }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SwitchListTile(
          value: settings.darkMode,
          onChanged: (value) {
            settings.darkMode = value;
          },
          title: Text.rich(
            TextSpan(text: "Theme Mode : ", children: [
              TextSpan(
                text: settings.darkMode ? "Dark" : "Light",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ]),
            style: theme.textTheme.bodyText2,
          ),
        ),
        SwitchListTile(
          value: showAppBar,
          onChanged: (value) {
            setState(() {
              showAppBar = value;
            });
            settings.showAppBar = value;
          },
          title: Text.rich(
            TextSpan(text: "Show AppBar : ", children: [
              TextSpan(
                text: settings.showAppBar ? "YES" : "NO",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ]),
            style: theme.textTheme.bodyText2,
          ),
        ),
      ],
    );
  }
}
