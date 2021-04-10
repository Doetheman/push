/// -----------------------------------------------------------------
///
/// File: drop_down_field.dart
/// Project: PUSH
/// File Created: Friday, April 9th, 2021
/// Description:
///
/// Author: Courtney Johnson - courtney@longsoftware.io
/// -----
/// Last Modified: Friday, April 9th, 2021
/// Modified By: Brandon Long - brandon@longsoftware.io
/// -----
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH LLC
///
/// -----------------------------------------------------------------

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:push_app/app/theme/app_theme.dart';
import 'package:push_app/assets/icons/svgs.dart';

class DropDownField<T> extends StatefulWidget {
  final List<T> options;
  final Function(T) onSelectOption;
  final String hintText;
  final T selectedOption;

  DropDownField({
    this.options,
    this.onSelectOption,
    this.hintText,
    this.selectedOption,
  });

  @override
  _DropDownFieldState<T> createState() => _DropDownFieldState<T>();
}

class _DropDownFieldState<T> extends State<DropDownField<T>> {
  T selectedOption;

  @override
  void initState() {
    selectedOption = widget.selectedOption;

    super.initState();
  }

  @override
  Widget build(BuildContext context) => Container(
        padding: EdgeInsets.only(left: 15.0, right: 15.0),
        decoration: BoxDecoration(
          border: Border.all(color: AppTheme.darkGrey, width: 1),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: DropdownButton<T>(
          value: selectedOption,
          hint: Text(widget.hintText),
          dropdownColor: Colors.white,
          icon: SvgPicture.asset(ARROW_DROP_DOWN),
          iconSize: 32,
          isExpanded: true,
          underline: SizedBox(),
          style: AppTheme.bodyOne.copyWith(color: AppTheme.offBlack),
          onChanged: (T newValue) {
            setState(() {
              selectedOption = newValue;
            });
            widget.onSelectOption;
          },
          items: widget.options
              .map(
                (T valueItem) => DropdownMenuItem<T>(
                  value: valueItem,
                  child: Text(valueItem.toString()),
                ),
              )
              .toList(),
        ),
      );
}
