import 'dart:collection';
import 'package:BaseApp/ui/dashboard/dashboard.dart';
import 'package:alice/alice.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class RestManager {
  final bool showCurl = true;
  BuildContext context;
  // PublishSubject<bool> logOutSubject;

  RestManager(this.context);

  static RestManager _apiManager;

  static initAPIManager(BuildContext context){
    _apiManager = RestManager(context);
  }

  static Alice alice = Alice(showNotification: true, darkTheme: true);

  static RestManager getAPI() => _apiManager;

  static Future<Dio> getManager({bool showAlert = true}) async {
    return _apiManager._manager(showAlert:showAlert);
  }

  Future<Dio> _manager({bool showAlert = true}) async {
    BaseOptions option = await getDioOptions();
    Dio dio = Dio(option);

    dio.interceptors.add(alice.getDioInterceptor());
    dio.interceptors.add(InterceptorsWrapper(
        onRequest:(RequestOptions options){
          /// Do something before request is sent
          String curl = "curl -k -X ${options.method} --dump-header -";

          for (String key in options.headers.keys) {
            String header = " -H \"$key: ${options.headers[key]}\"";
            curl = curl + header;
          }

          dynamic data = options.data;

          try {
            String encoding = json.encode(data);
            if (encoding != null) {
              curl = curl + " -d \"$encoding\"";
            }
          } catch (error) {
            if (showCurl) {
              if(data is String){
                print("Param:" + data);
              }
            }
          }

          if (options.path.contains("http")) {
            curl = curl + " ${options.path}";
          } else {
            curl = curl + " ${options.baseUrl}${options.path}";
          }

          if (showCurl) {
            print(curl);
          }

          return options; ///continue
        },

        onResponse:(Response response) {
          /// Do something with response data
          return response; // continue
        },

        onError: (DioError e) {
          /// Do something with response error
          Response response = e.response;

          if(e.response != null){
            if (e.response.data is Map == false) {
              e.error = "Not in JSON Format";
              if (showAlert) {}
            }else if (context != null) {
              if (response.statusCode == 401) {
                e.error = "Access Token Expired";
              } else if (response.data != null) {
                String message = response.data["message"];
                e.error = message != null ? message : "";
                if (showAlert) {
                }
              }
            }
          }else{

          }
          return e; ///continue
        }));

    return dio;

  }

  Future<BaseOptions> getDioOptions() async {
    Map<String, String> headers = new HashMap();
    headers['Content-Type'] = 'application/json';
    // headers['api_key'] = ApiConstant.apiKey;
    BaseOptions option = BaseOptions();
    option.baseUrl = Config.baseUrl;
    // option.connectTimeout = ApiConstant.connectTimeout;
    // option.receiveTimeout= ApiConstant.receiveTimeout;
    return option;
  }
}