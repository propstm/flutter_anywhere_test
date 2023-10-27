// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'characters_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharactersListResponse _$CharactersListResponseFromJson(
        Map<String, dynamic> json) =>
    CharactersListResponse(
      RelatedTopics: (json['RelatedTopics'] as List<dynamic>)
          .map((e) => CharacterInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CharactersListResponseToJson(
        CharactersListResponse instance) =>
    <String, dynamic>{
      'RelatedTopics': instance.RelatedTopics,
    };
