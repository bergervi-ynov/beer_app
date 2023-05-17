import "package:beer_app/data/client/dio_client.dart";
import "package:beer_app/infrastructure/services/service.connectivity.dart";
import "package:beer_app/infrastructure/services/service.storage.dart";
import "package:beer_app/presentation/screens/screen.beer.dart";
import "package:beer_app/presentation/screens/screen.settings.dart";
import "package:beer_app/presentation/viewmodel/viewmodel.grid.dart";
import "package:beer_app/presentation/viewmodel/viewmodel.theme.dart";
import "package:flashy_tab_bar2/flashy_tab_bar2.dart";
import "package:flex_color_scheme/flex_color_scheme.dart";
import "package:flutter/material.dart";
import "package:get_it/get_it.dart";
import "package:provider/provider.dart";

import "data/endpoints/beers_endpoint.dart";
import "infrastructure/services/service.theme.dart";

final getIt = GetIt.instance;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  getIt.registerSingleton<ThemeService>(
      ThemeService(currentTheme: ValueNotifier(ThemeMode.system)));
  getIt.registerSingletonAsync(() => StorageService.inject());
  getIt.registerSingletonAsync(() => ConnectivityService.inject());
  getIt.registerFactory(() => DioClient.inject());
  getIt.registerFactory(() => BeersEndpoint(getIt<DioClient>()));
  await getIt.allReady();
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
          //Down debug mode
          debugShowCheckedModeBanner: false,
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
            create: (context) =>
                GridViewModel(getIt<BeersEndpoint>(), getIt<StorageService>())),
      ],
      child: const PageSwitchWidget(),
    );
  }
}

class PageSwitchWidget extends StatefulWidget {
  const PageSwitchWidget({
    super.key,
  });

  @override
  State<PageSwitchWidget> createState() => _PageSwitchWidgetState();
}

class _PageSwitchWidgetState extends State<PageSwitchWidget> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _selectedIndex == 1 ? const SettingsScreen() : const BeerScreen(),
      bottomNavigationBar: FlashyTabBar(
        selectedIndex: _selectedIndex,
        shadows: const [
          BoxShadow(
            blurRadius: 10,
          ),],
        iconSize: 35,
        backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
        onItemSelected: (index) => setState(() {
          _selectedIndex = index;
        }),
        items: [
          FlashyTabBarItem(
            icon: Image.asset(
              "assets/beerIcon.png",
              width: 30,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            title: const Text("Beers"),
            inactiveColor: Theme.of(context).colorScheme.onSurface,
            activeColor: Theme.of(context).colorScheme.onSurface,
          ),
          FlashyTabBarItem(
              icon:  Icon(color: Theme.of(context).colorScheme.onSurface, Icons.settings),
              title: const Text("Settings"),
              inactiveColor: Theme.of(context).colorScheme.onSurface,
              activeColor: Theme.of(context).colorScheme.onSurface),
        ],
      ),
    );
  }
}
