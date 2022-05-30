import 'package:digital14/digital14.dart';
import 'package:digital14/shared/router.dart';
import 'package:digital14/shared/theme/lib_color_schemes.g.dart';
import 'package:digital14/shared/theme/theme_provider.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'firebase_options.dart';

SharedPreferences? prefs;

Future<SharedPreferences> getPrefs() async {
  return await SharedPreferences.getInstance();
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await getPrefs();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const ProviderScope(child: MyApp()));
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
