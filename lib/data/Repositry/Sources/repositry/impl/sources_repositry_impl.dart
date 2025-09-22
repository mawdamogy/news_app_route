import 'package:news_app_route/data/Repositry/Sources/data_sources/remote/sources_remote_data_source.dart';
import 'package:news_app_route/data/Repositry/Sources/repositry/sources_repositry.dart';
import 'package:news_app_route/model/sourceresponse/sourceresponse.dart';

class SourcesRepositryImpl implements SourcesRepositry {
  SourcesRemoteDataSource sourcesRemoteDataSource;
  SourcesRepositryImpl({required this.sourcesRemoteDataSource});
  @override
  Future<Sourceresponse?> getSources(String categoryId) {
   return sourcesRemoteDataSource.getSources(categoryId);
  }
}
