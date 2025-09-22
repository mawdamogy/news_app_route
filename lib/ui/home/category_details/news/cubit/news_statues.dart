import 'package:news_app_route/model/newsresponse/article.dart';

abstract class NewsStatues {}

class NewsLoadingStatues extends NewsStatues {}

class NewsSuccessStatues extends NewsStatues {
  List<Article> news;
  NewsSuccessStatues({required this.news});
}

class NewsErrorrStatues extends NewsStatues {
  String errorMessage;
  NewsErrorrStatues({required this.errorMessage});
}
