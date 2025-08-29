class NumberFormatterUtil {
  static String formatNumberShort(int number) {
    if (number >= 1000000000) {
      return '${(number / 1000000000).toStringAsFixed(number % 1000000000 == 0 ? 0 : 1)}B';
    } else if (number >= 1000000) {
      return '${(number / 1000000).toStringAsFixed(number % 1000000 == 0 ? 0 : 1)}M';
    } else if (number >= 10000) { // Change condition to exclude numbers below 10000
      return '${(number / 1000).toStringAsFixed(number % 1000 == 0 ? 0 : 1)}K';
    } else {
      return number.toString();
    }
  }
}