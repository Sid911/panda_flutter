import 'package:flutter/material.dart';

class IntroWidget extends StatelessWidget {
  const IntroWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Image.asset("images/panda_sticker.png"),
          flex: 2,
        ),
        Flexible(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hi there",
                style: theme.textTheme.headline2,
              ),
              Text(
                "I don’t know why you downloaded this app.",
                style: theme.textTheme.subtitle2,
                softWrap: true,
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: Text(
                  "But hey, now that you are here!",
                  style: theme.textTheme.subtitle1,
                ),
              ),
              Text(
                "lets go on a ride.",
                style: theme.textTheme.headline4,
              ),
            ],
          ),
        )
      ],
    );
  }
}
