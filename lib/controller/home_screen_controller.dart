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

class HomeScreenController extends GetxController {
  Rx<TextEditingController> searchController = TextEditingController().obs;
  late APIResult result;
  RxBool isLoading = true.obs;
  RxBool isLoadingMore = false.obs;
  RxBool noDataError = false.obs;
  RxInt page = 0.obs;
  RxInt pageCount = 10.obs;
  Rx<ProductModel> productModel = ProductModel().obs;
  RxList<Product> productList = <Product>[].obs;

  RxBool isSLoading = true.obs;
  RxBool isSLoadingMore = false.obs;
  RxBool noSDataError = false.obs;
  RxInt spage = 0.obs;
  RxInt spageCount = 10.obs;

  Rx<ProductModel> searchProductModel = ProductModel().obs;
  RxList<Product> searchProductList = <Product>[].obs;
  final ScrollController scrollController = ScrollController();
  final ScrollController searchScrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    getApiRequest();
    scrollController.addListener(_scrollListener);
    searchScrollController.addListener(_searchScrollListener);
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
          GetProductsRequest(
              skip: page.value.toString(), limit: pageCount.value.toString()),
          ApiDataSource(),
        );
      }
    } else {
      isLoadingMore(false);
    }
  }

   Future<void> _searchScrollListener() async {
    if(searchController.value.text.isNotEmpty){
    if (isSLoadingMore.isTrue) return;
    if (searchScrollController.position.pixels ==
        searchScrollController.position.maxScrollExtent) {
      if (searchProductModel.value.products!.length <
          spageCount.value) {
        return;
      } else {
        isSLoadingMore(true);
        spage(spage.value + 10);
        apiCallFun(
          GetSearchProductsRequest(
            search: searchController.value.text.toString(),
              skip: spage.value.toString(), limit: spageCount.value.toString()),
          ApiDataSource(),
        );
      }
    } else {
      isSLoadingMore(false);
    }
    }
  }


getSearchApiRequest() async {
  searchProductList.clear();
  searchProductModel.value = ProductModel();
    await searchApiCallFun(GetSearchProductsRequest(
            search: searchController.value.text.toString(),
              skip: spage.value.toString(), limit: spageCount.value.toString()),
          ApiDataSource(),);
  }

  getApiRequest() async {
    await apiCallFun(GetProductsRequest(
              skip: page.value.toString(), limit: pageCount.value.toString()),
          ApiDataSource(),  );
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


   Future<void> searchApiCallFun(
      RemoteRequest remoteRequest, ApiDataSource remoteDataSource) async {
    try {
      if (isSLoadingMore.isFalse) {
        isSLoading(true);
        searchProductModel.value.products?.clear();
      }
        isSLoading.refresh();
        searchProductModel.value.products?.clear();
        searchProductModel.refresh();
        result = await remoteDataSource.makeRequest(remoteRequest);
      if (result.statusCode == 200 &&
          result.data != null && result.data != "done") {
        searchProductModel.value =
            ProductModel.fromJson(result.data);
        for (var element in searchProductModel.value.products!) {
          searchProductList.add(element);
        }
        noSDataError(false);
      } else {
        noSDataError(true);
      }
    }  on SocketException {
      CommonMethods.errorSnackBar(InternetConnectionException());
      noSDataError(false);
    } on TimeoutException {
      CommonMethods.errorSnackBar(InternetConnectionException());
      noSDataError(false);
    } catch (e) {
      noSDataError(false);
      CommonMethods.errorSnackBar(e.toString());
    }
    isSLoading(false);
    isSLoadingMore(false);
    isSLoadingMore.refresh();
    isSLoading.refresh();
  }
}
