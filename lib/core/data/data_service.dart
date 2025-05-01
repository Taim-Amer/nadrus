import 'dart:io';
import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:nadros/core/data/data_consts.dart';
import 'package:nadros/core/data/data_state.dart';
import 'package:nadros/core/utils/app_router.dart';
import 'package:nadros/core/utils/cache_helper.dart';

class DataService {
  final Dio _dio;

  DataService(this._dio);

  Future<DataState<T>> getData<T>({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    required Function(Map<String, dynamic>) fromJson,
  }) async {
    try {
      final response = await _dio.get(
        DataConsts.serverUrl + endPoint,
        options: Options(
          headers: {
            'Authorization': 'Bearer ${CacheHelper.token2}',
            "Accept": "application/json",
            "Content-Type": "application/json; charset=UTF-8",
            'lang': cache.read(CacheHelper.language) == 0 ? 'ar' : 'en',
          },
        ),
        queryParameters: queryParameters,
      );
      return handleDataState(response: response, fromJson: fromJson);
    } on DioException catch (error) {
      return handleDataState(response: error.response, fromJson: fromJson);
    }
  }

  Future<DataState<T>> postData<T>({
    dynamic data,
    required String endPoint,
    required Function(Map<String, dynamic>) fromJson,
  }) async {
    try {
      final response = await _dio.post(
        DataConsts.serverUrl + endPoint,
        options: Options(
          headers: {
            'Authorization': 'Bearer ${CacheHelper.token2}',
            "Accept": "application/json",
            "Content-Type": "application/json; charset=UTF-8",
          },
        ),
        data: data,
      );
      return handleDataState(response: response, fromJson: fromJson);
    } on DioException catch (error) {
      return handleDataState(response: error.response, fromJson: fromJson);
    }
  }

  Future<DataState<T>> deleteData<T>({
    dynamic data,
    required String endPoint,
    required Function(Map<String, dynamic>) fromJson,
  }) async {
    try {
      final response = await _dio.delete(
        DataConsts.serverUrl + endPoint,
        options: Options(
          headers: {
            'Authorization': 'Bearer ${CacheHelper.token2}',
            "Accept": "application/json",
            "Content-Type": "application/json; charset=UTF-8",
          },
        ),
        data: data,
      );
      return handleDataState(response: response, fromJson: fromJson);
    } on DioException catch (error) {
      return handleDataState(response: error.response, fromJson: fromJson);
    }
  }

  Future<DataState<T>> putData<T>({
    dynamic data,
    required String endPoint,
    required Function(Map<String, dynamic>) fromJson,
  }) async {
    try {
      final response = await _dio.put(
        DataConsts.serverUrl + endPoint,
        options: Options(
          headers: {
            'Authorization': 'Bearer ${CacheHelper.token2}',
            "Accept": "application/json",
            "Content-Type": "application/json; charset=UTF-8",
          },
        ),
        data: data,
      );
      return handleDataState(response: response, fromJson: fromJson);
    } on DioException catch (error) {
      return handleDataState(response: error.response, fromJson: fromJson);
    }
  }

  Future<DataState<T>> handleDataState<T>({
    required Response? response,
    required Function(Map<String, dynamic>) fromJson,
  }) async {
    if (response != null) {
      if (response.statusCode == HttpStatus.ok) {
        final object = fromJson(response.data);
        return DataSuccess(object as T);
      } else if (response.statusCode == HttpStatus.unauthorized) {
        Get.offAllNamed(AppRouter.kLoginScreen);
        cache.remove(CacheHelper.token);
      }
    }
    return DataFailed(
      Response(
        data: response?.data['error'] ??
            response?.data['message'] ??
            'unknown error',
        statusCode: response?.statusCode,
        requestOptions: response?.requestOptions ?? RequestOptions(),
      ),
    );
  }
}
