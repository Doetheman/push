/// -----------------------------------------------------------------
///
/// File: image_wrapper.dart
/// Project: PUSH
/// File Created: Saturday, April 24th, 2021
/// Description:
///
/// Author: Brandon Long - brandon@longsoftware.io
/// -----
/// Last Modified: Saturday, April 24th, 2021
/// Modified By: Brandon Long - brandon@longsoftware.io
/// -----
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH LLC
///
/// -----------------------------------------------------------------

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';
import '../../data/models/user_file.dart';
import '../../theme/app_theme.dart';
import '../../utils/is.dart';

class ImageWrapper extends StatelessWidget {
  final double borderRadius;
  final double height;
  final double width;
  final UserFile file;
  final Color defaultColor;
  final IconData defaultIcon;

  const ImageWrapper({
    Key key,
    this.borderRadius = 5,
    this.height = 65,
    this.width,
    this.file,
    this.defaultColor,
    this.defaultIcon,
  }) : super(key: key);

  Widget _buildMissingImage() => Center(
        child: Icon(
          defaultIcon ?? Icons.image,
          size: height / 2,
          color: Get.theme.scaffoldBackgroundColor,
        ),
      );

  @override
  Widget build(BuildContext context) => ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: Container(
          height: height,
          color: defaultColor ?? AppTheme.lightGrey,
          width: width ?? height,
          child: GetUtils.isNull(file.downloadUrl)
              ? Is.falsy(file?.data?.path)
                  ? _buildMissingImage()
                  : Image.file(
                      File(
                        file?.data?.path,
                      ),
                      width: width ?? height,
                      height: height,
                      cacheWidth: (width ?? height).toInt(),
                      cacheHeight: height.toInt(),
                      filterQuality: FilterQuality.low,
                      scale: 1.0,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => _buildMissingImage(),
                    )
              : Image.network(
                  file.downloadUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => _buildMissingImage(),
                ),
        ),
      );
}
