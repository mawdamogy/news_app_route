import 'package:news_app_route/model/sourceresponse/sourceresponse.dart';

abstract class SourcesRemoteDataSource {
  Future<Sourceresponse?>  getSources(String categoryId);
}