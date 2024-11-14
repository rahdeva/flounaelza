import 'package:intl/intl.dart';

extension DateTimeFormatter on DateTime {
  /// Convert to Formatted Date (yyyy-MM-dd).
  ///
  /// Example Output: "2024-10-25"
  String toFormattedDate() {
    return DateFormat('yyyy-MM-dd').format(this);
  }

  /// Convert to Formatted Time (HH:mm:ss).
  ///
  /// Example Output: "15:30"
  String toFormattedTime() {
    return DateFormat('HH:mm').format(this);
  }

  /// Convert to Formatted Time (HH:mm:ss).
  ///
  /// Example Output: "15:30:45"
  String toFormattedTimeWithSecond() {
    return DateFormat('HH:mm:ss').format(this);
  }

  /// Convert to Formatted DateTime (yyyy-MM-dd HH:mm:ss).
  ///
  /// Example Output: "2024-10-25 15:30"
  String toFormattedDateTime() {
    return DateFormat('yyyy-MM-dd HH:mm').format(this);
  }

  /// Convert to Formatted Date with Month Name (dd MMMM yyyy).
  ///
  /// Example Output: "25 Oktober 2024"
  String toFormattedDateWithMonthName() {
    return DateFormat('dd MMMM yyyy').format(this);
  }

  /// Convert to Formatted Time in 12-hour format (hh:mm a).
  ///
  /// Example Output: "03:30 PM"
  String toFormattedTime12Hour() {
    return DateFormat('hh:mm a').format(this);
  }

  /// Convert to Formatted Date with Day of the Week (EEEE, dd MMMM yyyy).
  ///
  /// Example Output: "Kamis, 25 Oktober 2024"
  String toFormattedDateWithDay() {
    return DateFormat('EEEE, dd MMMM yyyy').format(this);
  }

  /// Convert to Short Date Format (MM/dd/yyyy).
  ///
  /// Example Output: "10/25/2024"
  String toShortDateFormat() {
    return DateFormat('MM/dd/yyyy').format(this);
  }

  /// Convert to Custom Format based on provided string.
  ///
  /// Example Usage: toCustomFormat("yyyy-MM-dd HH:mm:ss")
  String toCustomFormat(String format) {
    return DateFormat(format).format(this);
  }
}
