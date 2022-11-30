import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio,dioMap;
 // https://waz3ly.net/dashboard/
  //https://wasela.innovations-eg.com/
  //https://dashboard.pngshipping.com/
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: "https://back-end.esh7n-express.com/",
        receiveDataWhenStatusError: true,
      ),
    );
    dioMap=Dio(
      BaseOptions(
        baseUrl: "https://maps.googleapis.com/maps/",
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> postData({
    required String url,
    required String? token,
    required String? accessToken,
    required String? authorization,
    required Map<String, dynamic> data,
  }) {
    dio!.options.headers={
      "token": token ?? "",
      "access_token": accessToken ?? "",
      "Authorization": authorization ?? "",
    };
    return dio!.post(url, data: data);
  }

  static Future<Response> getMapData({
    required String url,
    Map<String, dynamic>? data,

  })
  {


    return  dio!.get(url,queryParameters: data);
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? data,
    required String ? authorization,
  })
  {
    dio!.options.headers={
      "Authorization": authorization ?? "",
    };

    return  dio!.get(url,queryParameters: data);
  }

  static Future<Response> putData({
    required String url,
    required Map<String, dynamic> data,
  }) {
    return dio!.put(url,queryParameters: data);
  }

  static Future<Response> requestData({
    required String url,
    required Map<String, dynamic> data,
  }) {
    return dio!.request(url,queryParameters: data);
  }

  static clearData() {
     dio!.clear();
  }
}
