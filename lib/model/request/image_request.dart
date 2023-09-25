import 'package:json_annotation/json_annotation.dart';

part 'image_request.g.dart';

@JsonSerializable()
class ImageRequest {
  final String prompt;
  final int n;

  ImageRequest({
    required this.prompt,
    required this.n,
  });

  factory ImageRequest.fromJson(Map<String, dynamic> json) =>
      _$ImageRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ImageRequestToJson(this);
}
