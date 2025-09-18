import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app_route/api/api_constants.dart';
import 'package:news_app_route/api/endpoints.dart';
import 'package:news_app_route/model/newsresponse/newsresponse.dart';
import 'package:news_app_route/model/sourceresponse/sourceresponse.dart';

class ApiManager {
  static Future<Sourceresponse?> getsources({required String categoryId}) async {
    Uri url = Uri.https(ApiConstants.baseUrl, Endpoints.sourcesendpoint,
        {'apiKey': ApiConstants.apikey,
        'category':categoryId
        });
    try {
      var response = await http.get(url);
      var responsebody = response.body;
      var json = jsonDecode(responsebody);
      return Sourceresponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }
   static Future<Newsresponse?> getnewsbysourceId({required String sourceId}) async {
    Uri url = Uri.https(ApiConstants.baseUrl, Endpoints.newsbysourceendpoint,
        {'apiKey': ApiConstants.apikey,
        'sources' :sourceId
        });
    try {
      var response = await http.get(url);
      var responsebody = response.body;
      var json = jsonDecode(responsebody);
      return Newsresponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }
}
//https://newsapi.org/v2/top-headlines/sources?apiKey=ce1c5194e2fe469991646f3a2d311701
//https://newsapi.org/v2/everything?q=bitcoin&apiKey=ce1c5194e2fe469991646f3a2d311701
