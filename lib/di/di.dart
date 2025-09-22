// news view model ======= news repositry
// news repositry ======= newsremotedatasources
// newsremotedatasources ===== apimanger
//==================================================================================//
// sourses view model ======= sourses repositry
// sources repositry ======= sourcesremotedatasources
// sourcesremotedatasources ===== apimanger
import 'package:news_app_route/api/api_manager.dart';
import 'package:news_app_route/data/Repositry/News/data_sources/remote/impl/news_remote_data_source_impl.dart';
import 'package:news_app_route/data/Repositry/News/data_sources/remote/news_remote_data_source.dart';
import 'package:news_app_route/data/Repositry/News/repositry/impl/news_reposirty_impl.dart';
import 'package:news_app_route/data/Repositry/News/repositry/news_repositry.dart';
import 'package:news_app_route/data/Repositry/Sources/data_sources/remote/impl/sources_remote_data_source_impl.dart';
import 'package:news_app_route/data/Repositry/Sources/data_sources/remote/sources_remote_data_source.dart';
import 'package:news_app_route/data/Repositry/Sources/repositry/impl/sources_repositry_impl.dart';
import 'package:news_app_route/data/Repositry/Sources/repositry/sources_repositry.dart';

NewsRepositry injectNewsRepositry() {
  return NewsReposirtyImpl(newsRemoteDataSource: injectNewsRemoteDataSources());
}

NewsRemoteDataSource injectNewsRemoteDataSources() {
  return NewsRemoteDataSourceImpl(apiManager: injectApimanger());
}

ApiManager injectApimanger() {
  return ApiManager();
}

SourcesRepositry injectSourcesRepositry() {
  return SourcesRepositryImpl(sourcesRemoteDataSource: injectSourcesRemoteDataSources());
}

SourcesRemoteDataSource injectSourcesRemoteDataSources() {
  return SourcesRemoteDataSourceImpl(apiManager: injectApimanger());
}
