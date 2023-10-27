import 'package:json_annotation/json_annotation.dart';

part 'character_info.g.dart';

@JsonSerializable()
class CharacterInfo {
  String FirstURL;
  Map<String, dynamic> Icon;
  String Text;

  CharacterInfo(
      {required this.FirstURL, required this.Icon, required this.Text});

  factory CharacterInfo.fromJson(Map<String, dynamic> json) =>
      _$CharacterInfoFromJson(json);

  @override
  String toString() {
    return 'FirstURL: $FirstURL\nImage: $Text';
  }
}
