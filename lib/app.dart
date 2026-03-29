import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:word_stock_2026/core/di/auth_providers.dart';
import 'package:word_stock_2026/core/router/router.dart';
import 'package:word_stock_2026/core/theme/app_theme.dart';
import 'package:word_stock_2026/presentation/settings/settings_view_model.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    final user = ref.watch(currentUserProvider);
    final settingsAsync = user != null ? ref.watch(settingsViewModelProvider(user.id)) : null;
    final settings = settingsAsync?.value;
    final seedColor = AppTheme.colorThemes[settings?.colorTheme ?? 'indigo'] ?? AppTheme.colorThemes['indigo']!;
    final isDark = settings?.darkMode ?? false;

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'WordStock',
      theme: AppTheme.light(seedColor: seedColor),
      darkTheme: AppTheme.dark(seedColor: seedColor),
      themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
      routerConfig: router,
    );
  }
}
