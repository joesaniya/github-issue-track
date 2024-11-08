/*import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

enum RequestType { get, post, put, delete }

class DioClient {
  final Dio _dio = Dio();
  double? extTime;

  late Response response;

  DioClient() {
    _dio
      ..options.connectTimeout = 20000
      ..options.receiveTimeout = 90000
      ..httpClientAdapter
      ..options.responseType = ResponseType.json;
    if (kDebugMode) {
      _dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: true,
          error: true,
          compact: true,
          maxWidth: 90,
        ),
      );
    }
  }

  Future<Response?> performCall({
    required RequestType requestType,
    required String url,
    required String basicAuth,
    Map<String, dynamic>? queryParameters,
    data,
  }) async {
    log(url);
    log(basicAuth);

    late Response response;
    queryParameters = queryParameters == null || queryParameters.isEmpty
        ? {}
        : queryParameters;
    data = data ?? {};
    try {
      switch (requestType) {
        case RequestType.get:
          response = await _dio.get(url,
              queryParameters: queryParameters,
              options: Options(headers: {'authorization': basicAuth}));
          break;
        case RequestType.post:
          response = await _dio.post(url,
              queryParameters: queryParameters,
              data: data,
              options: Options(headers: {'authorization': basicAuth}));
          break;
        case RequestType.put:
          response = await _dio.put(url,
              queryParameters: queryParameters,
              data: data,
              options: Options(headers: {'authorization': basicAuth}));
          break;
        case RequestType.delete:
          response = await _dio.delete(url,
              queryParameters: queryParameters,
              options: Options(
                  headers: <String, String>{'authorization': basicAuth}));
          break;
      }
    } on PlatformException catch (err) {
      log("platform exception happened: $err");
      return response; /* ApiResponse(
          isSuccess: false,
          statusCode: 0,
          data: null,
          error: ErrorResponse(
              statusCode: 0,
              errorCode: "PLATFORM_EXCEPTION",
              message: "no message")); */
    } catch (error) {
      //  var errorResponse = NetworkExceptions.getDioException(error);
      return null; /* ApiResponse(
          isSuccess: false, data: null, error: errorResponse, statusCode: 0); */
    }
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response; /* ApiResponse(
          isSuccess: true,
          data: response,
          error: null,
          statusCode: response.statusCode); */
    } else {
      return null; /* ApiResponse(
          isSuccess: false,
          data: null,
          error: ErrorResponse(
              statusCode: response.statusCode,
              errorCode: "",
              message: response.statusMessage)); */
    }
  }
}
*/