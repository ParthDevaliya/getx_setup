import 'package:easy_loading_button/easy_loading_button.dart';
import 'package:flutter/material.dart';
import 'package:getx_setup/utils/app_colors.dart';

class CustomProgressButton extends StatelessWidget {
  final String btnText;
  final Color? color;
  final double? height;
  final double? width;
  final bool? hide;
  final Future<dynamic>? Function() onTap;
  const CustomProgressButton(
      {super.key,
      required this.btnText,
      this.color,
      this.height,
      this.width,
      this.hide,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: hide == true? true: false,
      child: EasyButton(
        type: EasyButtonType.elevated,
        idleStateWidget: Text(
          btnText.toString(),
          style:  const TextStyle(fontSize: 18.0,color: AppColors.whiteColor),
        ),
        loadingStateWidget: const CircularProgressIndicator(
          strokeWidth: 3.0,
          valueColor: AlwaysStoppedAnimation<Color>(
            Colors.white,
          ),
        ),
        useEqualLoadingStateWidgetDimension: false,
        useWidthAnimation: true,
        width: width ?? double.infinity,
        height: height ?? 46.0,
        borderRadius: 8.0,
        elevation: 0.0,
        buttonColor: hide == true
            ? AppColors.blackColor.withOpacity(0.3)
            : color ?? AppColors.primaryColor,
        onPressed:  onTap,
      ),
    );
  }
}
