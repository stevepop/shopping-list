import 'package:flutter/material.dart';

class Styles {
  static const _textSizeLarge = 30.0;
  static const _textSizeDefault = 16.0;
  static Color _primaryColorStrong = _hexToColor('A40909');
  static final Color _textColorDefault = _hexToColor('666666');
  static final String _fontNameDefault = 'Montserrat';

  static final headerLarge = TextStyle(
    fontFamily: _fontNameDefault,
    fontSize: _textSizeLarge,
    color: _primaryColorStrong,
  );

  static final textDefault = TextStyle(
    fontFamily: _fontNameDefault,
    fontSize: _textSizeDefault,
    color: _textColorDefault,
  );

  static Color _hexToColor(String code) {
    return Color(int.parse(code.substring(0, 6), radix: 16) + 0xFF000000);
  }
}
