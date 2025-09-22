import 'package:news_app_route/api/api_manager.dart';
import 'package:news_app_route/data/Repositry/News/data_sources/remote/news_remote_data_source.dart';
import 'package:news_app_route/model/newsresponse/newsresponse.dart';

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  ApiManager apiManager;
  NewsRemoteDataSourceImpl({required this.apiManager});
  @override
  Future<Newsresponse?> getNews(String sourceId) {
  return  apiManager.getnewsbysourceId(sourceId: sourceId);
  }
}
