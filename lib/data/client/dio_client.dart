import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:injectable/injectable.dart';

@singleton
class DioClient extends DioForNative{
  static const String _baseUrl = "https://api.punkapi.com/v2/";
  static BaseOptions baseOptions(String baseUrl) => BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 30),
    sendTimeout: const Duration(seconds: 30),
    contentType: "application/json",
  );

  DioClient._(String baseUrl) : super(baseOptions(baseUrl));

  @factoryMethod
  static DioClient inject() {
    return DioClient._(_baseUrl);
  }
}
