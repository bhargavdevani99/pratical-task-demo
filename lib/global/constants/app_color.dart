// App Colors

import 'package:flutter/material.dart';

class AppColor {
  static const black = Color(0xff000000);
  static const white = Color(0xFFFFFFFF);
  static const blue = Color(0xFF1269B0);

  static const transparent = Colors.transparent;
  static const red = Colors.red;
  static const green = Colors.green;

  /// grey color
  static const grey = Colors.grey;
  static const grey666666 = Color(0xFF666666);
  static const grey999999 = Color(0xFF999999);
  static const grey767680 = Color(0xFF767680);
  static const greyB9B9BB = Color(0xFFB9B9BB);
  static const grey76767A = Color(0xFF76767A);
  static const greyD2D2D2 = Color(0xFFD2D2D2);
  static const greyF8F8F8 = Color(0xFFF8F8F8);
  static const grey8E8E93 = Color(0xFF8E8E93);
  static const greyD6D6D6 = Color(0xFFD6D6D6);
  static const grey85858B = Color(0xFF85858B);
  static const greyBDBDBD = Color(0xFFBDBDBD);
  static const greyE5E5E5 = Color(0xFFE5E5E5);

  /// black
  static const black212121 = Color(0xFF212121);
  static const black44474E = Color(0xFF44474E);

  // Hexadecimal Color
  static Color hexGrey = fromHex('#121212');

  static const Map<int, Color> orange = <int, Color>{
    50: Color(0xFFFCF2E7),
    100: Color(0xFFF8DEC3),
    200: Color(0xFFF3C89C),
    300: Color(0xFFEEB274),
    400: Color(0xFFEAA256),
    500: Color(0xFFE69138),
    600: Color(0xFFE38932),
    700: Color(0xFFDF7E2B),
    800: Color(0xFFDB7424),
    900: Color(0xFFD56217)
  };

  static Color fromHex(
    String hexString,
  ) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) {
      buffer.write(
        'ff',
      );
    }
    buffer.write(
      hexString.replaceFirst(
        '#',
        '',
      ),
    );
    return Color(
      int.parse(
        buffer.toString(),
        radix: 16,
      ),
    );
  }

  static LinearGradient getGradient(
    Color colorStart,
    Color colorEnd,
  ) {
    return LinearGradient(
      colors: [colorStart, colorEnd],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  }
}
