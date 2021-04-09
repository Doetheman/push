/// -----------------------------------------------------------------
///
/// File: bottom_navbar.dart
/// Project: PUSH
/// File Created: Monday, April 5th, 2021
/// Description:
///
/// Author: Dorian - dorian@longsoftware.io
/// -----
/// Last Modified: Friday, April 9th, 2021
/// Modified By: Dorian Holmes - dorian@longsoftware.io
/// Last Modified: Friday, April 9th, 2021
/// Modified By: Dorian Holmes - dorian@longsoftware.io
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH
///
/// -----------------------------------------------------------------
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:push_app/app/theme/app_theme.dart';
import 'package:push_app/assets/icons/svgs.dart';

class AppNavController extends GetxController {
  RxInt currentIndex;

  AppNavController({int initialIndex}) {
    currentIndex = (initialIndex ?? 0).obs;
  }

  @override
  void onInit() {
    super.onInit();
  }

  void updateIndex(int index) {
    currentIndex.value = index;
  }
}

class NavBarItem extends StatelessWidget {
  final AppNavController controller = Get.find();
  final int index;
  final String svgPath;

  NavBarItem({
    Key key,
    this.index,
    this.svgPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Expanded(
        child: SizedBox(
          height: 50,
          child: InkWell(
            focusColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () {
              controller.updateIndex(index);
            },
            child: Center(
              child: Obx(
                () => IconButton(
                  icon: SvgPicture.asset(svgPath,
                    color: controller.currentIndex.value == index
                      ? AppTheme.offBlack
                      : AppTheme.mediumGrey,
                    ),
                onPressed: () {
                  controller.updateIndex(index);
                }
              ),),
            ),
          ),
        ),
      );
}

class BottomNavBar extends StatelessWidget {
  final AppNavController controller = Get.put(AppNavController());

  final List<String> tabSvgs = <String>[
    HOME_ICON,
    SEARCH_ICON,
    ACCOUNT_ICON,
  ];

  @override
  Widget build(BuildContext context) => BottomAppBar(
        elevation: 0,
        child: Container(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List<Widget>.generate(
              tabSvgs.length,
              (int index) => NavBarItem(
                svgPath: tabSvgs[index],
                index: index,
              ),
            ),
          ),
        ),
      );
}
