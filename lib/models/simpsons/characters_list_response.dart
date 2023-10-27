import 'package:json_annotation/json_annotation.dart';

import 'character_info.dart';

part 'characters_list_response.g.dart';

@JsonSerializable()
class CharactersListResponse {
  /// The generated code assumes these values exist in JSON.
  final List<CharacterInfo> RelatedTopics;

  CharactersListResponse({required this.RelatedTopics});

  factory CharactersListResponse.fromJson(Map<String, dynamic> json) =>
      _$CharactersListResponseFromJson(json);
}
