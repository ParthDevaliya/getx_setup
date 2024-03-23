import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/app_colors.dart';
import '../utils/app_style.dart';

class CustomTextField extends StatelessWidget {
  final String? headingTitle;
  final String? hintText;
  final String? lableText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final bool readOnly;
  final void Function()? onTap;
  final Color? labelColor;
  final String? initialValue;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final void Function(String)? onFieldSubmitted;
  final void Function(String)? onChanged;
  final bool autofocus;
  final Widget? prefixIcon;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final int? maxLength;
  final AutovalidateMode? autovalidateMode;
  final void Function()? obscureTextTap;
  final bool isObscureText;
  final int? maxLines;
  final bool isMandatory;
  final EdgeInsetsGeometry? contentPaddings;
  final TextAlign? textAlign;

  final bool enabled;
  const CustomTextField(
      {super.key,
      this.headingTitle,
      this.hintText,
      this.readOnly = false,
      this.obscureText = false,
      this.onTap,
      this.prefixIcon,
      this.onSaved,
      this.initialValue,
      this.textInputAction,
      this.lableText,
      this.labelColor,
      this.controller,
      this.validator,
      this.keyboardType,
      this.suffixIcon,
      this.onFieldSubmitted,
      this.onChanged,
      this.autofocus = false,
      this.enabled = true,
      this.style,
      this.hintStyle,
      this.maxLength,
      this.maxLines = 1,
      this.autovalidateMode,
      this.contentPaddings,
      this.isObscureText = false,
      this.isMandatory = false,
      this.textAlign,
      this.obscureTextTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        headingTitle == null
            ? Container(height: 0)
            : Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    headingTitle.toString(),
                    textAlign: TextAlign.left,
                    style: AppStyle.blackMedium16.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.0,
                      color: AppColors.textFieldHeadingColor,
                    ),
                  ),
                  isMandatory
                      ? Text(
                          "*",
                          style: AppStyle.blackMedium16.copyWith(
                            color: AppColors.primaryColor,
                          ),
                        )
                      : Container(),
                ],
              ),
        // const SizedBox(height: 6.0),
        Focus(
          onFocusChange: (hasFocus) {
            if (!hasFocus) {
              validator;
            }
          },
          child: TextFormField(
            cursorColor: AppColors.primaryColor,
            style: style ??
                AppStyle.blackMedium16.copyWith(
                  fontSize: 16.0,
                  color: Theme.of(context).iconTheme.color,
                  fontWeight: FontWeight.w500,
                ),
            textAlign: textAlign ?? TextAlign.start,
            maxLength: maxLength,
            maxLines: maxLines,
            decoration: InputDecoration(
              labelText: lableText,
              enabled: enabled,
              errorStyle: const TextStyle(
                  color: AppColors.redColor, fontWeight: FontWeight.w500),
              labelStyle: TextStyle(
                color: Get.isDarkMode
                    ? AppColors.whiteColor
                    : AppColors.blackColor,
              ),
              counterStyle: const TextStyle(
                color: AppColors.blackColor,
              ),
              contentPadding: contentPaddings ??
                  EdgeInsets.only(
                      top: maxLines! > 2 ? 20.0 : 0.2, bottom: 0.2, left: 14.0),
              hintText: hintText,
              hintStyle: hintStyle ??
                  AppStyle.blackMedium16.copyWith(
                    color: AppColors.blackColor.withOpacity(0.4),
                  ),
              counterText: "",
              prefixIcon: prefixIcon,
              filled: true,
              fillColor: AppColors.primaryColor.withOpacity(0.24),
              suffixIcon: isObscureText
                  ? InkWell(
                      onTap: obscureTextTap,
                      child: Icon(
                        obscureText
                            ? Icons.visibility_rounded
                            : Icons.visibility_off_rounded,
                        color: Get.isDarkMode
                            ? AppColors.whiteColor.withOpacity(0.4)
                            : AppColors.blackColor.withOpacity(0.2),
                      ))
                  : suffixIcon,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(8),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(8),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            textInputAction: textInputAction,
            keyboardType: keyboardType,
            onSaved: onSaved,
            obscureText: obscureText,
            initialValue: initialValue,
            validator: validator,
            controller: controller,
            readOnly: readOnly,
            onTap: onTap,
            onFieldSubmitted: onFieldSubmitted,
            onChanged: onChanged,
            autofocus: autofocus,
            autovalidateMode: autovalidateMode,
          ),
        ),
      ],
    );
  }
}
