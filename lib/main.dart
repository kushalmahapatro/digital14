import 'package:digital14/digital14.dart';
import 'package:digital14/features/event_details/event_details.dart';
import 'package:digital14/shared/router.dart';
import 'package:digital14/shared/theme/lib_color_schemes.g.dart';
import 'package:digital14/shared/theme/theme_provider.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/search_listing/search_listing.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await getPrefs();

  runApp(const ProviderScope(child: MyApp()));
}

Future<SharedPreferences> getPrefs() async {
  return await SharedPreferences.getInstance();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final settings = ValueNotifier(ThemeSettings(
      darkColorScheme: darkColorScheme,
      lightColorScheme: lightColorScheme,
      themeMode: ThemeMode.light,
    ));

    return DynamicColorBuilder(
      builder: (lightDynamic, darkDynamic) => ThemeProvider(
          lightDynamic: settings.value.lightColorScheme,
          darkDynamic: settings.value.darkColorScheme,
          settings: settings,
          child: NotificationListener<ThemeSettingChange>(
            onNotification: (notification) {
              settings.value = notification.settings;
              return true;
            },
            child: ValueListenableBuilder<ThemeSettings>(
              valueListenable: settings,
              builder: (context, value, _) {
                final theme = ThemeProvider.of(context);
                return MaterialApp.router(
                  debugShowCheckedModeBanner: false,
                  theme: theme.light(),
                  darkTheme: theme.dark(),
                  themeMode: theme.themeMode(),
                  routeInformationParser: appRouter.routeInformationParser,
                  routerDelegate: appRouter.routerDelegate,
                );
              },
            ),
          )),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.isMobile) {
        return const SafeArea(
            child: SearchListingView(navigateToDetails: true));
      } else if (constraints.isTablet) {
        return SafeArea(
          child: Row(
            children: const <Widget>[
              Flexible(
                flex: 4,
                child: SearchListingView(),
              ),
              Flexible(flex: 6, child: EventDetailsView()),
            ],
          ),
        );
      } else {
        return SafeArea(
          child: Row(
            children: const <Widget>[
              Flexible(
                flex: 3,
                child: SearchListingView(),
              ),
              Flexible(flex: 7, child: EventDetailsView()),
            ],
          ),
        );
      }
    });
  }
}
