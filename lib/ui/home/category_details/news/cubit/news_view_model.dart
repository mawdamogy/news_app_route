import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_route/data/Repositry/News/repositry/news_repositry.dart';
import 'package:news_app_route/ui/home/category_details/news/cubit/news_statues.dart';

class NewsViewModel extends Cubit<NewsStatues> {
  NewsRepositry newsRepositry;
  NewsViewModel({required this.newsRepositry}) : super(NewsLoadingStatues());
  // hold data
  // handel logic
  void getNewsbysourceid(String sourceId) async {
    try {
      emit(NewsLoadingStatues());
      var response = await newsRepositry.getNews(sourceId);
      if (response?.status == 'error') {
        emit(NewsErrorrStatues(errorMessage: response!.message!));
      }
      if (response?.status == 'ok') {
        emit(NewsSuccessStatues(news: response!.articles!));
      }
    } catch (e) {
      emit(NewsErrorrStatues(errorMessage: e.toString()));
    }
  }
}
