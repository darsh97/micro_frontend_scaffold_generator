import 'dart:async';
import 'dart:io';

import 'package:app_api_base/app_api_base.dart';
import 'package:collection/collection.dart';

// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';
import 'package:${mf_snake_case}/${mf_snake_case}.dart';

import '../model/models.dart';

class ${mf_pascal_case}ApiProvider extends ApiProviderBase {
  late final String _apiBaseUrl;
  final bool Function() shouldLogApi;
  final StreamController<Object> _dataNotificationStreamController;
  final List<String> _customLoadingApis = [];
  final List<String> _customClosingApis = [];

  ${mf_pascal_case}ApiProvider(
    String baseUrl,
    Map<String, dynamic>? commonApiHeaders,
    this._dataNotificationStreamController,
    this.shouldLogApi,
  ) {
    BaseOptions options = createBaseOptions(baseUrl);
    dio = Dio(options);

    _apiBaseUrl = dio.options.baseUrl;

    if (shouldLogApi()) {
      dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true, requestHeader: true));
    }

    dio.interceptors.add(getLoadingHUDEventDispatcherInterceptor());
    dio.interceptors.add(createCommonApiHeadersInterceptor(commonApiHeaders));
  }

  BaseOptions createBaseOptions(String baseUrl) {
    final Map<String, String> baseHeaders = {
      'accept': 'application/json',
      'content-type': 'application/json',
    };
    BaseOptions options = BaseOptions(baseUrl: baseUrl, headers: baseHeaders);

    return options;
  }

  Interceptor getLoadingHUDEventDispatcherInterceptor() => InterceptorsWrapper(
        onRequest: (RequestOptions options, handler) async {
          if (!_customLoadingApis.contains(options.path)) {
            _notifyError(DataNotification.apiCalling(ApiCalling.started));
          }
          handler.next(options);
        },
        onResponse: (Response response, handler) {
          if (!_customClosingApis.contains(response.requestOptions.path)) {
            _notifyError(DataNotification.apiCalling(ApiCalling.completed));
          }
          handler.next(response); //continue
        },
        onError: (DioError error, handler) async {
          if (error.response?.data != null) {
            _notifyError(DataNotification.error(_getApiError(error)));
          } else if (error.message.isNotEmpty) {
            _notifyError(await connectionCheck());
          } else {
            _notifyError(DataNotification.error(Error.generic()));
          }
          handler.next(error);
        },
      );

  void _notifyError(DataNotification error) {
    _dataNotificationStreamController.sink.add(error);
  }

  Error _getApiError(DioError error) {
    if (error.response == null) return Error.generic();
    try {
      final List<LocalizationMessageResponse?> errorResponse =
          ErrorResponse.fromJson(error.response!.data as Map<String, dynamic>).errorMessage;
      final errorMsgBn = errorResponse.firstWhereOrNull((e) => e?.language.toLowerCase() == 'bn')?.value;
      final errorMsgEn = errorResponse.firstWhereOrNull((e) => e?.language.toLowerCase() == 'en')?.value;

      return Error.apiResponseError(
        httpCode: error.response!.statusCode,
        messageBn: errorMsgBn,
        messageEn: errorMsgEn,
      );
    } catch (_) {}

    return Error.generic();
  }

  Future<DataNotification> connectionCheck() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return DataNotification.error(Error.noOrSlowInternet());
      }
    } on SocketException catch (_) {
      return DataNotification.error(Error.networkConnectivityError());
    }

    return DataNotification.error(Error.generic());
  }

  Interceptor createCommonApiHeadersInterceptor(Map<String, dynamic>? commonApiHeaders) => InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) async {
          options.headers.addAll(commonApiHeaders ?? {});
          handler.next(options);
        },
      );

  String get apiBaseUrl => _apiBaseUrl;
}
