import 'dart:ui';

/// Supported locale enums for project
enum Locales {
  /// Turkish locale
  tr(Locale('tr_TR')),

  /// English locale
  en(Locale('en_EN'));

  /// Locale value
  final Locale locale;

  const Locales(this.locale);
}
