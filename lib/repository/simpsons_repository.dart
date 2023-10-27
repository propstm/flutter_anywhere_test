import 'dart:convert';

import 'package:flutter_anywhere_test/models/simpsons/characters_list_response.dart';
import 'package:flutter_anywhere_test/network/api_service.dart';

class SimpsonsRepository {
  SimpsonsRepository({required this.api});

  ApiService api;

  Future<CharactersListResponse> getCharacters() async {
    final response = await api.get(api.baseAPI);
    final stronglyTypedResponse = CharactersListResponse.fromJson(
        jsonDecode(response.data) as Map<String, dynamic>);
    return stronglyTypedResponse;
  }
}
