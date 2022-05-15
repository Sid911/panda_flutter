import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Socials extends StatelessWidget {
  const Socials({Key? key}) : super(key: key);

  void _launchURL(String str, LaunchMode mode) async {
    final Uri uri = Uri.parse(str);
    if (await canLaunchUrl(uri)) {
      await launchUrlString(str, mode: mode);
    } else {
      throw 'Could not launch ${uri.path}';
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
          color: theme.primaryColor,
          border: Border.all(color: theme.primaryColorDark),
          borderRadius: const BorderRadius.all(Radius.circular(5))),
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () {
              _launchURL(
                "https://github.com/sid911",
                LaunchMode.externalApplication,
              );
            },
            icon: const Icon(FlutterRemix.github_line),
          ),
          IconButton(
            onPressed: () {
              _launchURL(
                "https://www.linkedin.com/in/siddharth-s-27692015b/",
                LaunchMode.externalApplication,
              );
            },
            icon: const Icon(FlutterRemix.linkedin_box_line),
          ),
          IconButton(
            onPressed: () {
              _launchURL(
                "https://medium.com/@siddharthdeveloperwork",
                LaunchMode.externalApplication,
              );
            },
            icon: const Icon(FlutterRemix.medium_line),
          ),
        ],
      ),
    );
  }
}
