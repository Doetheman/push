/// -----------------------------------------------------------------
///
/// File: header_label.dart
/// Project: PUSH
/// File Created: Friday, April 9th, 2021
/// Description:
///
/// Author: Dorian Holmes - dorian@longsoftware.io
/// -----
/// Last Modified: Sunday, April 11th, 2021
/// Modified By: Brandon Long - brandon@longsoftware.io
/// Last Modified: Sunday, April 11th, 2021
/// Modified By: Brandon Long - brandon@longsoftware.io
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH
///
/// -----------------------------------------------------------------

import 'package:flutter/material.dart';
import 'package:push_app/app/theme/app_theme.dart';

class HeaderLabel extends StatelessWidget {
  final Color color;
  final TextStyle style;
  final String text;
  final Widget icon;

  HeaderLabel({
    this.color,
    this.style,
    this.text,
    this.icon,
  });

  @override
  Widget build(BuildContext context) => FittedBox(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: color ?? AppTheme.primaryRed,
          ),
          padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
          alignment: Alignment(0, 0),
          child: Center(
            child: Row(
              children: <Widget>[
                icon != null
                    ? Padding(
                        padding: EdgeInsets.only(right: 11),
                        child: icon,
                      )
                    : Container(),
                Text(
                  text ?? '',
                  style: style ?? AppTheme.headlineFive,
                )
              ],
            ),
          ),
        ),
      );
}
