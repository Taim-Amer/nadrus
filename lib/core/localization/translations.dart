import 'package:get/get.dart';
import 'package:nadros/core/localization/ar_map.dart';
import 'package:nadros/core/localization/en_map.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': en,
        'ar': ar,
      };
}
