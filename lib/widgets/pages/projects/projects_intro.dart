import 'package:flutter/material.dart';

class ProjectsIntro extends StatelessWidget {
  const ProjectsIntro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(vertical: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Projects !",
            style: theme.textTheme.headline2,
          ),
          Text(
            "Kinda (＠_＠;)",
            style: theme.textTheme.subtitle1,
          )
        ],
      ),
    );
  }
}
