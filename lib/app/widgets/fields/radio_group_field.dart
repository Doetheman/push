/// -----------------------------------------------------------------
///
/// File: radio_group_field.dart
/// Project: PUSH
/// File Created: Tuesday, April 6th, 2021
/// Description:
///
/// Author: Courtney Johnson - courtney@longsoftware.io
/// -----
/// Last Modified: Tuesday, April 6th, 2021
/// Modified By: Courtney Johnson - courtney@longsoftware.io
/// -----
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH
///
/// -----------------------------------------------------------------

import 'package:flutter/material.dart';
import 'package:push_app/app/theme/app_theme.dart';

class RadioOption {
  dynamic value;
  String label;

  RadioOption({
    @required this.value,
    @required this.label,
  });
}

class RadioButtonGroup extends StatelessWidget {
  final RadioOption selectedOption;
  final List<RadioOption> options;
  final Function(RadioOption selectedRadio) onSelectionChanged;

  RadioButtonGroup({
    this.selectedOption,
    this.options,
    this.onSelectionChanged,
  });

  @override
  Widget build(BuildContext context) => Theme(
        data: ThemeData(
          unselectedWidgetColor: AppTheme.darkGrey,
        ),
        child: Column(
          children: options
              .map(
                (RadioOption option) => GestureDetector(
                  onTap: () => onSelectionChanged(option),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        option.label,
                        style: AppTheme.bodyOne.apply(
                          color: selectedOption == option
                              ? AppTheme.offBlack
                              : AppTheme.darkGrey,
                        ),
                      ),
                      Radio<RadioOption>(
                        value: option,
                        groupValue: selectedOption,
                        onChanged: onSelectionChanged ?? (RadioOption _) {},
                        toggleable: true,
                        activeColor: AppTheme.primaryBlue,
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
        ),
      );
}

class RadioGroupField extends StatelessWidget {
  final String label;
  final RadioOption selectedOption;
  final List<RadioOption> options;
  final Function(RadioOption selectedRadio) onSelectionChanged;

  const RadioGroupField({
    Key key,
    this.label,
    this.selectedOption,
    this.options,
    this.onSelectionChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            label,
            style: AppTheme.subtitleOne,
          ),
          RadioButtonGroup(
            selectedOption: selectedOption,
            options: options,
            onSelectionChanged: onSelectionChanged,
          ),
        ],
      );
}
