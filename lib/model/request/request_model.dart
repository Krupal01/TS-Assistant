import 'package:json_annotation/json_annotation.dart';

part 'request_model.g.dart';

@JsonSerializable(explicitToJson: true)
class RequestModel {
  final String model;
  final List<Message> messages;

  RequestModel({
    required this.model,
    required this.messages,
  });

  factory RequestModel.fromJson(Map<String, dynamic> json) =>
      _$RequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$RequestModelToJson(this);

  /*Map<String, dynamic> _$RequestModelToJson(RequestModel instance) =>
      <String, dynamic>{
        'model': this.model,
        'messages': this.messages.map((e) => e.toJson()),
      };*/
}

@JsonSerializable()
class Message {
  final String role;
  final String content;

  Message({
    required this.role,
    required this.content,
  });

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);

  Map<String, dynamic> toJson() => _$MessageToJson(this);
}
