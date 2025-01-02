import 'package:intl/intl.dart';

class TFormatter {
  // Date Formatting
  static String formatDate(DateTime? date) {
    date ??= DateTime.now();
    return DateFormat('dd-MMM-yyyy').format(date); // Format: 01-Jan-2024
  }

  // Currency Formatting
  static String formatCurrency(double amount) {
    return NumberFormat.currency(locale: 'en_US', symbol: '\$')
        .format(amount); // Format: $1,234.56
  }

  // US Phone Number Formatting
  static String formatPhoneNumber(String phoneNumber) {
    // For 10-digit number: (123) 456-7890
    if (phoneNumber.length == 10) {
      return '(${phoneNumber.substring(0, 3)}) ${phoneNumber.substring(3, 6)}-${phoneNumber.substring(6)}';
    }
    // For 11-digit number
    else if (phoneNumber.length == 11) {
      return '(${phoneNumber.substring(0, 4)}) ${phoneNumber.substring(4, 7)}-${phoneNumber.substring(7)}';
    }
    return phoneNumber;
  }

  // International Phone Number Formatting
  static String internationalFormatPhoneNumber(String phoneNumber) {
    // Remove non-digit characters
    var digitsOnly = phoneNumber.replaceAll(RegExp(r'\D'), '');

    // Get country code
    String countryCode = '+${digitsOnly.substring(0, 2)}';
    digitsOnly = digitsOnly.substring(2);

    // Format remaining digits
    final formattedNumber = StringBuffer();
    formattedNumber.write('($countryCode) ');

    int i = 0;
    while (i < digitsOnly.length) {
      int groupLength = 2;
      if (i == 0 && countryCode == '+1') {
        groupLength = 3;
      }

      int end = i + groupLength;
      formattedNumber.write(digitsOnly.substring(i, end));

      if (end < digitsOnly.length) {
        formattedNumber.write(' ');
      }
      i = end;
    }

    return formattedNumber.toString();
  }
}
