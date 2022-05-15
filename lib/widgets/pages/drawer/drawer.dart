import 'dart:math';

import 'package:flutter/material.dart';

import 'Socials.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key, this.index = 0}) : super(key: key);
  final int index;
  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> marginTop;
  late Animation<double> opacityChild;
  final totalTime = 700;
  late int index;
  @override
  void initState() {
    super.initState();

    index = widget.index;

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: totalTime),
    );
    marginTop = Tween<double>(
      begin: 0,
      end: 100,
    ).animate(
      CurvedAnimation(
          parent: _animationController, curve: Curves.easeInToLinear),
    );
    opacityChild = Tween<double>(
      begin: 0,
      end: 3,
    ).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.linear));
    _animationController.forward().orCancel;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Drawer(
      width: MediaQuery.of(context).size.width,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (BuildContext context, Widget? child) {
          return Container(
            color: theme.brightness == Brightness.dark
                ? Colors.black
                : Colors.white,
            padding: EdgeInsets.only(
                left: 30, top: marginTop.value, bottom: 20, right: 30),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Opacity(
                  opacity: marginTop.value / 100,
                  child: Text(
                    "Navigation",
                    style: theme.textTheme.bodyText1?.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Opacity(
                        opacity: min(opacityChild.value, 1),
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            " - Home",
                            style: theme.textTheme.subtitle1?.copyWith(
                              fontWeight: index == 0
                                  ? FontWeight.bold
                                  : FontWeight.w300,
                            ),
                          ),
                        ),
                      ),
                      Opacity(
                        opacity: max(min(opacityChild.value - 1, 1), 0),
                        child: TextButton(
                          onPressed: () {
                            Navigator.popAndPushNamed(context, "projects");
                          },
                          child: Text(
                            " - Projects",
                            style: theme.textTheme.subtitle1?.copyWith(
                              fontWeight: index == 1
                                  ? FontWeight.bold
                                  : FontWeight.w300,
                            ),
                          ),
                        ),
                      ),
                      Opacity(
                        opacity: max(min(opacityChild.value - 2, 1), 0),
                        child: TextButton(
                          onPressed: () {
                            Navigator.popAndPushNamed(context, "about");
                          },
                          child: Text(
                            " - About",
                            style: theme.textTheme.subtitle1?.copyWith(
                              fontWeight: index == 2
                                  ? FontWeight.bold
                                  : FontWeight.w100,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Socials(),
              ],
            ),
          );
        },
      ),
    );
  }
}
