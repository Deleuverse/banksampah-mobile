import 'package:intl/intl.dart';

class DateFormatterUtil {
  static String formatEventDate(DateTime startDate, DateTime endDate) {
    // Check if start date and end date are the same
    if (startDate.year == endDate.year &&
        startDate.month == endDate.month &&
        startDate.day == endDate.day) {
      // If same day, format as "Feb 10, 2025, 7:00 AM - 9:00 AM"
      return '${DateFormat("MMM d, yyyy, h:mm a").format(startDate)} - ${DateFormat("h:mm a").format(endDate)}';
    } else {
      // If different days, format as "Feb 10, 2025, 7:00 AM - Feb 11, 2025, 9:00 AM"
      return '${DateFormat("MMM d, yyyy, h:mm a").format(startDate)} - ${DateFormat("MMM d, yyyy, h:mm a").format(endDate)}';
    }
  }

  // Format with full format (e.g., "Feb 18, 2025, 7:00 AM")
  static String formatFullDate(DateTime date) {
    return DateFormat("MMM d, yyyy, h:mm a").format(date);
  }

  // Format only the date (e.g., "Feb 18, 2025")
  static String formatDateOnly(DateTime date) {
    return DateFormat("MMM d, yyyy").format(date);
  }
  static String formatDateNotification(DateTime date) {
    return DateFormat("EEEE, MMMM d, yyyy").format(date);
  }

  // Format only the time (e.g., "7:00 AM")
  static String formatTimeOnly(DateTime date) {
    return DateFormat("h:mm a").format(date).toLowerCase();
  }
  static String formatDateOnlyLog(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date).inDays;

    if (difference == 0) {
      return "Today";
    } else if (difference == 1) {
      return "Yesterday";
    } else {
      return DateFormat("MMMM d").format(date);
    }
  }

  // Format to display time in 24-hour format (e.g., "19:00")
  static String format24HourTime(DateTime date) {
    return DateFormat("HH:mm").format(date);
  }

  // Format only month and year (e.g., "Feb 2025")
  static String formatMonthYear(DateTime date) {
    return DateFormat("MMM yyyy").format(date);
  }

  // Format with custom pattern
  static String formatCustom(DateTime date, String pattern) {
    return DateFormat(pattern).format(date);
  }

  static String formatDateTimeWithSeconds(DateTime date) {
    return DateFormat("yyyy-MM-dd HH:mm:ss").format(date);
  }
}
