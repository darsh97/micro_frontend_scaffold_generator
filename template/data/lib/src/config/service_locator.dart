import 'dart:async';

import 'package:app_api_base/app_api_base.dart';
import 'package:get_it/get_it.dart';
import 'package:${mf_snake_case}/${mf_snake_case}.dart';

import '../data/data.dart';

final sl = GetIt.asNewInstance();

Future<void> setUpServiceLocators(
  String baseUrl,
  Map<String, dynamic>? commonApiHeaders,
  StreamController<Object> dataNotificationStreamController,
  bool Function() shouldLogApi,
) async {
  await sl.reset();

  sl.registerFactory<ApiProviderBase>(
    () => ${mf_pascal_case}ApiProvider(
      baseUrl,
      commonApiHeaders,
      dataNotificationStreamController,
      shouldLogApi,
    ),
  );

  sl.registerFactory<BaseError>(() => BaseErrorResponse());
  sl.registerFactory<BaseErrorResponse>(() => BaseErrorResponse());

  sl.registerFactory<${mf_pascal_case}Repository>(() => ${mf_pascal_case}RepositoryImpl());
  sl.registerFactory<${mf_pascal_case}RemoteDataSource>(() => ${mf_pascal_case}RemoteDataSourceImpl());
}
