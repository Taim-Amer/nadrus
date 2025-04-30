import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:nadros/core/data/data_service.dart';
import 'package:nadros/core/utils/app_functions.dart';
import 'package:nadros/main.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final injector = GetIt.asNewInstance();

Future<void> initDependencies() async {
  final dio = Dio(
    BaseOptions(
      sendTimeout: const Duration(seconds: 30),
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    ),
  );

  dio.interceptors.add(PrettyDioLogger(
    requestBody: true,
    error: true,
    requestHeader: true,
    logPrint: (object) => AppFunctions.print(object),
  ));

  injector.registerSingleton<Dio>(dio);

  injector.registerSingleton<DataService>(DataService(injector()));
}
