import '../../../../../model/newsresponse/newsresponse.dart';

abstract class NewsRemoteDataSource {
  Future<Newsresponse?> getNews(String sourceId);
}