import 'package:nadros/core/utils/cache_helper.dart';

class DataConsts {
  static const String serverUrl = "https://foo.new-dev.nadrus.app";
  // static const String serverUrl = "https://${CacheHelper.kTenantId}.new-dev.nadrus.app";
  static const String imagesUrl = "$serverUrl/storage/";

  static const String assignments = "/assignments";
  static const String program = "/weekly-schedule";
  static const String subjects = "/subjects";
}
