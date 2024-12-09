import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DioClient {
  @lazySingleton
  Dio get dio => Dio();
}