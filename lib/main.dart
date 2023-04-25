import "package:beer_app/presentation/viewmodel/viewmodel.theme.dart";
import "package:flutter/material.dart";
import "package:get_it/get_it.dart";
import "package:provider/provider.dart";

import "infrastructure/services/theme.service.dart";

final getIt = GetIt.instance;
void main() {
  getIt.registerSingleton<ThemeService>(
      ThemeService(currentTheme: ValueNotifier(ThemeMode.system)));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: getIt<ThemeService>().currentTheme,
      builder: (_, ThemeMode theme, __) {
        return MaterialApp(
          title: "Beer App",
          theme: ThemeData(
            // This is the theme of your application.
            //
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or simply save your changes to "hot reload" in a Flutter IDE).
            // Notice that the counter didn't reset back to zero; the application
            // is not restarted.
            primarySwatch: Colors.blue,
          ),
          darkTheme: ThemeData(primaryColor: Colors.red),
          themeMode: theme,
          home: const BottomNavBar(),
        );
      },
    );
  }
}

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentScreenIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeViewModel(getIt<ThemeService>()),
        ),
      ],
      child: const SwitchThemeMode(),
    );
  }
}

class SwitchThemeMode extends StatelessWidget {
  const SwitchThemeMode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () {
          Provider.of<ThemeViewModel>(context).changeTheme(context);
        },
        child: Container(
          color: Theme.of(context).primaryColor,
          child: const Text("Change color"),
        ),
      ),
    );
  }
}
