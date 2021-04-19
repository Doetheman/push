/// -----------------------------------------------------------------
///
/// File: svg_button.dart
/// Project: PUSH
/// File Created: Sunday, April 18th, 2021
/// Description:
///
/// Author: Brandon Long - brandon@longsoftware.io
/// -----
/// Last Modified: Sunday, April 18th, 2021
/// Modified By: Brandon Long - brandon@longsoftware.io
/// -----
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH LLC
///
/// -----------------------------------------------------------------

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgButton extends StatelessWidget {
  final String svg;
  final Color color;
  final VoidCallback onPressed;

  const SvgButton({Key key, this.svg, this.onPressed, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onPressed,
        child: SvgPicture.asset(
          svg,
          color: color,
        ),
      );
}
