import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:lifttracker/product/cache/hive_utility.dart';
import 'package:lifttracker/product/init/product_localization.dart';

@immutable

/// Product initialization manager class
final class ProductInitialization {
  const ProductInitialization._();

  /// this method will do core initializations before the app runs
  static Future<void> mainInit() async {
    await Hive.initFlutter();
    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();
    await _initAllDateFormats();
    await _openAllHiveBoxes();
  }

  /// initialize all date formats for existing locales
  static Future<void> _initAllDateFormats() async {
    for (final element in ProductLocalization.appSupportedLocales) {
      await initializeDateFormatting(element.countryCode);
    }
  }

  /// Core hive boxes opens
  static Future<void> _openAllHiveBoxes() async {
    for (final element in HiveCacheManager.coreBoxes) {
      await Hive.openBox(element);
    }
  }
}
