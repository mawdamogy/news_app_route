import 'package:flutter/material.dart';
import 'package:news_app_route/api/api_manager.dart';
import 'package:news_app_route/model/newsresponse/article.dart';

class NewsViewModel extends ChangeNotifier {
  // hold data
  // handel logic
  List<Article>? news;
  String? errormessage;
  getnews(String sourceId) async {
    try {
      var response = await ApiManager.getnewsbysourceId(sourceId: sourceId);
      if (response?.status == 'error') {
        errormessage = response?.message;
      } else {
        news = response?.articles;
      }
    } catch (e) {
      errormessage = e.toString();
    }
    notifyListeners();
  }
}
