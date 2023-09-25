import 'package:json_annotation/json_annotation.dart';

part 'response_model.g.dart';

@JsonSerializable()
class ResponseModel {
  final String id;
  final String object;
  final int created;
  final String model;
  final Usage usage;
  final List<Choice> choices;

  ResponseModel({
    required this.id,
    required this.object,
    required this.created,
    required this.model,
    required this.usage,
    required this.choices,
  });

  factory ResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseModelToJson(this);
}

@JsonSerializable()
class Usage {
  final int prompt_tokens;
  final int completion_tokens;
  final int total_tokens;

  Usage({
    required this.prompt_tokens,
    required this.completion_tokens,
    required this.total_tokens,
  });

  factory Usage.fromJson(Map<String, dynamic> json) => _$UsageFromJson(json);

  Map<String, dynamic> toJson() => _$UsageToJson(this);
}

@JsonSerializable()
class Choice {
  final Message message;
  final String finish_reason;
  final int index;

  Choice({
    required this.message,
    required this.finish_reason,
    required this.index,
  });

  factory Choice.fromJson(Map<String, dynamic> json) => _$ChoiceFromJson(json);

  Map<String, dynamic> toJson() => _$ChoiceToJson(this);
}

@JsonSerializable()
class Message {
  final String role;
  final String content;

  Message({
    required this.role,
    required this.content,
  });

  factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);

  Map<String, dynamic> toJson() => _$MessageToJson(this);
}
