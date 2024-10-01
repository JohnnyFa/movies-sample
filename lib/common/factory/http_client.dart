import 'package:dio/dio.dart';
import 'package:movies_flutter_sample/common/constants/app_constants.dart';
import '../adapter/dio_adapter.dart';
import '../adapter/dio_get_client.dart';

DioGetClient makeHttpGetClient() => DioAdapter(
      client: Dio(BaseOptions(
        baseUrl: AppConstants.baseUrl,
      )),
    );
