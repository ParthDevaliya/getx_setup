import 'package:flutter/material.dart';
import 'package:getx_setup/model/product_model.dart';
import 'package:getx_setup/utils/app_colors.dart';
import 'package:getx_setup/utils/app_style.dart';

class CardWidget extends StatelessWidget {
  final Product product;
  const CardWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 10.0),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.blackColor.withOpacity(0.4),
        ),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            product.title.toString(),
            style: AppStyle.blackBold14.copyWith(),
          ),
          const SizedBox(height: 4.0),
          Text(
            product.description.toString(),
            style: AppStyle.blackBold14.copyWith(
                fontSize: 12.0, color: AppColors.blackColor.withOpacity(0.6)),
          ),
          const SizedBox(height: 4.0),
          RichText(
            text: TextSpan(
              text: 'Price: ',
              style: AppStyle.blackBold14.copyWith(
                fontSize: 12.0,
                color: AppColors.blackColor,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: product.price.toString(),
                  style: AppStyle.blackBold14.copyWith(
                    fontSize: 12.0,
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
