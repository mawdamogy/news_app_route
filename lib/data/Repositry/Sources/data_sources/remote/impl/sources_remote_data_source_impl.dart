import 'package:news_app_route/api/api_manager.dart';
import 'package:news_app_route/data/Repositry/Sources/data_sources/remote/sources_remote_data_source.dart';
import 'package:news_app_route/model/sourceresponse/sourceresponse.dart';

class SourcesRemoteDataSourceImpl implements SourcesRemoteDataSource {
  ApiManager apiManager;
  SourcesRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Sourceresponse?> getSources(String categoryId) async {
    var response = await apiManager.getsources(categoryId: categoryId);
    return response;
  }
}
