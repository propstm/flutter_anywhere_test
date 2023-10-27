import 'package:flutter/material.dart';
import 'package:flutter_anywhere_test/repository/simpsons_repository.dart';

import 'character_detail.dart';
import 'models/simpsons/character_info.dart';
import 'models/simpsons/characters_list_response.dart';
import 'network/api_service.dart';

class CharacterList extends StatefulWidget {
  @override
  State<CharacterList> createState() => _CharacterListState();
}

class _CharacterListState extends State<CharacterList> {
  bool buildSideBySide = false;

  Map<String, dynamic> selectedCharacter = {};

  Future<CharactersListResponse> _loadCharacters() async {
    final api = ApiService();
    return await SimpsonsRepository(api: api).getCharacters();
  }

  @override
  Widget build(BuildContext context) {
    if (buildSideBySide) {
      return Row(children: [
        Expanded(child: buildFutureList(context)),
        Expanded(
            child: CharacterDetail(
                selectedCharacter: selectedCharacter, isTablet: true)),
      ]);
    }
    return buildFutureList(context);
  }

  Widget buildFutureList(BuildContext context) {
    return FutureBuilder<CharactersListResponse>(
        future: _loadCharacters(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return buildListOfCharacters(snapshot.data);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }

  bool isPhone(BuildContext context) {
    final shortSideSize = MediaQuery.of(context).size.shortestSide;
    return shortSideSize < 600 ? true : false;
  }

  void pushOrDisplayDetail(
      BuildContext context, String name, String description, String image) {
    print('got to here');

    selectedCharacter = {
      'name': name,
      'description': description,
      'image': image
    };
    //Check shortest side to determine device type
    //source https://stackoverflow.com/questions/49484549/can-we-check-the-device-to-be-smartphone-or-tablet-in-flutter
    if (isPhone(context)) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CharacterDetail(
              selectedCharacter: selectedCharacter,
              isTablet: false,
            ),
          ));
    } else {
      buildSideBySide = true;
      setState(() {});
    }
  }

  String parseCharacterImageUrl(String firstUrl, Map<String, dynamic> iconMap) {
    String urlSuffix = iconMap['URL'];
    if (urlSuffix != '') {
      return 'https://duckduckgo.com' + urlSuffix;
    }
    return 'https://assets-global.website-files.com/633f08923c4c519693723aa5/633f08923c4c514c4b723b19_2516_Anywhere_Logo.png';
  }

  Widget buildListOfCharacters(CharactersListResponse? response) {
    return ListView.builder(
      itemCount: response?.RelatedTopics.length,
      itemBuilder: (context, index) {
        CharacterInfo? currentCharacter = response?.RelatedTopics[index];
        List<String>? characterTextArray = currentCharacter?.Text.split(' - ');
        String characterName = '';
        String characterDescription = '';
        String characterImage = '';
        if (characterTextArray != null && characterTextArray.length > 0) {
          characterName = characterTextArray[0];
          if (characterTextArray.length > 1) {
            characterDescription = characterTextArray[1];
          }
          if (currentCharacter!.Icon['URL'] != '') {
            characterImage = parseCharacterImageUrl(
                currentCharacter!.FirstURL, currentCharacter!.Icon);
          }
        }
        return GestureDetector(
          onTap: () {
            print('test via gesture detector');
          },
          child: ListTile(
              leading: null,
              trailing: const Icon(Icons.arrow_right_sharp),
              title: Text(characterName),
              onTap: () => pushOrDisplayDetail(context, characterName,
                  characterDescription, characterImage)),
        );
      },
    );
  }
}
