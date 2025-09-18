import 'source.dart';

class Sourceresponse {
  String? status;
  List<Source>? sources;
  String? code;
  String? message;
  Sourceresponse({this.status, this.sources, this.code, this.message});

  factory Sourceresponse.fromJson(Map<String, dynamic> json) {
    return Sourceresponse(
      status: json['status'] as String?,
      code: json['code'],
      message: json['message'],
      sources: (json['sources'] as List<dynamic>?)
          ?.map((e) => Source.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'code': code,
        'message': message,
        'sources': sources?.map((e) => e.toJson()).toList(),
      };
}
