/// -----------------------------------------------------------------
///
/// File: stylist_basic_info_input.dart
/// Project: PUSH
/// File Created: Tuesday, April 20th, 2021
/// Description:
///
/// Author: Courtney Johnson - courtney@longsoftware.io
/// -----
/// Last Modified: Sunday, April 25th, 2021
/// Modified By: Brandon Long - brandon@longsoftware.io
/// -----
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH LLC
///
/// -----------------------------------------------------------------

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:push_app/app/constants/states.dart';
import 'package:push_app/app/controllers/stylist_onboarding_controller.dart';
import 'package:push_app/app/theme/app_theme.dart';
import 'package:push_app/app/utils/is.dart';
import 'package:push_app/app/widgets/fields/drop_down_field.dart';
import 'package:push_app/app/widgets/fields/text_input_field.dart';
import 'package:push_app/app/widgets/misc/action_button.dart';
import 'package:push_app/assets/icons/svgs.dart';
import 'package:push_app/generated/i18n.dart';
import 'package:get/get.dart';
import 'dart:html';

class StylistBasicInfoInput extends StatelessWidget {
  final StylistOnboardingController controller = Get.find();

  @override
  Widget build(BuildContext context) => Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextInputField(
              labelText: I18n.of(context).stylistBasicInfoInputFullName,
              onChanged: controller.onChangeCurrentName,
            ).paddingOnly(bottom: 20),
            TextInputField(
              labelText: I18n.of(context).stylistBasicInfoInputPrimaryLocation,
              suffixIcon: SvgPicture.asset(LOCATION_ICON),
              onChanged: controller.onChangeCurrentLocation,
            ).paddingOnly(bottom: 20),
            Text(
              I18n.of(context).stylistBasicInfoInputAreYouLicensed,
              style: AppTheme.subtitleOne,
            ).paddingOnly(bottom: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: ActionButton(
                    text: I18n.of(context).commonYes,
                    color: controller.isLicensed
                        ? AppTheme.primaryBlue
                        : AppTheme.secondaryBlue,
                    textColor: controller.isLicensed
                        ? Colors.white
                        : AppTheme.primaryBlue,
                    onPressed: () {
                      controller.onChangeLicensed(true);
                    },
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: ActionButton(
                    text: I18n.of(context).commonNo,
                    color: !controller.isLicensed
                        ? AppTheme.primaryBlue
                        : AppTheme.secondaryBlue,
                    textColor: !controller.isLicensed
                        ? Colors.white
                        : AppTheme.primaryBlue,
                    onPressed: () {
                      controller.onChangeLicensed(false);
                    },
                  ),
                ),
              ],
            ).paddingOnly(bottom: 20),
            if (controller.isLicensed)
              DropDownField<String>(
                options: STATES,
                hintText: I18n.of(context).commonState,
                onSelectOption: controller.onChangeCurrentState,
                selectedOption: Is.emptyOrNull(controller.currentLicensedState)
                    ? null
                    : controller.currentLicensedState,
              ).paddingOnly(bottom: 20),
          ],
        ),
      );
}
