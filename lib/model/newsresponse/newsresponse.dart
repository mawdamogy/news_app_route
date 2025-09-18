import 'article.dart';

class Newsresponse {
  String? status;
  int? totalResults;
  List<Article>? articles;
  String? code;
  String? message;
  Newsresponse(
      {this.status, this.totalResults, this.articles, this.code, this.message});

  factory Newsresponse.fromJson(Map<String, dynamic> json) => Newsresponse(
        status: json['status'] as String?,
        message: json['message'],
        code: json['code'],
        totalResults: json['totalResults'] as int?,
        articles: (json['articles'] as List<dynamic>?)
            ?.map((e) => Article.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'totalResults': totalResults,
        'articles': articles?.map((e) => e.toJson()).toList(),
        'code': code,
        'message': message
      };
}
