/// -----------------------------------------------------------------
///
/// File: stylist_specialty_card.dart
/// Project: PUSH
/// File Created: Wednesday, April 14th, 2021
/// Description:
///
/// Author: Courtney Johnson - courtney@longsoftware.io
/// -----
/// Last Modified: Thursday, April 15th, 2021
/// Modified By: Brandon Long - brandon@longsoftware.io
/// -----
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH LLC
///
/// -----------------------------------------------------------------
import 'package:flutter/material.dart';
import 'package:push_app/app/data/models/enums.dart';
import 'package:push_app/app/theme/app_theme.dart';
import 'package:get/get.dart';
import 'package:push_app/app/widgets/misc/header_label.dart';
import 'package:push_app/assets/images/images.dart';
import 'package:enum_to_string/enum_to_string.dart';

class StylistSpecialtyCard extends StatelessWidget {
  final Specialties specialty;
  final bool isSelected;
  final Function(bool) onToggleSelection;

  String get backgroundImage {
    switch (specialty) {
      case Specialties.barbering:
        return BARBERING_BACKGROUND;
        break;
      case Specialties.braiding:
        return BRAIDING_BACKGROUND;
        break;
      case Specialties.esthetics:
        return ESTHETICS_BACKGROUND;
        break;
      case Specialties.hairColoring:
        return HAIR_COLORING_BACKGROUND;
        break;
      case Specialties.hairStyling:
        return HAIR_STYLING_BACKGROUND;
        break;
      case Specialties.makeup:
        return MAKEUP_BACKGROUND;
        break;
      case Specialties.nailTechnichian:
        return NAIL_TECH_BACKGROUND;
        break;
      case Specialties.piercing:
        return PIERCING_BACKGROUND;
        break;
      case Specialties.tattooing:
        return TATTOOING_BACKGROUND;
        break;
      case Specialties.waxing:
        return WAXING_BACKGROUND;
        break;
      default:
        return null;
    }
  }

  String get headerLabelText {
    switch (specialty) {
      case Specialties.barbering:
        return EnumToString.convertToString(Specialties.barbering);
        break;
      case Specialties.braiding:
        return EnumToString.convertToString(Specialties.braiding);
        break;
      case Specialties.esthetics:
        return EnumToString.convertToString(Specialties.esthetics);
        break;
      case Specialties.hairColoring:
        return EnumToString.convertToString(Specialties.hairColoring,
            camelCase: true);
        break;
      case Specialties.hairStyling:
        return EnumToString.convertToString(Specialties.hairStyling,
            camelCase: true);
        break;
      case Specialties.makeup:
        return EnumToString.convertToString(Specialties.makeup);
        break;
      case Specialties.nailTechnichian:
        return EnumToString.convertToString(Specialties.nailTechnichian,
            camelCase: true);
        break;
      case Specialties.piercing:
        return EnumToString.convertToString(Specialties.piercing);
        break;
      case Specialties.tattooing:
        return EnumToString.convertToString(Specialties.tattooing);
        break;
      case Specialties.waxing:
        return EnumToString.convertToString(Specialties.waxing);
        break;
      default:
        return null;
    }
  }

  StylistSpecialtyCard({
    this.specialty,
    this.isSelected,
    this.onToggleSelection,
  });

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => onToggleSelection(isSelected),
        child: Container(
          width: Get.width / 2,
          height: (Get.width / 2) * 0.82,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: AppTheme.offWhite,
                blurRadius: 10,
                offset: Offset(0, 0),
              ),
            ],
            image: DecorationImage(
              fit: BoxFit.cover,
              colorFilter: !isSelected
                  ? null
                  : ColorFilter.mode(
                      Colors.black.withOpacity(0.5),
                      BlendMode.srcATop,
                    ),
              image: AssetImage(backgroundImage),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              HeaderLabel(
                color: !isSelected ? AppTheme.offBlack : AppTheme.primaryRed,
                style: AppTheme.headlineFive,
                text: headerLabelText.capitalize,
              ).paddingAll(10),
            ],
          ),
        ),
      );
}
