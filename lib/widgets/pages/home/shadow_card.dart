import 'package:flutter/material.dart';
import 'package:panda_flutter/utility/settings_utility.dart';

class ShadowCard extends StatelessWidget {
  ShadowCard({Key? key, required this.controller})
      : matrixRotation = Tween<double>(
          begin: -.22,
          end: 0,
        ).animate(
          CurvedAnimation(parent: controller, curve: Curves.bounceOut),
        ),
        marginLeft = Tween<double>(
          begin: 0,
          end: 20,
        ).animate(
          CurvedAnimation(parent: controller, curve: Curves.linear),
        ),
        super(key: key);

  final AnimationController controller;
  final Animation<double> matrixRotation;
  final Animation<double> marginLeft;
  final SettingsManager settingsManager = SettingsManager();

  Widget _buildAnimation(BuildContext context, Widget? child) {
    final theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.only(top: 100, left: marginLeft.value),
      width: MediaQuery.of(context).size.width + 30,
      height: 400,
      transform: Matrix4.rotationZ(matrixRotation.value),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: theme.primaryColor,
        border: Border.all(
            color: settingsManager.correctVariant(
                light: Colors.black, dark: Colors.black)),
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        boxShadow: [
          BoxShadow(
            offset: const Offset(-30, 50),
            color: settingsManager.correctVariant(
                light: Colors.black.withOpacity(0.2),
                dark: theme.primaryColorDark),
          )
        ],
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AnimatedBuilder(
      animation: controller,
      builder: _buildAnimation,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(
                  TextSpan(
                    text: "My name is ",
                    style: theme.textTheme.bodyText1,
                    children: const [
                      TextSpan(
                        text: "Siddharth",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationStyle: TextDecorationStyle.dashed,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(text: " or in short "),
                      TextSpan(
                        text: "Sid",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationStyle: TextDecorationStyle.wavy,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  "Have a drink you might be thirsty(⌐■_■)",
                  style: theme.textTheme.bodyText2,
                ),
              ],
            ),
          ),
          Flexible(
            fit: FlexFit.tight,
            child: Image.asset("images/panda_boba_tea.png"),
            flex: 2,
          )
        ],
      ),
    );
  }
}
