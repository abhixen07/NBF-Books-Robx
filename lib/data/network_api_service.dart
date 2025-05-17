import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'app_exception.dart';
import 'base_api_service.dart';

class NetworkApiServices extends BaseApiServices {
  @override
  Future<dynamic> getApi(String url) async {
    debugPrint('Request URL: $url');

    final token = await _getToken();
    debugPrint("Retrieved token: $token");

    final headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    };
    debugPrint('Request Headers: $headers');

    dynamic responseJson;
    try {
      final response = await http
          .get(
            Uri.parse(url),
            headers: headers,
          )
          .timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException('');
    } on TimeoutException {
      throw RequestTimeOutException();
    }
    return responseJson;
  }

  Future<String?> _getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("token");
  }

  @override
  Future<dynamic> postApi(String url, dynamic data) async {
    debugPrint('Request URL: $url');
    debugPrint('Request Data: $data');

    final token = await _getToken();
    debugPrint("Retrieved token: $token");

    final headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    };
    debugPrint('Request Headers: $headers');

    dynamic responseJson;

    try {
      final response = await http
          .post(
            Uri.parse(url),
            headers: headers,
            body: jsonEncode(data),
          )
          .timeout(const Duration(seconds: 100));
      debugPrint('Response Headers: ${response.headers}');
      debugPrint('Response Status Code: ${response.statusCode}');

      /// Check the response content type
      if (response.headers['content-type']?.contains('application/json') ==
          true) {
        responseJson = returnResponse(response);
      } else {
        // For binary responses, encode as Base64 and return
        responseJson = {
          "file": base64Encode(response.bodyBytes),
          "message": "Binary response received",
        };
      }
    } on SocketException {
      throw InternetException('No Internet connection');
    } on TimeoutException {
      throw RequestTimeOutException('Request timed out');
    } catch (e) {
      debugPrint(e.toString());
      throw FetchDataException('An unexpected error occurred: $e');
    }

    return responseJson;
  }

  //
  // @override
  // Future<dynamic> postApi(String url, dynamic data) async {
  //   debugPrint('Request URL: $url');
  //   debugPrint('Request Data: $data');
  //
  //   // final token = await _getToken();
  //   // debugPrint("Retrieved token: $token");
  //
  //   final headers = {
  //     "Content-Type": "application/json",
  //     //"Authorization": "Bearer $token",
  //   };
  //   debugPrint('Request Headers: $headers');
  //
  //   dynamic responseJson;
  //
  //   try {
  //     final response = await http
  //         .post(
  //       Uri.parse(url),
  //       headers: headers,
  //       body: jsonEncode(data),
  //     )
  //         .timeout(const Duration(seconds: 150));
  //     debugPrint('Response Headers: ${response.headers}');
  //     debugPrint('Response Status Code: ${response.statusCode}');
  //
  //     /// Check the response content type
  //     if (response.headers['content-type']?.contains('application/json') == true) {
  //       responseJson = returnResponse(response);
  //     } else {
  //       // For binary responses, encode as Base64 and return
  //       responseJson = {
  //         "file": base64Encode(response.bodyBytes),
  //         "message": "Binary response received",
  //       };
  //     }
  //   } on SocketException catch (e) {
  //     debugPrint('SocketException: ${e.message}');
  //     throw InternetException('No Internet connection: ${e.message}');
  //   }
  //   on TimeoutException {
  //     throw RequestTimeOutException('Request timed out');
  //   } catch (e) {
  //     debugPrint(e.toString());
  //     throw FetchDataException('An unexpected error occurred: $e');
  //   }
  //
  //   return responseJson;
  // }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        return jsonDecode(response.body);
      case 400:
        final responseBody = jsonDecode(response.body);
        final message = responseBody['message'] ?? 'Bad request';
        throw BadRequestException(message);
      case 401:
      case 403:
        final responseBody = jsonDecode(response.body);
        final message = responseBody['message'] ?? 'Unauthorized or Forbidden';
        throw UnauthorizedException(message);
      case 404:
        final responseBody = jsonDecode(response.body);
        final message = responseBody['message'] ?? 'User not found';
        throw FetchDataException(message);
      case 500:
        throw ServerException();
      default:
        throw FetchDataException(
            'Error occurred with status code: ${response.statusCode}');
    }
  }
}
