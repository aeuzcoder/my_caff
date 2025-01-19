import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:http_interceptor/http_interceptor.dart';
import 'package:my_caff/core/services/log_service.dart';
import 'package:my_caff/feauture/data/datasources/database/db_service.dart';

class HttpInterceptor implements InterceptorContract {
  @override
  FutureOr<BaseRequest> interceptRequest({required BaseRequest request}) {
    try {
      // Проверяем URL для авторизации
      if (request.url.path.contains('/token')) {
        // Устанавливаем заголовок для авторизации
        request.headers.clear();
        request.headers['Content-Type'] = 'application/x-www-form-urlencoded';
        log('Authorization Request Headers: ${request.headers}');
      } else {
        // Общие заголовки для остальных запросов
        var accessToken = DBService.to.getAccessToken();
        request.headers.clear();
        request.headers['Content-Type'] = 'application/json; charset=UTF-8';
        if (accessToken.isNotEmpty) {
          request.headers['Authorization'] = 'Bearer $accessToken';
        }
        log('Request Headers: ${request.headers}');
      }

      // Логируем URL
      log('Request URL: ${request.url}');
    } catch (e) {
      LogService.e('Error in interceptRequest: ${e.toString()}');
    }
    return request;
  }

  @override
  FutureOr<BaseResponse> interceptResponse({required BaseResponse response}) {
    if (response.statusCode == 200 || response.statusCode == 201) {
      if (response is Response) {
        LogService.i('Response Body: ${jsonDecode(response.body).toString()}');
      }
    } else {
      LogService.e('Response Status Code: ${response.statusCode}');
      if (response is Response) {
        LogService.i(
            'Error Response Body: ${jsonDecode(response.body).toString()}');
      } else {
        LogService.e('Error Response: ${response.toString()}');
      }
    }
    return response;
  }

  @override
  FutureOr<bool> shouldInterceptRequest() {
    return true;
  }

  @override
  FutureOr<bool> shouldInterceptResponse() {
    return true;
  }
}
