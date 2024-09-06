import 'source.dart';
class SourceResponse {
	final String? status;
	final List<Source>? sources;

	const SourceResponse({this.status, this.sources});

	factory SourceResponse.fromJson(Map<String, dynamic> json) {
		return SourceResponse(
			status: json['status']?.toString(),
			sources: (json['sources'] as List<dynamic>?)
						?.map((e) => Source.fromJson(Map<String, dynamic>.from(e)))
						.toList(),
		);
	}
}
