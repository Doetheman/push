/// -----------------------------------------------------------------
///
/// File: add_action_button.dart
/// Project: PUSH
/// File Created: Thursday, April 1st, 2021
/// Description:
///
/// Author: Courtney Johnson - courtney@longsoftware.io
/// -----
/// Last Modified: Monday, April 26th, 2021
/// Modified By: Courtney Johnson - courtney@longsoftware.io
/// -----
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH LLC
///
/// -----------------------------------------------------------------
import 'package:flutter/material.dart';
import 'package:push_app/app/theme/app_theme.dart';

class ActionButton extends StatelessWidget {
  final Color color;
  final Color disabledColor;
  final Color textColor;
  final Color disabledTextColor;
  final String text;
  final Function onPressed;
  final bool isDisabled;

  // if not disabled then use color or default to offBlack
  // if disabled then use disabledColor or default to lightGrey
  Color get backgroundColor => !isDisabled
      ? (color ?? AppTheme.offBlack)
      : (disabledColor ?? AppTheme.lightGrey);

  // if not disabled then use color or default to white
  // if disabled then use disabledColor or default to lightGrey
  Color get foregroundColor => !isDisabled
      ? (textColor ?? Colors.white)
      : (disabledTextColor ?? AppTheme.darkGrey);

  const ActionButton({
    this.color,
    this.disabledColor,
    this.text,
    this.onPressed,
    this.isDisabled = false,
    this.textColor,
    this.disabledTextColor,
  });

  @override
  Widget build(BuildContext context) => Container(
        height: 55,
        child: SizedBox.expand(
          child: ElevatedButton(
            onPressed: isDisabled ? () {} : onPressed ?? () {},
            style: ElevatedButton.styleFrom(
              primary: backgroundColor,
              onPrimary: foregroundColor,
            ),
            child: Text(text.toUpperCase() ?? ''),
          ),
        ),
      );
}
