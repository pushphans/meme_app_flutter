import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:meme_app_flutter/data/models/ApiResponse.dart';
import 'package:meme_app_flutter/utils/constants.dart';

class ApiDataSource {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: Duration(seconds: 30),
      receiveTimeout: Duration(seconds: 30),
    ),
  );

  ApiDataSource() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          log("Sending request ${options.data} ${options.path}");
          log("Sending data ${options.data}");
          return handler.next(options);
        },

        onResponse: (response, handler) {
          log("Recieved response ${response.data} with ${response.statusCode}");
          return handler.next(response);
        },

        onError: (error, handler) {
          log("Error ${error.message}");
          return handler.next(error);
        },
      ),
    );
  }

  Future<ApiResponse> getMemes() async {
    try {
      final response = await _dio.get(
        "50",
        options: Options(
          headers: {
            "Content-type": "application/json",
            "Accept": "application/json",
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        var data = response.data;
        return ApiResponse.fromJson(data);
      } else {
        throw Exception("Error with StatusCode: ${response.statusCode}");
      }
    } on DioException catch (e) {
      log("Unexpected error $e");
      throw Exception(e.toString());
    } catch (e) {
      log("Error occurred ${e.toString()}");
    }

    throw Exception("Unexpected error");
  }
}
