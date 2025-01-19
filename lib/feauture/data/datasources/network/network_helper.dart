import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:http_interceptor/http_interceptor.dart';
import 'package:my_caff/core/services/log_service.dart';
import 'package:my_caff/feauture/data/datasources/database/db_service.dart';

class HttpInerceptor implements InterceptorContract {
  @override
  FutureOr<BaseRequest> interceptRequest({required BaseRequest request}) {
    try {
      var accesToken = DBService.to.getAccessToken();
      request.headers.clear();
      request.headers['Content-type'] = 'application/json; charset=UTF-8';
      if (accesToken.isNotEmpty) {
        request.headers['Authorization'] = 'Baerer $accesToken';
      }
      log('URL: $request');
    } catch (e) {
      LogService.e(e.toString());
    }
    return request;
  }

  @override
  FutureOr<BaseResponse> interceptResponse({required BaseResponse response}) {
    if (response.statusCode == 200 || response.statusCode == 201) {
      if (response is Response) {
        LogService.i(jsonDecode(response.body).toString());
      }
    } else {
      LogService.e('Status Code ${response.statusCode}');
      if (response is Response) {
        LogService.i(jsonDecode(response.body).toString());
      } else {
        LogService.e(response.toString());
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
