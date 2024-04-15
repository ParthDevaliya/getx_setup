import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../api_service/api_common_service/api_data_source.dart';
import '../api_service/api_common_service/api_error_handling.dart';
import '../api_service/api_common_service/api_request.dart';
import '../api_service/requests/get_products_request.dart';
import '../model/product_model.dart';
import '../utils/common_methods.dart';

class SearchScreenController extends GetxController {
  Rx<TextEditingController> searchController = TextEditingController().obs;
  late APIResult result;
  RxBool isLoading = false.obs;
  RxBool isLoadingMore = false.obs;
  RxBool noDataError = false.obs;
  RxInt page = 0.obs;
  RxInt pageCount = 10.obs;
  Rx<ProductModel> productModel = ProductModel().obs;
  RxList<Product> productList = <Product>[].obs;
  final ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(_scrollListener);
  }


  Future<void> _scrollListener() async {
    if (isLoadingMore.isTrue) return;
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      if (productModel.value.products!.length <
          pageCount.value) {
        return;
      } else {
        isLoadingMore(true);
        page(page.value + 10);
        apiCallFun(
          GetSearchProductsRequest(
            search: searchController.value.text.toString(),
              skip: page.value.toString(), limit: pageCount.value.toString()),
          ApiDataSource(),
        );
      }
    } else {
      isLoadingMore(false);
    }
  }


getSearchApiRequest({required String value}) async {
  productList.clear();
  productModel.value = ProductModel();
    await apiCallFun(GetSearchProductsRequest(
            search: value.toString(),
              skip: page.value.toString(), limit: pageCount.value.toString()),
          ApiDataSource(),);
  }


  Future<void> apiCallFun(
      RemoteRequest remoteRequest, ApiDataSource remoteDataSource) async {
    try {
      if (isLoadingMore.isFalse) {
        isLoading(true);
        productModel.value.products?.clear();
      }
        isLoading.refresh();
        productModel.value.products?.clear();
        productModel.refresh();
        result = await remoteDataSource.makeRequest(remoteRequest);
      if (result.statusCode == 200 &&
          result.data != null && result.data != "done") {
        productModel.value = 
            ProductModel.fromJson(result.data);
        for (var element in productModel.value.products!) {
          productList.add(element);
        }
        noDataError(false);
      } else {
        noDataError(true);
      }
    }  on SocketException {
      CommonMethods.errorSnackBar(InternetConnectionException());
      noDataError(false);
    } on TimeoutException {
      CommonMethods.errorSnackBar(InternetConnectionException());
      noDataError(false);
    } catch (e) {
      noDataError(false);
      CommonMethods.errorSnackBar(e.toString());
    }
    isLoading(false);
    isLoadingMore(false);
    isLoadingMore.refresh();
    isLoading.refresh();
  }
}
