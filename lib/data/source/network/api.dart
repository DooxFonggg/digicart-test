import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:digicard/cores/constans/server_request_response_constant.dart';
import 'package:digicard/cores/constans/server_timeout_constants.dart';
import 'package:digicard/data/source/local/local_storage.dart';
import 'package:digicard/data/source/network/result_dto.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

enum Method { GET, POST, DELETE, PUT, PATCH }

class Api extends GetConnect {
  final String backendUrl;
  final _stroge = Get.find<LocalStorage>();
  final bool? requiredAuthorization;
  Api({required this.backendUrl, this.requiredAuthorization = true});

  @override
  String get baseUrl => backendUrl;

  String get authorization =>
      '${ServerRequestResponseConstants.bearer} ${_stroge.accessToken}';

  String get language => _stroge.locale.languageCode.toString();

  @override
  void onInit() {
    httpClient.timeout = ServerTimeoutConstants.timeOut;
    httpClient.addRequestModifier<void>((request) async {
      // Config Header
      if (requiredAuthorization == true) {
        request.headers['Authorization'] = authorization;
        request.headers['x-language'] = language;
      } else {}

      // For development
      if (kDebugMode) {
        log(request.headers.toString(), name: request.url.path);
      }
      return request;
    });
    super.onInit();
  }

  Future<Result> getData(
      {required String endPoint,
      Map<String, dynamic>? params,
      Duration? timeOut = ServerTimeoutConstants.timeOut,
      bool retry = false}) async {
    Response? res;
    try {
      res = await get(endPoint, query: params).timeout(timeOut!);

      if (res.isOk) {
        _requestOk(Method.GET, endPoint, params, res.bodyString);
      } else {
        _requestException(
          Method.GET,
          endPoint,
          'PARSING ERROR',
          params: params,
          bodyString: res.bodyString,
        );
      }
      return Result.fromJson(res.bodyString!);
    } on TimeoutException catch (e) {
      _requestException(
        Method.GET,
        endPoint,
        'TimeOut',
        params: params,
        bodyString: res?.bodyString,
        exception: e.message,
      );
      return onTimeOut(endPoint: endPoint, params: params);
    } catch (e) {
      _requestException(
        Method.GET,
        endPoint,
        'ERROR',
        params: params,
        bodyString: res?.bodyString,
        exception: e.toString(),
      );
      return onServerError(endPoint: endPoint, params: params);
    }
  }

  /// FOR NETWORKING WITH [Method.POST]
  /// RETURN DATA WITH [Result] MODEL
  Future<Result> postData(
      {required String endPoint,
      dynamic params,
      Duration? timeOut = ServerTimeoutConstants.timeOut,
      bool retry = false}) async {
    Response? res;
    try {
      if (params == null) {
        res = await httpClient.post(endPoint).timeout(timeOut!);
      } else {
        res = await httpClient.post(endPoint, body: params).timeout(timeOut!);
      }
      log(res.bodyString ?? '', name: 'RESPONSE');

      if (res.isOk) {
        _requestOk(Method.POST, endPoint, params, res.bodyString);
      } else {
        _requestException(
          Method.POST,
          endPoint,
          'PARSING ERROR',
          params: params,
          bodyString: res.bodyString,
        );
      }

      return Result.fromJson(res.bodyString!);
    } on TimeoutException catch (e) {
      _requestException(
        Method.POST,
        endPoint,
        'TimeOut',
        params: params,
        bodyString: res?.bodyString,
        exception: e.message,
      );
      return onTimeOut(endPoint: endPoint, params: params);
    } catch (e) {
      _requestException(
        Method.POST,
        endPoint,
        'ERROR',
        params: params,
        bodyString: res?.bodyString,
        exception: e.toString(),
      );
      return onServerError(endPoint: endPoint, params: params);
    }
  }

  /// FOR NETWORKING WITH [Method.POST]
  /// RETURN DATA WITH [Result] MODEL
  Future<Result> patchData(
      {required String endPoint,
      dynamic params,
      Duration? timeOut = ServerTimeoutConstants.timeOut,
      bool retry = false}) async {
    Response? res;
    try {
      if (params == null) {
        res = await httpClient.patch(endPoint).timeout(timeOut!);
      } else {
        res = await httpClient.patch(endPoint, body: params).timeout(timeOut!);
      }
      log(res.bodyString!, name: 'RESPONSE');

      if (res.isOk) {
        _requestOk(Method.PATCH, endPoint, params, res.bodyString);
      } else {
        _requestException(
          Method.PATCH,
          endPoint,
          'PARSING ERROR',
          params: params,
          bodyString: res.bodyString,
        );
      }

      return Result.fromJson(res.bodyString!);
    } on TimeoutException catch (e) {
      _requestException(
        Method.PATCH,
        endPoint,
        'TimeOut',
        params: params,
        bodyString: res?.bodyString,
        exception: e.message,
      );
      return onTimeOut(endPoint: endPoint, params: params);
    } catch (e) {
      _requestException(
        Method.PATCH,
        endPoint,
        'ERROR',
        params: params,
        bodyString: res?.bodyString,
        exception: e.toString(),
      );
      return onServerError(endPoint: endPoint, params: params);
    }
  }

  /// FOR NETWORKING WITH [Method.POST]
  /// RETURN DATA WITH [Result] MODEL
  Future<Result> putData(
      {required String endPoint,
      dynamic params,
      Duration? timeOut = ServerTimeoutConstants.timeOut,
      bool retry = false}) async {
    Response? res;
    try {
      if (params == null) {
        res = await httpClient.put(endPoint).timeout(timeOut!);
      } else {
        res = await httpClient
            .put(
              endPoint,
              body: params,
            )
            .timeout(timeOut!);
      }

      if (res.isOk) {
        _requestOk(Method.PUT, endPoint, params, res.bodyString);
      } else {
        _requestException(
          Method.PUT,
          endPoint,
          'PARSING ERROR',
          params: params,
          bodyString: res.bodyString,
        );
      }

      return Result.fromJson(res.bodyString!);
    } on TimeoutException catch (e) {
      _requestException(
        Method.POST,
        endPoint,
        'TimeOut',
        params: params,
        bodyString: res?.bodyString,
        exception: e.message,
      );
      return onTimeOut(endPoint: endPoint, params: params);
    } catch (e) {
      _requestException(
        Method.POST,
        endPoint,
        'ERROR',
        params: params,
        bodyString: res?.bodyString,
        exception: e.toString(),
      );
      return onServerError(endPoint: endPoint, params: params);
    }
  }

  /// FOR NETWORKING WITH [Method.DELETE]
  /// RETURN DATA WITH [Result] MODEL
  Future<Result> deleteData(
      {required String endPoint,
      Duration? timeOut = ServerTimeoutConstants.timeOut,
      Map<String, dynamic>? params,
      bool retry = false}) async {
    // onInit();

    Response? res;
    try {
      if (params == null) {
        res = await httpClient.delete(endPoint).timeout(timeOut!);
      } else {
        res =
            await httpClient.delete(endPoint, query: params).timeout(timeOut!);
      }
      if (res.isOk) {
        _requestOk(Method.DELETE, endPoint, params, res.bodyString);
      } else {
        _requestException(
          Method.DELETE,
          endPoint,
          'PARSING ERROR',
          params: params,
          bodyString: res.bodyString,
        );
      }
      return Result.fromJson(res.bodyString!);
    } on TimeoutException catch (e) {
      _requestException(
        Method.DELETE,
        endPoint,
        'TimeOut',
        params: params,
        bodyString: res?.bodyString,
        exception: e.message,
      );
      return onTimeOut(endPoint: endPoint, params: params);
    } catch (e) {
      _requestException(
        Method.DELETE,
        endPoint,
        'ERROR',
        params: params,
        bodyString: res?.bodyString,
        exception: e.toString(),
      );
      return onServerError(endPoint: endPoint, params: params);
    }
  }

  // For development
  _requestException(
    Method method,
    String endPoint,
    String status, {
    String? exception,
    String? bodyString,
    dynamic params,
  }) {
    if (kDebugMode) {
      final fullUrl = baseUrl + endPoint;
      log('$method: $fullUrl Params: $params', name: 'API');
      log('$status => $exception', name: 'API');
      log('Response => $bodyString', name: 'API');
    }
  }

  // For development
  _requestOk(Method method, String endpoint, dynamic params, dynamic response) {
    if (kDebugMode) {
      log('request ok');
      final fullUrl = baseUrl + endpoint;
      log('$method: $fullUrl Params: $params', name: 'API');
      try {
        const JsonDecoder decoder = JsonDecoder();
        const JsonEncoder encoder = JsonEncoder.withIndent('  ');
        final object = decoder.convert(response as String);
        log('Response => ${encoder.convert(object)}', name: 'API');
      } catch (e) {
        log(response.toString(), name: 'API');
      }
    }
  }

  Future<Result> onTimeOut(
      {Method method = Method.GET,
      required String endPoint,
      dynamic params}) async {
    return Result(
        msg: "We're sorry, something went wrong.",
        success: false,
        errorCode: 'SERVER_FAULT_CODE');
  }

  Future<Result> onServerError(
      {Method method = Method.GET,
      required String endPoint,
      dynamic params}) async {
    return Result(
        msg: "We're sorry, something went wrong.",
        success: false,
        errorCode: 'SERVER_FAULT_CODE');
  }
}
