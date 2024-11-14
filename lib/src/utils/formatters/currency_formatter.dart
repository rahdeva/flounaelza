import 'package:intl/intl.dart';

extension CurrencyFormatter on num {
  /// Format this number to IDR currency.
  ///
  /// Example Output: "Rp 1.000.000"
  String toIDR() {
    return NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    ).format(this);
  }

  /// Format this number to a string with thousand separators.
  ///
  /// Example Output: "1.000.000"
  String toThousand() {
    return NumberFormat('#,##0', 'id_ID').format(this);
  }

  /// Format this number to a string with decimal places.
  ///
  /// Example Output: "1.000.000,50"
  String toCurrencyWithDecimal({int decimalDigits = 2}) {
    return NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: decimalDigits,
    ).format(this);
  }

  /// Convert this number to an integer.
  int toInt() {
    if (this is int) {
      return this as int;
    } else if (this == 0) {
      return 0;
    }

    // Convert num to string and replace all symbols to empty string
    String result = toString().replaceAll(RegExp(r'[^0-9]'), '');

    // Convert string to int
    return int.tryParse(result) ?? 0;
  }

  /// Convert this number to a formatted string based on the provided currency symbol and locale.
  ///
  /// Example Output: "$1,000.00" for USD.
  String toCustomFormattedCurrency({
    required String symbol, 
    String locale = 'en_US', 
    int decimalDigits = 2
  }) {
    return NumberFormat.currency(
      locale: locale,
      symbol: symbol,
      decimalDigits: decimalDigits,
    ).format(this);
  }
}

extension StringCurrencyFormatter on String {
  /// Convert this string to an integer after removing non-numeric characters.
  int toInt() {
    if (isEmpty) {
      return 0;
    } else if (this == '0') {
      return 0;
    }

    // Replace all symbols with empty string
    String result = replaceAll(RegExp(r'[^0-9]'), '');

    // Convert string to int
    return int.tryParse(result) ?? 0;
  }
}
