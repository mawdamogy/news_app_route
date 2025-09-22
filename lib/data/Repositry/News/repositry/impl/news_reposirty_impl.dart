import 'package:news_app_route/data/Repositry/News/data_sources/remote/news_remote_data_source.dart';
import 'package:news_app_route/data/Repositry/News/repositry/news_repositry.dart';
import 'package:news_app_route/model/newsresponse/newsresponse.dart';

class NewsReposirtyImpl implements NewsRepositry {
  NewsRemoteDataSource newsRemoteDataSource;
  NewsReposirtyImpl({required this.newsRemoteDataSource});
  @override
  Future<Newsresponse?> getNews(String sourceId) {
   return newsRemoteDataSource.getNews(sourceId);
  }
}
