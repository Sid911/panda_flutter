import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:panda_flutter/utility/custom_colors.dart';
import 'package:panda_flutter/utility/settings_utility.dart';
import 'package:panda_flutter/widgets/pages/about/about.dart';
import 'package:panda_flutter/widgets/pages/drawer/drawer.dart';
import 'package:panda_flutter/widgets/pages/home/instructions.dart';
import 'package:panda_flutter/widgets/pages/home/intro_widget.dart';
import 'package:panda_flutter/widgets/pages/home/shadow_card.dart';
import 'package:panda_flutter/widgets/pages/projects/projects.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  final box = await Hive.openBox('settings');
  final _p = box.get("darkMode", defaultValue: false);
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: _p ? Colors.black : Colors.white,
      systemNavigationBarIconBrightness:
          _p ? Brightness.light : Brightness.dark,
    ),
  );

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    final darkSwatch = createMaterialColor(const Color(0xFF303A3A));
    final lightSwatch = createMaterialColor(const Color(0xFFC4E3E5));
    final switchTheme = SwitchThemeData(
      thumbColor: MaterialStateProperty.all(
        const Color(0xFFC4E3E5),
      ),
      trackColor: MaterialStateProperty.all(const Color(0xFF7BA0A8)),
    );
    return ValueListenableBuilder<Box>(
        valueListenable: Hive.box("settings").listenable(
          keys: ["darkMode", "showAppBar"],
        ),
        builder: (context, box, _) {
          final isDarkMode = box.get("darkMode", defaultValue: false);
          return MaterialApp(
            title: "Sid's App",
            scrollBehavior: const CupertinoScrollBehavior(),
            themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
            debugShowCheckedModeBanner: false,
            routes: {
              "home": (context) {
                return MyHomePage(settingsBox: box);
              },
              "projects": (context) => Projects(settingsBox: box),
              "about": (context) => AboutPage(settingsBox: box),
            },
            initialRoute: "home",
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              scaffoldBackgroundColor: const Color(0xFF1C1E1E),
              primarySwatch: darkSwatch,
              switchTheme: switchTheme,
              textSelectionTheme: const TextSelectionThemeData(
                  selectionColor: Colors.lightBlueAccent),
              textTheme: const TextTheme(
                headline2: TextStyle(
                  color: Color(0xFFD9FDFF),
                  fontFamily: "Lato",
                  fontWeight: FontWeight.bold,
                  fontSize: 48,
                ),
                headline4: TextStyle(
                  color: Color(0xFFD9FDFF),
                  fontFamily: "Lato",
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                bodyText1: TextStyle(
                    color: Color(0xFFD9FDFF), fontFamily: "Lato", fontSize: 28),
                subtitle1: TextStyle(
                    color: Color(0xFFD9FDFF), fontFamily: "Lato", fontSize: 20),
                bodyText2: TextStyle(
                    color: Color(0xFFD9FDFF), fontFamily: "Lato", fontSize: 12),
                subtitle2: TextStyle(
                    color: Color(0xFFD9FDFF), fontFamily: "Lato", fontSize: 11),
              ),
            ),
            theme: ThemeData(
              brightness: Brightness.light,
              scaffoldBackgroundColor: const Color(0xFFF2FEFF),
              switchTheme: switchTheme,
              // Text theme for light mode
              textTheme: const TextTheme(
                headline2: TextStyle(
                    color: Color(0xFF2A2F3D),
                    fontFamily: "Lato",
                    fontWeight: FontWeight.bold,
                    fontSize: 48),
                headline4: TextStyle(
                    color: Color(0xFF2A2F3D),
                    fontFamily: "Lato",
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
                bodyText1: TextStyle(
                    color: Color(0xFF2A2F3D), fontFamily: "Lato", fontSize: 28),
                subtitle1: TextStyle(
                    color: Color(0xFF2A2F3D), fontFamily: "Lato", fontSize: 20),
                bodyText2: TextStyle(
                    color: Color(0xFF2A2F3D), fontFamily: "Lato", fontSize: 12),
                subtitle2: TextStyle(
                    color: Color(0xFF2A2F3D), fontFamily: "Lato", fontSize: 11),
              ),
              primarySwatch: lightSwatch,
            ),
          );
        });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.settingsBox}) : super(key: key);
  final Box settingsBox;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  late AnimationController _animationController;
  final SettingsManager settings = SettingsManager();
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _scrollController.addListener(listenScroll);
  }

  void listenScroll() {
    final offset = _scrollController.offset;
    try {
      if (offset > 200) {
        if (!_animationController.isAnimating) {
          _animationController.forward().orCancel;
        }
      } else if (_animationController.isCompleted) {
        if (!_animationController.isAnimating) {
          _animationController.reverse().orCancel;
        }
      }
    } on TickerCanceled {
      // the animation got canceled, probably because it was disposed of
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: widget.settingsBox.get("showAppBar", defaultValue: false)
          ? AppBar(
              elevation: 0,
              title: const Text("Home"),
              backgroundColor: theme.scaffoldBackgroundColor,
            )
          : null,
      drawer: const CustomDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          controller: _scrollController,
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const IntroWidget(),
              ShadowCard(controller: _animationController),
              const Instructions(),
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
