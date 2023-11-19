import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lifttracker/product/init/product_initialization.dart';
import 'package:lifttracker/product/init/product_localization.dart';
import 'package:lifttracker/product/navigation/app_router.dart';
import 'package:lifttracker/product/theme/dark_theme.dart';

void main() async {
  await ProductInitialization.mainInit();
  runApp(ProductLocalization(child: const _MyApp()));
}

/// MainApp Widget
final class _MyApp extends StatelessWidget {
  /// mainApp constructor
  const _MyApp();

  static final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Lift Tracker',
      theme: CustomDarkTheme.theme,
      debugShowCheckedModeBanner: false,
      routerConfig: _appRouter.config(),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}
