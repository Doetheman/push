/// -----------------------------------------------------------------
///
/// File: speciality_multiselect.dart
/// Project: PUSH
/// File Created: Monday, April 19th, 2021
/// Description:
///
/// Author: Dorian Holmes - dorian@longsoftware.io
/// -----
/// Last Modified: Saturday, April 24th, 2021
/// Modified By: Dorian Holmes - dorian@longsoftware.io
/// -----
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH LLC
///
/// -----------------------------------------------------------------

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:push_app/app/data/models/enums.dart';
import 'package:push_app/generated/i18n.dart';
import 'package:push_app/app/theme/app_theme.dart';
import 'package:push_app/app/widgets/stylist_onboarding/stylist_specialty_card.dart';

class SpecialityMultiSelect extends StatelessWidget {
  final String label;
  final List<Specialties> selectedOptions;
  final Function(List<Specialties> selectedOptions) onSelectionsChanged;

  SpecialityMultiSelect({
    Key key,
    this.label = '',
    this.selectedOptions,
    this.onSelectionsChanged,
  }) : super(key: key);

  List<Widget> _buildOptions() => Specialties.values
      .map(
        (Specialties option) => Container(
          child: Theme(
            data: ThemeData(
              unselectedWidgetColor: AppTheme.darkGrey,
            ),
            child: StylistSpecialtyCard(
              isSelected: (selectedOptions?.contains(option) ?? false),
              specialty: option,
              onToggleSelection: (bool value) {
                if (value) {
                  selectedOptions.remove(option);
                } else {
                  selectedOptions.add(option);
                }
              },
            ),
          ),
        ),
      )
      .toList();

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            label,
            style: AppTheme.headlineOne,
          ).paddingOnly(bottom: 10),
          Text(
            I18n.of(context).specialtyMultiSelectSelectAll,
            textAlign: TextAlign.left,
            style: AppTheme.bodyOne.copyWith(color: AppTheme.darkGrey),
          ).paddingOnly(bottom: 23),
          GridView.count(
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: _buildOptions(),
          ),
        ],
      );
}
