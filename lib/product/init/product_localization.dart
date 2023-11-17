import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lifttracker/product/constants/enums/locales.dart';

/// Product localization manager
final class ProductLocalization extends EasyLocalization {
  /// Product localization constructor will wrap the [child] with EasyLocalization widget
  ProductLocalization({required super.child, super.key})
      : super(
          supportedLocales: appSupportedLocales,
          path: _localePath,
          fallbackLocale: const Locale('en', 'US'),
        );

  /// all the supported locales
  static final List<Locale> appSupportedLocales = [
    Locales.tr.locale,
    Locales.en.locale,
  ];

  static const String _localePath = 'assets/translations';
}
