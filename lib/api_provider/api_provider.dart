import 'dart:io';
import 'dart:convert' show json, utf8;

import 'package:flutter/foundation.dart';
import 'package:qtec_task/model/total_videos.dart';
import 'package:qtec_task/model/video_model.dart';
import 'package:qtec_task/utils/constants.dart';


class ApiProvider{
  static final HttpClient _httpClient = HttpClient();


  Future<List<VideoModel>?> fetchNewVideos({required String page}) async{
    final uri = Uri.parse(BASE_URL+endpoint_trending_videos).replace(
      queryParameters: {
        'page': page,
      },
    );
    final jsonResponse = await _getJson(uri,true);
    if (jsonResponse == null) {
      return null;
    }
    if (jsonResponse['error'] != null) {
      return null;
    }
    if (jsonResponse['results'] == null) {
      return null;
    }
    TotalVideos.fromJson(jsonResponse);
    return jsonResponse['results'].map<VideoModel>((e) => VideoModel.fromJson(e)).toList();

  }
  static Future<Map<String, dynamic>?> _getJson(Uri uri,bool reThrow) async {
    try {
      _httpClient.badCertificateCallback = ((X509Certificate cert, String host, int port) => true);
      final httpRequest = await _httpClient.getUrl(uri);
      if (kDebugMode) {
        print(httpRequest.uri.toString());
      }
      final httpResponse = await httpRequest.close();
      if (httpResponse.statusCode != HttpStatus.OK) {
        return null;
      }

      final responseBody = await httpResponse.transform(utf8.decoder).join();
      return json.decode(responseBody);
    } on Exception catch (e) {
      if(reThrow){
        rethrow;
      }
      print('$e');
      return null;
    }
  }


}