import 'package:intl/intl.dart';

class AppFunctions {
  static String formattingPrice(int? price) {
    return NumberFormat.decimalPattern('ru').format(price);
  }

  static String imageUrl(String url) {
    return 'https://mycaff.uz/images/$url';
  }
}
