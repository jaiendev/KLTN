import 'package:flutter/material.dart';

class ValidatorUtils {
  /// Checks if string is email.
  static bool isEmail(String s) => hasMatch(s,
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

  /// Checks if string is phone number.
  static bool isPhoneNumber(String s) {
    if (s.length > 16 || s.length < 9) return false;
    return hasMatch(s, r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$');
  }

  /// Checks if string is DateTime (UTC or Iso8601).
  static bool isDateTime(String s) =>
      hasMatch(s, r'^\d{4}-\d{2}-\d{2}[ T]\d{2}:\d{2}:\d{2}.\d{3}Z?$');

  static bool hasMatch(String? value, String pattern) {
    return (value == null) ? false : RegExp(pattern).hasMatch(value);
  }

  static String? checkStartEndTime(String? value) {
    if (value == null) {
      return null;
    }
    List<String> values = value.split(' - ');
    TimeOfDay startTime = TimeOfDay(
      hour: int.parse(values[0].split(':')[0]),
      minute: int.parse(
        values[0].split(':')[1],
      ),
    );
    TimeOfDay endTime = TimeOfDay(
      hour: int.parse(values[1].split(':')[0]),
      minute: int.parse(
        values[1].split(':')[1],
      ),
    );

    if (startTime.hour == endTime.hour && startTime.minute == endTime.minute) {
      return 'Không hợp lệ';
    } else if (endTime.hour == 0 && endTime.minute == 0) {
      return null;
    } else if ((endTime.hour == startTime.hour &&
            endTime.minute < startTime.minute) ||
        (endTime.hour < startTime.hour)) {
      return 'Không hợp lệ';
    }
    return null;
  }

  ///Check if the id is valid id card number<Visa/Mastercard> flow by Luhn algorithm
  ///[value] is the id card number.
  ///The method returns true if the id card number is valid and false if invalid.

  static bool isValidCardNumber(String value) {
    String clean = value.replaceAll(new RegExp(r'\s'), '');
    if (clean.length <= 1 || clean.contains(new RegExp(r'\D'))) {
      return false;
    }
    int sum = 0;
    clean
        .split('')
        .reversed
        .map(int.parse)
        .toList()
        .asMap()
        .forEach((index, number) {
      int b = index.isOdd ? number * 2 : number;
      sum += b > 9 ? b - 9 : b;
    });
    return sum % 10 == 0;
  }
}
