import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_route/api/api_manager.dart';
import 'package:news_app_route/ui/home/category_details/cubit/sources_states.dart';

class SourcesViewModel extends Cubit<SourcesStates> {
  SourcesViewModel() : super(SourcesLoadingStates());
// hold data
// handel logic
  int selectedindex = 0;
  void getSources(String categoryId) async {
    emit(SourcesLoadingStates());
    try {
      var response = await ApiManager.getsources(categoryId: categoryId);
      if (response?.status == 'error') {
        // to da : response error
        emit(SourcesErrorStates(errorMessage: response!.message!));
      }
      if (response?.status == 'ok') {
        emit(SourcesSuccessStates(sources: response!.sources!));
      }
    } catch (e) {
      emit(SourcesErrorStates(errorMessage: e.toString()));
    }
  }

  void changeSelectedIndex(int newindex) {
    selectedindex = newindex;
    emit(ChangeIndexStates());
  }
}
