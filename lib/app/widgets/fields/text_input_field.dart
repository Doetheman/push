/// -----------------------------------------------------------------
///
/// File: text_input_field.dart
/// Project: PUSH
/// File Created: Wednesday, March 31st, 2021
/// Description:
///
/// Author: Courtney Johnson - courtney@longsoftware.io
/// -----
/// Last Modified: Wednesday, April 7th, 2021
/// Modified By: Brandon Long - brandon@longsoftware.io
/// -----
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH LLC
///
/// -----------------------------------------------------------------

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:push_app/app/theme/app_theme.dart';

class TextInputField extends StatefulWidget {
  final bool isPassword;
  final TextAlign textAlign;
  final String labelText;
  final String hintText;
  final TextStyle style;
  final Function(String) validator;
  final String initialValue;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final InputBorder inputBorder;
  final int maxLength;
  final int maxLines;
  final bool hideBorder;
  final bool readOnly;
  final Function(String) onChanged;
  final Function buildCounter;
  final List<TextInputFormatter> formatters;
  final Widget suffixIcon;

  const TextInputField({
    this.hintText,
    this.keyboardType,
    this.controller,
    this.textAlign,
    this.initialValue,
    this.maxLength,
    this.maxLines = 1,
    this.style,
    this.validator,
    this.hideBorder = false,
    this.isPassword = false,
    this.inputBorder,
    this.onChanged,
    this.formatters,
    this.readOnly = false,
    this.buildCounter,
    this.labelText,
    this.suffixIcon,
  });
  @override
  _TextInputFieldState createState() => _TextInputFieldState();
}

class _TextInputFieldState extends State<TextInputField> {
  IconData _passwordIcon = Icons.visibility;
  bool _obsureText;

  @override
  void initState() {
    _obsureText = widget.isPassword;

    super.initState();
  }

  void _toggleTextVisibility() {
    setState(() {
      _obsureText = !_obsureText;
      if (_passwordIcon == Icons.visibility) {
        _passwordIcon = Icons.visibility_off;
      } else {
        _passwordIcon = Icons.visibility;
      }
    });
  }

  @override
  Widget build(BuildContext context) => Container(
        child: TextFormField(
          buildCounter: widget.buildCounter,
          textAlign: widget.textAlign ?? TextAlign.start,
          obscureText: _obsureText,
          textCapitalization: _obsureText
              ? TextCapitalization.none
              : TextCapitalization.sentences,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(
              left: 15,
              right: 20,
            ),
            hintText: widget.hintText,
            suffixIconConstraints: BoxConstraints(maxHeight: 22),
            suffixIcon: (widget.isPassword
                    ? GestureDetector(
                        onTap: _toggleTextVisibility,
                        child: Icon(_passwordIcon),
                      )
                    : widget.suffixIcon)
                .paddingOnly(right: 20),
            labelText: widget.labelText ?? 'Field Label',
            labelStyle: AppTheme.bodyOne.copyWith(color: AppTheme.darkGrey),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide(
                color: AppTheme.darkGrey,
                width: 1,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide(
                color: AppTheme.darkGrey,
                width: 1,
              ),
            ),
          ),
          validator: widget.validator,
          maxLength: widget.maxLength,
          onChanged: widget.onChanged,
          readOnly: widget.readOnly,
          inputFormatters: widget.formatters,
          initialValue: widget.initialValue,
          maxLines: widget.maxLines,
          controller: widget.controller,
          keyboardType: widget.keyboardType ?? TextInputType.text,
          style: widget.style ?? AppTheme.bodyOne,
        ),
      );
}
