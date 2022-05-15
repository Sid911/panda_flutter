import 'package:flutter/material.dart';
import 'package:panda_flutter/widgets/pages/projects/project_card.dart';

class Project {
  Project(this.name, this.description, this.assetImages, this.techChips,
      this.archived, this.projectLink);
  final String name;
  final TextSpan description;
  final List<String> assetImages;
  final List<Widget> techChips;
  final bool archived;
  final String projectLink;
  Widget generateProjectCard() {
    final List<Widget> assets = List.empty(growable: true);
    for (String x in assetImages) {
      assets.add(Container(
        margin: const EdgeInsets.only(right: 5),
        child: Image.asset(x),
      ));
    }

    return ProjectCard(
      title: name,
      description: description,
      images: assets,
      techChips: techChips,
      archived: archived,
      link: projectLink,
    );
  }
}
