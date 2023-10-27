// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterInfo _$CharacterInfoFromJson(Map<String, dynamic> json) =>
    CharacterInfo(
      FirstURL: json['FirstURL'] as String,
      Icon: json['Icon'] as Map<String, dynamic>,
      Text: json['Text'] as String,
    );

Map<String, dynamic> _$CharacterInfoToJson(CharacterInfo instance) =>
    <String, dynamic>{
      'FirstURL': instance.FirstURL,
      'Icon': instance.Icon,
      'Text': instance.Text,
    };
