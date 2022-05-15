import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Core Chip Widget

class SvgChip extends StatelessWidget {
  const SvgChip({Key? key, required this.assetPath, this.svgColor})
      : super(key: key);
  final String assetPath;
  final Color? svgColor;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final Color? background = theme.scaffoldBackgroundColor;
    return Container(
      margin: const EdgeInsets.only(right: 5),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: background,
        borderRadius: const BorderRadius.all(Radius.circular(5)),
      ),
      child: SvgPicture.asset(
        assetPath,
        height: 40,
        fit: BoxFit.fitHeight,
        color: svgColor,
      ),
    );
  }
}

// Derivative widgets

class AdobeCreativeCloudChip extends StatelessWidget {
  const AdobeCreativeCloudChip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SvgChip(assetPath: "images/svg/Adobe Creative Cloud.svg");
  }
}

class AndroidStudioChip extends StatelessWidget {
  const AndroidStudioChip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SvgChip(
      assetPath: "images/svg/Android Studio.svg",
      svgColor: Colors.greenAccent,
    );
  }
}

class CmakeChip extends StatelessWidget {
  const CmakeChip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SvgChip(assetPath: "images/svg/CMake.svg");
  }
}

class CppChip extends StatelessWidget {
  const CppChip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SvgChip(assetPath: "images/svg/Cpp.svg");
  }
}

class CSharpChip extends StatelessWidget {
  const CSharpChip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SvgChip(assetPath: "images/svg/CSharp.svg");
  }
}

class CSSChip extends StatelessWidget {
  const CSSChip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SvgChip(assetPath: "images/svg/CSS.svg");
  }
}

class DirectXChip extends StatelessWidget {
  const DirectXChip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SvgChip(assetPath: "images/svg/Directx.svg");
  }
}

class FigmaChip extends StatelessWidget {
  const FigmaChip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SvgChip(assetPath: "images/svg/Figma.svg");
  }
}

class FirebaseChip extends StatelessWidget {
  const FirebaseChip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SvgChip(assetPath: "images/svg/Firebase.svg");
  }
}

class FlutterChip extends StatelessWidget {
  const FlutterChip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SvgChip(assetPath: "images/svg/Flutter.svg");
  }
}

class GCPChip extends StatelessWidget {
  const GCPChip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SvgChip(assetPath: "images/svg/GCP.svg");
  }
}

class HTML5Chip extends StatelessWidget {
  const HTML5Chip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SvgChip(assetPath: "images/svg/HTML5.svg");
  }
}

class InteliJIdeaChip extends StatelessWidget {
  const InteliJIdeaChip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SvgChip(assetPath: "images/svg/Intelij Idea.svg");
  }
}

class JavaScriptChip extends StatelessWidget {
  const JavaScriptChip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SvgChip(assetPath: "images/svg/JavaScript.svg");
  }
}

class NodejsChip extends StatelessWidget {
  const NodejsChip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SvgChip(assetPath: "images/svg/Nodejs.svg");
  }
}

class NvidiaCudaChip extends StatelessWidget {
  const NvidiaCudaChip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SvgChip(assetPath: "images/svg/Nvidia Cuda.svg");
  }
}

class PycharmChip extends StatelessWidget {
  const PycharmChip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SvgChip(assetPath: "images/svg/Pycharm.svg");
  }
}

class PythonChip extends StatelessWidget {
  const PythonChip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SvgChip(assetPath: "images/svg/Python.svg");
  }
}

class RaylibChip extends StatelessWidget {
  const RaylibChip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SvgChip(assetPath: "images/svg/raylib.svg");
  }
}

class ReactChip extends StatelessWidget {
  const ReactChip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SvgChip(assetPath: "images/svg/React.svg");
  }
}

class RustChip extends StatelessWidget {
  const RustChip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SvgChip(assetPath: "images/svg/Rust.svg");
  }
}

class SASSChip extends StatelessWidget {
  const SASSChip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SvgChip(assetPath: "images/svg/SASS.svg");
  }
}

class TensorflowChip extends StatelessWidget {
  const TensorflowChip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SvgChip(assetPath: "images/svg/Tensorflow.svg");
  }
}

class TypeScriptChip extends StatelessWidget {
  const TypeScriptChip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SvgChip(assetPath: "images/svg/TypeScript.svg");
  }
}

class UnityChip extends StatelessWidget {
  const UnityChip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SvgChip(assetPath: "images/svg/Unity.svg");
  }
}

class VisualStudioChip extends StatelessWidget {
  const VisualStudioChip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SvgChip(assetPath: "images/svg/Visual Studio.svg");
  }
}

class VisualStudioCodeChip extends StatelessWidget {
  const VisualStudioCodeChip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SvgChip(assetPath: "images/svg/Visual Studio Code.svg");
  }
}
