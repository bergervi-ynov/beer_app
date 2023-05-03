import "package:beer_app/data/client/dio_client.dart";
import "package:beer_app/infrastructure/services/service.connectivity.dart";
import "package:beer_app/presentation/screens/screen.settings.dart";
import "package:beer_app/presentation/viewmodel/viewmodel.connectivity.dart";
import "package:beer_app/presentation/viewmodel/viewmodel.grid.dart";
import "package:beer_app/presentation/viewmodel/viewmodel.theme.dart";
import "package:beer_app/presentation/widgets/widget.masonry_layout.dart";
import "package:flashy_tab_bar2/flashy_tab_bar2.dart";
import "package:flex_color_scheme/flex_color_scheme.dart";
import "package:flutter/material.dart";
import "package:get_it/get_it.dart";
import "package:provider/provider.dart";


import "data/endpoints/beers_endpoint.dart";
import "infrastructure/services/service.theme.dart";

final getIt = GetIt.instance;
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  getIt.registerSingleton<ThemeService>(
      ThemeService(currentTheme: ValueNotifier(ThemeMode.system)));
  getIt.registerSingleton<ConnectivityService>(ConnectivityService());
  getIt.registerFactory(() => DioClient.inject());
  getIt.registerFactory(() => BeersEndpoint(getIt<DioClient>()));
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
          theme: FlexThemeData.light(scheme: FlexScheme.damask),
          darkTheme: FlexThemeData.dark(scheme: FlexScheme.damask),
          themeMode: theme,
          home: const ServiceInjectionWidget(),
        );
      },
    );
  }
}

class ServiceInjectionWidget extends StatefulWidget {
  const ServiceInjectionWidget({
    super.key,
  });

  @override
  State<ServiceInjectionWidget> createState() => _ServiceInjectionWidgetState();
}

class _ServiceInjectionWidgetState extends State<ServiceInjectionWidget> {
  int currentScreenIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeViewModel(getIt<ThemeService>()),
        ),
        ChangeNotifierProvider(
          create: (context) => ConnectivityViewModel(getIt<ConnectivityService>()),
        ),
        ChangeNotifierProvider(
            create: (context) => GridViewModel(getIt<BeersEndpoint>())
        ),
      ],
      child: const SwitchThemeMode(),
    );
  }
}

class SwitchThemeMode extends StatefulWidget {
  const SwitchThemeMode({
    super.key,
  });

  @override
  State<SwitchThemeMode> createState() => _SwitchThemeModeState();
}

class _SwitchThemeModeState extends State<SwitchThemeMode> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    Provider.of<ConnectivityViewModel>(context, listen: false).dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _selectedIndex == 1 ?
      const SettingsScreen()
      : const BeerMasonryLayout(),

      bottomNavigationBar: FlashyTabBar(
        selectedIndex: _selectedIndex,
        iconSize: 35,
        backgroundColor: Theme.of(context).colorScheme.primary,
        onItemSelected: (index) => setState(() {
          _selectedIndex = index;
        }),
        items: [
          FlashyTabBarItem(
            icon: Image.asset("assets/beerIcon.png", width: 30, color: Colors.white , ),
            title: const Text("Beers"),
            inactiveColor: Colors.white,
            activeColor: Colors.white,
          ),
          FlashyTabBarItem(
            icon:  const Icon( color: Colors.white, Icons.settings),
            title: const Text("Settings"),
            inactiveColor: Colors.white,
            activeColor: Colors.white
          ),
        ],

      ),
    );
  }
}


