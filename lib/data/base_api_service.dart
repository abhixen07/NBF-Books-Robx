import 'dart:io';

abstract class BaseApiServices {


  Future<dynamic> postApi(String url, dynamic data);
  Future<dynamic> getApi(String   url);





}