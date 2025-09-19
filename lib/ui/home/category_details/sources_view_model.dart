import 'package:flutter/material.dart';
import 'package:news_app_route/api/api_manager.dart';
import 'package:news_app_route/model/sourceresponse/source.dart';

class SourcesViewModel extends ChangeNotifier {
  // hold data
  // handel logic
  List<Source>? sources;
  String? errormessage;
  getsources(String categoryId) async {
    // reinitialized
    sources = null;
    errormessage = null;
    try {
      var response = await ApiManager.getsources(categoryId: categoryId);

      ///error
      if (response?.status == 'error') {
        errormessage = response?.message;
      } else {
        // success
        sources = response?.sources;
      }
    } catch (e) {
      errormessage = e.toString();
    }
    notifyListeners();
  }
}
