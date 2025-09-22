// to do : abstract class repositry
import 'package:news_app_route/model/sourceresponse/sourceresponse.dart';

abstract class SourcesRepositry {
Future<Sourceresponse?>  getSources(String categoryId);
}
