import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:nadros/core/utils/colors.dart';
import 'package:nadros/core/utils/consts.dart';
import 'package:nadros/core/utils/texts.dart';
import 'package:nadros/core/widgets/pick_image_bottom_sheet.dart';
import 'package:path/path.dart';
import 'package:intl/intl.dart';

class AppFunctions {
  static void print(object) {
    if (!kReleaseMode) {
      debugPrint(object.toString());
    }
  }

  static Future<XFile?> compressImage(File imageFile) async {
    String fileName = basename(imageFile.path);
    String dirPath = dirname(imageFile.path);
    String targetPath = '$dirPath/${fileName}_compressed.jpg';

    final compressedImage = await FlutterImageCompress.compressAndGetFile(
      imageFile.path,
      targetPath,
      quality: 85,
    );
    return compressedImage;
  }

  static customToast({required String message, bool isError = true}) {
    Get.snackbar(
      isError ? 'Error' : 'Success',
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: isError ? TColors.redColor : TColors.blue,
      colorText: TColors.white,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      duration: const Duration(seconds: 2),
      borderRadius: 8,
      snackStyle: SnackStyle.FLOATING,
    );
  }

  static String? requiredValidator(String? val) {
    if (val == null || val.isEmpty) {
      return EnglishTexts.requiredField.tr;
    } else {
      return null;
    }
  }

  static String? minimumValidator(String? val, {required int minimum}) {
    if ((val ?? '').length < minimum) {
      return '${EnglishTexts.minLengthError.tr} $minimum';
    } else {
      return null;
    }
  }

  static String? exactlyValidator(String? val, int length) {
    if ((val ?? '').length != length) {
      return '${EnglishTexts.exactLengthError.tr} $length';
    } else {
      return null;
    }
  }

  static String? emailValidator(String? val) {
    if (val == null || val.isEmpty) {
      return EnglishTexts.requiredField.tr;
    } else if (!GetUtils.isEmail(val)) {
      return EnglishTexts.invalidEmail.tr;
    } else {
      return null;
    }
  }

  static Future<XFile?> showPickImageBottomSheet(BuildContext context) async {
    return await showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return const PickImageBottomSheet();
      },
    );
  }

  static bool isLTR(String text) {
    final englishRegex = RegExp(r'[a-zA-Z]');
    final arabicRegex = RegExp(r'[\u0600-\u06FF]');
    final englishCount = text.splitMapJoin(englishRegex,
        onMatch: (m) => m.group(0) ?? '', onNonMatch: (n) => '');
    final arabicCount = text.splitMapJoin(arabicRegex,
        onMatch: (m) => m.group(0) ?? '', onNonMatch: (n) => '');
    return englishCount.length >= arabicCount.length;
  }

  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static String handlePhoneFormats(String phone) {
    // return phone;
    if (phone.startsWith('00963')) {
      return handlePhoneFormats(phone.substring(5));
    } else if (phone.startsWith('+963')) {
      return handlePhoneFormats(phone.substring(4));
    } else if (phone.startsWith('963') && phone.length > 9) {
      return handlePhoneFormats(phone.substring(3));
    } else if (phone.startsWith('0')) {
      return handlePhoneFormats(phone.substring(1));
    }
    return TConsts.apiCountryCode + phone;
  }

  static String formatPhoneNumberUI(String phone) {
    String countryCode = phone.substring(0, 4);
    String phoneNumber = phone.substring(4, phone.length);
    return '($countryCode) $phoneNumber';
  }

  static bool isKeyboardVisible() {
    final viewInsets = View.of(Get.context!).viewInsets;
    return viewInsets.bottom > 0;
  }

  static double getKeyboardHeight() {
    final viewInsets = MediaQuery.of(Get.context!).viewInsets;
    return viewInsets.bottom;
  }

  static String timeAgo(String timestamp) {
    DateTime dateTime = DateTime.parse(timestamp).toUtc();
    Duration difference = DateTime.now().toUtc().difference(dateTime).abs();

    if (difference.inMinutes < 1) {
      return EnglishTexts.now.tr;
    } else if (difference.inMinutes == 1) {
      return EnglishTexts.minuteAgo.tr;
    } else if (difference.inMinutes < 60) {
      return "${difference.inMinutes} ${EnglishTexts.minutesAgo.tr}";
    } else if (difference.inHours < 24) {
      return "${difference.inHours} ${EnglishTexts.hoursAgo.tr}";
    } else if (difference.inDays < 7) {
      return "${difference.inDays} ${EnglishTexts.daysAgo.tr}";
    } else {
      return DateFormat('yyyy-MM-dd').format(dateTime);
    }
  }

  static String? validateEmptyText(String? fieldName, String? value) {
    if (value == null || value.isEmpty) {
      return '${EnglishTexts.fieldRequired.tr} $fieldName';
    }
    return null;
  }

  static bool isVersionLower(String currentVersion, String newVersion) {
    int? current = int.tryParse(currentVersion);
    int? newV = int.tryParse(newVersion);
    return current! < newV!;
  }

  static Future<bool> hasInternetConnection() async {
    try {
      final result = await InternetAddress.lookup("example.com");
      print(result[0].rawAddress.isNotEmpty);
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }

  static void copyUrl({required String url}) {
    
    Clipboard.setData(ClipboardData(text: url));
    customToast(message: 'The product url copped successfully', isError: false);
  }
}
