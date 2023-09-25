// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageRequest _$ImageRequestFromJson(Map<String, dynamic> json) => ImageRequest(
      prompt: json['prompt'] as String,
      n: json['n'] as int,
    );

Map<String, dynamic> _$ImageRequestToJson(ImageRequest instance) =>
    <String, dynamic>{
      'prompt': instance.prompt,
      'n': instance.n,
    };
