import 'package:digital14/shared/theme/lib_color_schemes.g.dart';
import 'package:digital14/shared/theme/theme_provider.dart';
import 'package:flutter/material.dart';

class BrightnessToggle extends StatelessWidget {
  const BrightnessToggle({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return IconButton(
      icon: Theme.of(context).brightness == Brightness.light
          ? const Icon(Icons.brightness_3)
          : const Icon(Icons.brightness_7),
      onPressed: () {
        final newSettings = ThemeSettings(
          darkColorScheme: darkColorScheme,
          lightColorScheme: lightColorScheme,
          themeMode: isDark ? ThemeMode.light : ThemeMode.dark,
        );
        ThemeSettingChange(settings: newSettings).dispatch(context);
      },
    );
  }
}
