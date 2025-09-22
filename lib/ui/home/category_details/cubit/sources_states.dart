import 'package:news_app_route/model/sourceresponse/source.dart';

abstract class SourcesStates {}

class SourcesLoadingStates extends SourcesStates {}

class SourcesSuccessStates extends SourcesStates {
  List<Source> sources;
  SourcesSuccessStates({required this.sources});
}

class SourcesErrorStates extends SourcesStates {
  String errorMessage;
  SourcesErrorStates({required this.errorMessage});
}
