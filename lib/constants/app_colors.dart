import 'package:flutter/material.dart';

class AppColors {
  static const Color background = Color(0xFFF8F4EC);
  static const Color headerBlue = Color(0xFF87CEEB);
  static const Color headerBlue2 = Color(0xFF6DB7E8);
  static const Color textDark = Color(0xFF374151);
  static const Color textMuted = Color(0xFF6B7280);
}

extension ColorOpacity on Color {
  Color withAlphaValue(double opacity) {
    return withAlpha((opacity * 255).round());
  }
}