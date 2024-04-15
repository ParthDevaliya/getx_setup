import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_setup/controller/home_screen_controller.dart';
import 'package:getx_setup/utils/app_colors.dart';
import 'package:getx_setup/utils/app_routes.dart';
import 'package:getx_setup/utils/app_strings.dart';
import 'package:getx_setup/utils/app_style.dart';
import 'package:getx_setup/utils/preference_utils.dart';

import 'card_widget.dart';

class HomeScreen extends GetView<HomeScreenController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(
          AppStrings.homeScreen,
          style: AppStyle.blackBold18.copyWith(
            color: AppColors.whiteColor,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(AppRoutes.searchScreen);
            },
            icon: const Icon(
              Icons.search,
              color: AppColors.whiteColor,
            ),
          ),
          const SizedBox(width: 6.0),
          IconButton(
            onPressed: () async {
              await PreferenceUtils().removeAllData();
              Get.offAllNamed(AppRoutes.loginScreen);
            },
            icon: const Icon(
              Icons.logout,
              color: AppColors.whiteColor,
            ),
          ),
          const SizedBox(width: 6.0),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GetProductList(controller: controller),
          ],
        ),
      ),
    );
  }
}

class GetProductList extends StatelessWidget {
  const GetProductList({
    super.key,
    required this.controller,
  });

  final HomeScreenController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Expanded(
        child: controller.isLoading.isFalse
            ? controller.noDataError.isTrue
                ? Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            AppStrings.somethinhWentWrong,
                            textAlign: TextAlign.center,
                            style: AppStyle.blackBold16.copyWith(),
                          ),
                          const SizedBox(height: 10.0),
                          Container(
                            height: 40.0,
                            width: 200.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.0),
                              border: Border.all(
                                  color: AppColors.redColor, width: 1.2),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              AppStrings.tryAgain,
                              style: AppStyle.blackBold14.copyWith(
                                color: AppColors.redColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : controller.productList.isNotEmpty
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: ListView.builder(
                                keyboardDismissBehavior:
                                    ScrollViewKeyboardDismissBehavior.onDrag,
                                controller: controller.scrollController,
                                itemCount: controller.productList.length,
                                itemBuilder: (context, index) {
                                  return CardWidget(
                                    product: controller.productList[index],
                                  );
                                }),
                          ),
                          if (controller.isLoadingMore.isTrue)
                            const Center(
                                child: SizedBox(
                                    height: 40.0,
                                    width: 40.0,
                                    child: CircularProgressIndicator())),
                        ],
                      )
                    : Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Center(
                          child: Text(
                            AppStrings.somethinhWentWrong,
                            textAlign: TextAlign.center,
                            style: AppStyle.blackBold16.copyWith(),
                          ),
                        ),
                      )
            : const Center(
                child: SizedBox(
                  height: 40.0,
                  width: 40.0,
                  child: CircularProgressIndicator(),
                ),
              ),
      ),
    );
  }
}
