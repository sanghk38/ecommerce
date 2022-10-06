import 'package:flutter/material.dart';


enum ButtonType { primary, secondary, normal, outline }

extension ButtonTypeExtension on ButtonType {
  Color getBackgroundColor(BuildContext context) {
    switch (this) {
      case ButtonType.primary:
        return Colors.red;
      case ButtonType.secondary:
        return Colors.red;
      case ButtonType.normal:
        return Color(0xFFEBEBEB);
      case ButtonType.outline:
        return Colors.transparent;
    }
  }

  Color? getForegroundColor(BuildContext context) {
    switch (this) {
      case ButtonType.primary:
      case ButtonType.secondary:
      case ButtonType.normal:
        return null;
      case ButtonType.outline:
        return Colors.grey;
    }
  }

  Color getTextColor(BuildContext context) {
    switch (this) {
      case ButtonType.primary:
      case ButtonType.secondary:
        return Colors.white;
      case ButtonType.normal:
        return Colors.black;
      case ButtonType.outline:
        return Color(0xFF1D1D1D);
    }
  }
}
