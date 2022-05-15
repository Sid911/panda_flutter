import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:panda_flutter/utility/settings_utility.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ProjectCard extends StatefulWidget {
  const ProjectCard({
    Key? key,
    required this.title,
    required this.description,
    required this.images,
    required this.techChips,
    this.archived = false,
    this.link = "https://github.com/Sid911/",
  }) : super(key: key);
  final String title;
  final TextSpan description;
  final List<Widget> images;
  final List<Widget> techChips;
  final bool archived;
  final String link;
  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  final SettingsManager settingsManager = SettingsManager();
  bool expanded = false;

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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeOutExpo,
            margin: EdgeInsets.symmetric(
                horizontal: expanded ? 5 : 10, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: settingsManager.correctVariant(
                  light: Colors.black,
                  dark: Colors.white,
                ),
              ),
            ),
            child: ExpansionTile(
              maintainState: true,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      widget.title,
                      style: theme.textTheme.headline4,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      if (widget.archived)
                        Chip(
                          label: Text(
                            "Archived",
                            style: theme.textTheme.subtitle2
                                ?.copyWith(color: Colors.black),
                          ),
                          backgroundColor: const Color(0xFFD9FDFF),
                        ),
                      if (widget.link.isNotEmpty)
                        IconButton(
                            onPressed: () {
                              _launchURL(
                                  widget.link, LaunchMode.externalApplication);
                            },
                            icon: const Icon(FlutterRemix.github_fill))
                    ],
                  )
                ],
              ),
              subtitle: Container(
                margin: const EdgeInsets.only(bottom: 10),
                constraints: const BoxConstraints(maxHeight: 40),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: widget.techChips,
                ),
              ),
              trailing: Icon(
                expanded ? Icons.arrow_drop_down_circle : Icons.arrow_drop_down,
              ),
              onExpansionChanged: (bool value) {
                setState(() => expanded = value);
              },
              iconColor: theme.textTheme.caption?.color,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  child: SelectableText.rich(
                    widget.description,
                    style: theme.textTheme.bodyText2,
                  ),
                ),
                Container(
                  constraints: const BoxConstraints(maxHeight: 200),
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    physics: const BouncingScrollPhysics(),
                    children: widget.images,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
