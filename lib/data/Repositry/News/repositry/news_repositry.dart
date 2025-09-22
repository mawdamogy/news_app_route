import 'package:news_app_route/model/newsresponse/newsresponse.dart';

abstract class NewsRepositry {
 Future<Newsresponse?> getNews(String sourceId);
}
