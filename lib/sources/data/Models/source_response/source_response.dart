import 'source.dart';
class SourceResponse {
  String? status;
  List<Source>? sources;

  SourceResponse({this.status, this.sources});

  factory SourceResponse.fromJson(Map<String, dynamic> json) => SourceResponse(
        status: json['status']?.toString(),
        sources: (json['sources'] as List<dynamic>?)
            ?.map((e) => Source.fromJson(Map<String, dynamic>.from(e)))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        if (status != null) 'status': status,
        if (sources != null)
          'sources': sources?.map((e) => e.toJson()).toList(),
      };
}
