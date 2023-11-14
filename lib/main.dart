import 'package:flutter/material.dart';
import 'package:lifttracker/product/init/theme/dark_theme.dart';
import 'package:lifttracker/product/navigation/app_router.dart';

void main() {
  runApp(const _MyApp());
}

/// MainApp Widget
final class _MyApp extends StatelessWidget {
  /// mainApp constructer
  const _MyApp();

  static final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Lift Tracker',
      theme: CustomDarkTheme.theme,
      debugShowCheckedModeBanner: false,
      routerConfig: _appRouter.config(),
    );
  }
}
