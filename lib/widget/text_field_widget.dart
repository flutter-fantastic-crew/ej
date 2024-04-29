import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final String? hintText;
  final TextStyle? hintStyle;
  final Widget? prefix;
  final Widget? suffix;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final GestureTapCallback? onTap;
  final TapRegionCallback? onTapOutside;
  final bool? readOnly;

  const TextFieldWidget({
    super.key,
    this.controller,
    this.onChanged,
    this.hintText,
    this.hintStyle,
    this.prefix,
    this.suffix,
    this.inputFormatters,
    this.keyboardType,
    this.onTap,
    this.onTapOutside,
    this.readOnly,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          child: prefix,
        ),
        Expanded(
            child: TextField(
          controller: controller,
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: hintStyle,
            border: InputBorder.none,
          ),
          inputFormatters: inputFormatters,
          keyboardType: keyboardType ?? TextInputType.text,
          onTap: onTap,
          onTapOutside: onTapOutside,
          readOnly: readOnly ?? false,
        )),
        Container(
          child: suffix,
        )
      ],
    );
  }
}
