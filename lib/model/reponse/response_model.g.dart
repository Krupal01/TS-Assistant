// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseModel _$ResponseModelFromJson(Map<String, dynamic> json) =>
    ResponseModel(
      id: json['id'] as String,
      object: json['object'] as String,
      created: json['created'] as int,
      model: json['model'] as String,
      usage: Usage.fromJson(json['usage'] as Map<String, dynamic>),
      choices: (json['choices'] as List<dynamic>)
          .map((e) => Choice.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResponseModelToJson(ResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'object': instance.object,
      'created': instance.created,
      'model': instance.model,
      'usage': instance.usage,
      'choices': instance.choices,
    };

Usage _$UsageFromJson(Map<String, dynamic> json) => Usage(
      prompt_tokens: json['prompt_tokens'] as int,
      completion_tokens: json['completion_tokens'] as int,
      total_tokens: json['total_tokens'] as int,
    );

Map<String, dynamic> _$UsageToJson(Usage instance) => <String, dynamic>{
      'prompt_tokens': instance.prompt_tokens,
      'completion_tokens': instance.completion_tokens,
      'total_tokens': instance.total_tokens,
    };

Choice _$ChoiceFromJson(Map<String, dynamic> json) => Choice(
      message: Message.fromJson(json['message'] as Map<String, dynamic>),
      finish_reason: json['finish_reason'] as String,
      index: json['index'] as int,
    );

Map<String, dynamic> _$ChoiceToJson(Choice instance) => <String, dynamic>{
      'message': instance.message,
      'finish_reason': instance.finish_reason,
      'index': instance.index,
    };

Message _$MessageFromJson(Map<String, dynamic> json) => Message(
      role: json['role'] as String,
      content: json['content'] as String,
    );

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'role': instance.role,
      'content': instance.content,
    };
