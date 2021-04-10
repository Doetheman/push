/// -----------------------------------------------------------------
///
/// File: multi_select_field.dart
/// Project: PUSH
/// File Created: Tuesday, April 6th, 2021
/// Description:
///
/// Author: Courtney Johnson - courtney@longsoftware.io
/// -----
/// Last Modified: Friday, April 9th, 2021
/// Modified By: Brandon Long - brandon@longsoftware.io
/// -----
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH
///
/// -----------------------------------------------------------------

import 'package:flutter/material.dart';
import 'package:push_app/app/theme/app_theme.dart';

class MultiSelectField<T> extends StatelessWidget {
  final String label;
  final List<T> options;
  final List<T> selectedOptions;
  final Function(List<T> selectedOptions) onSelectionsChanged;

  MultiSelectField({
    Key key,
    this.label = '',
    this.options,
    this.selectedOptions,
    this.onSelectionsChanged,
  }) : super(key: key);

  List<Widget> _buildOptions() => options
      .map(
        (T option) => Container(
          height: 35,
          child: Theme(
            data: ThemeData(
              unselectedWidgetColor: AppTheme.darkGrey,
            ),
            child: CheckboxListTile(
              value: (options.isNotEmpty ?? false) &&
                  (selectedOptions?.contains(option) ?? false),
              contentPadding: EdgeInsets.zero,
              title: Text(
                option.toString(),
                style: AppTheme.bodyOne.apply(
                  color: selectedOptions.contains(option)
                      ? AppTheme.offBlack
                      : AppTheme.darkGrey,
                ),
              ),
              controlAffinity: ListTileControlAffinity.trailing,
              activeColor: AppTheme.primaryBlue,
              onChanged: (bool value) {
                if (value) {
                  selectedOptions.add(option);
                } else {
                  selectedOptions.remove(option);
                }
                onSelectionsChanged(selectedOptions);
              },
            ),
          ),
        ),
      )
      .toList();

  @override
  Widget build(BuildContext context) => Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              label,
              style: AppTheme.subtitleOne,
            ),
            ..._buildOptions(),
          ],
        ),
      );
}
