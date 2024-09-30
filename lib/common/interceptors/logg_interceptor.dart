import 'package:dio/dio.dart';

InterceptorsWrapper loggingInterceptor() {
  return InterceptorsWrapper(
    onRequest: (options, handler) {
      print('Request: [${options.method}] ${options.baseUrl}${options.path}');
      print('Headers: ${options.headers}');
      print('Query Parameters: ${options.queryParameters}');
      print('Data: ${options.data}');
      return handler.next(options);
    },
    onResponse: (response, handler) {
      print('Response: [${response.statusCode}] ${response.requestOptions.method} ${response.requestOptions.path}');
      print('Data: ${response.data}');
      return handler.next(response);
    },
    onError: (DioException e, handler) {
      print('Error: [${e.response?.statusCode}] ${e.requestOptions.method} ${e.requestOptions.path}');
      print('Message: ${e.message}');
      print('Data: ${e.response?.data}');
      return handler.next(e);
    },
  );
}