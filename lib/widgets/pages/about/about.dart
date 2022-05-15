import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:panda_flutter/utility/settings_utility.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key, required this.settingsBox}) : super(key: key);
  final Box settingsBox;
  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final SettingsManager settings = SettingsManager();
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: widget.settingsBox.get("showAppBar", defaultValue: false)
          ? AppBar(
              elevation: 0,
              title: const Text("About"),
              backgroundColor: theme.scaffoldBackgroundColor,
            )
          : null,
      body: SafeArea(
        child: Container(),
      ),
    );
  }
}
