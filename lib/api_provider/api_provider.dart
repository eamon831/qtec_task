import 'dart:io';
import 'dart:convert' show json, utf8;

import 'package:qtec_task/utils/constants.dart';


class ApiProvider{
  static final HttpClient _httpClient = HttpClient();


  Future<List<Map<String,dynamic>>> fetchNewTenVideos({required String page}) async{
    final uri = Uri.parse(BASE_URL+endpoint_trending_videos).replace(
      queryParameters: {
        'page': page,
      },
    );
    final jsonResponse = await _getJson(uri);
    if (jsonResponse == null) {
      return [];
    }
    if (jsonResponse['error'] != null) {
      return [];
    }
    if (jsonResponse['results'] == null) {
      return [];
    }
    return jsonResponse['results'].map<Map<String,dynamic>>((e) => e as Map<String,dynamic>).toList();

  }
  static Future<Map<String, dynamic>?> _getJson(Uri uri) async {
    try {
      _httpClient.badCertificateCallback = ((X509Certificate cert, String host, int port) => true);
      final httpRequest = await _httpClient.getUrl(uri);
      print(httpRequest.uri.toString());
      final httpResponse = await httpRequest.close();
      if (httpResponse.statusCode != HttpStatus.OK) {
        return null;
      }

      final responseBody = await httpResponse.transform(utf8.decoder).join();
      return json.decode(responseBody);
    } on Exception catch (e) {
      print('$e');
      return null;
    }
  }


}