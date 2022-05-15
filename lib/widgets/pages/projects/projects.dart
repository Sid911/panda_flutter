import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:panda_flutter/utility/chips.dart';
import 'package:panda_flutter/utility/project_utility.dart';
import 'package:panda_flutter/utility/settings_utility.dart';
import 'package:panda_flutter/widgets/pages/projects/projects_intro.dart';

class Projects extends StatefulWidget {
  const Projects({Key? key, required this.settingsBox}) : super(key: key);
  final Box settingsBox;

  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final SettingsManager settings = SettingsManager();
  final List<Project> projects = [
    Project(
        "Summarize",
        const TextSpan(
          text:
              "Summarize is an application (in development) which aims to reduce the time people spends staring at walls of texts and help them save time. It incorporates some of my own research and public breakthroughs like BERT, GPT to bring very accurate Natural Language Models to mobile devices at sizes of less than 5MB which were as big as 1-2GB.\n\n\nThe model can relate between a lot of text and determine which things are important and related. That's the short version for now. Whether the user is finding related pieces of information from various sources in form of a project, Or just a quick and direct shortened news info. Summarize helps in all of them.",
        ),
        const [
          "images/Summarize/flutter_05.jpg",
          "images/Summarize/flutter_02.png",
          "images/Summarize/rive_animation.jpg",
        ],
        const [
          FlutterChip(),
          AdobeCreativeCloudChip(),
          FigmaChip(),
          TensorflowChip(),
          FirebaseChip(),
          CmakeChip(),
          CppChip(),
          VisualStudioCodeChip(),
          AndroidStudioChip(),
        ],
        false,
        "https://github.com/Sid911/SummarizeBuilds"),
    Project(
        "Sentencepiece Plugin",
        const TextSpan(
          text:
              "Sentencepiece Dart is a wrapper plugin for original Sentencepiece. C++ library. The plugin makes use of a little modified version of sentencepiece source which can be found in this fork (https://github.com/Sid911/sentencepiece).\n\n\nThis is used for my summarize project for preprocessing of ALBERT and related models which requires them on the fly while prediction on mobile device. But I decided to open-source it for anyone looking for this nifty solution.",
        ),
        const ["images/Summarize/rive_animation.jpg"],
        const [
          FlutterChip(),
          CppChip(),
          CmakeChip(),
          VisualStudioChip(),
          AndroidStudioChip(),
        ],
        false,
        "https://github.com/Sid911/sentencepiece_dart"),
    Project(
        "Iso Worlds",
        const TextSpan(
          text:
              "This was a flutter hack project which I wasn't able to submit on time (I was late (┬┬﹏┬┬) because I didn't realise daylight savings time was a thing as it didn't apply to me being in IST timezone). Either way this was my 2nd major-ish Flutter project ever and first time I have interacted with flutter framework to make a game.\n\nIsoWorlds as in name is a isometric 2D world where you have a line source which projects a line into the world which has to reach ending box using series of mirrors which can be moved as tiles in a puzzle. My vision for the game was to make it accessible to community, so people can make their own levels and be able to share it in their own way. Ahmm ahmm, obviously too bold of a task to be done a few weeks when I started to build the game towards the end of flutter hack.",
        ),
        const ["images/Summarize/rive_animation.jpg"],
        const [
          FlutterChip(),
          AdobeCreativeCloudChip(),
          AndroidStudioChip(),
        ],
        false,
        "https://github.com/Sid911/NotDashsAdventure"),
    Project(
      "x16 Bit Emulation",
      const TextSpan(
          text:
              "This project is basically me trying to emulate 6502 processor which is 16 bit fully on software level at a logical standpoint. This doesn't support any kind of graphical interface.\nThis main goal of this project is to understand how CPUs works by directly emulating one and to debug it by single stepping instructions. The code is meant to be readable and understandable without many comments but more for writing very cohesive testings using Gtest, a lot of things could be done better. The emulator only shows you what's going on under the hood of a 6502 CPU, without displaying stuff graphically.\n\nCurrently supported intructions group-\n\n- Load/Store Operations\n- Jumps & Calls\n- Register Transfers\n- Stack Operator\n- Logical\n- Arithmetic\n- Increments & Decrements\n- Shift\n- Branches\n- Status Flag Changes"),
      const ["images/Summarize/rive_animation.jpg"],
      const [
        CppChip(),
        VisualStudioChip(),
      ],
      true,
      "https://github.com/Sid911/x16BitEmulation",
    ),
    Project(
        "DirectX Particle Sim",
        const TextSpan(
          text:
              "This repo is basically an experiment ground for exploring Directx 12 while trying to make (absolutetly required to say trying ) a n-body simulation of some kind. I haven't explored Dx12 before so it is the perfect chance. I would like to do something similar to a Nvidia Example I tried a while ago with some kind of adjustment UI",
        ),
        const ["images/Summarize/rive_animation.jpg"],
        const [
          DirectXChip(),
          CppChip(),
          VisualStudioChip(),
        ],
        false,
        "https://github.com/Sid911/D3D12ParticleSim"),
    Project(
      "Eldron",
      const TextSpan(
        text:
            "Project Eldron was a crack at a prototype application for improvements in Health industry during MIT Jaipur, Hackathon 2021 (runner up).\n\n\nWhere we (me and my teammate) worked on creating this database application (it really sounds cliche but after a lot consideration, for any ML based thingy we found that current situation really required a modern-day DBMS for medical organisations) for health industry with 2 layer encryption for data stored in cloud for security, with ability given to organisations for publishing anonymous survey results. All these at a very low price compared to current options and added bonus of better UI. ",
      ),
      const ["images/Summarize/rive_animation.jpg"],
      const [
        ReactChip(),
        NodejsChip(),
        FirebaseChip(),
        JavaScriptChip(),
        CSSChip(),
        VisualStudioCodeChip(),
      ],
      true,
      "https://github.com/Sid911/eldron",
    ),
  ];

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

  Future<List<Widget>> _generateProjects() async {
    final List<Widget> res = List<Widget>.empty(growable: true);
    for (Project x in projects) {
      res.add(x.generateProjectCard());
    }
    return res;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: settings.correctVariant(),
      appBar: widget.settingsBox.get("showAppBar", defaultValue: false)
          ? AppBar(
              elevation: 0,
              title: const Text("Projects"),
              backgroundColor: settings.correctVariant(),
            )
          : null,
      body: SafeArea(
        child: SingleChildScrollView(
          child: FutureBuilder<List<Widget>>(
            future: _generateProjects(),
            builder: (BuildContext context, snapshot) {
              if (snapshot.hasData) {
                final data = snapshot.data!;
                data.insert(0, const ProjectsIntro());
                return Container(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: data,
                  ),
                );
              }
              return Column(
                children: [
                  Text(
                    "Problem with loading projects",
                    style: theme.textTheme.headline2,
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
