import 'package:flutter/material.dart';

class CharacterDetail extends StatelessWidget {
  final Map<String, dynamic> selectedCharacter;
  final bool isTablet;

  const CharacterDetail(
      {super.key, required this.selectedCharacter, required this.isTablet});

  @override
  Widget build(BuildContext context) {
    if (isTablet) {
      return buildDetailContent();
    }
    return Scaffold(
        appBar: AppBar(
          title: Text(this.selectedCharacter['name']),
        ),
        // body: const Placeholder(),
        body: buildDetailContent());
  }

  Widget buildDetailContent() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 12, right: 12, bottom: 8, left: 12),
        child: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                      child: Column(
                    children: [
                      if (isTablet)
                        Text(selectedCharacter['name'],
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 12,
                      ),
                      Text(selectedCharacter['description'])
                    ],
                  )),
                  const SizedBox(
                    width: 16,
                  ),
                  buildImage(),
                ]),
          ],
        )),
      ),
    );
  }

  Widget buildImage() {
    return Image.network(
      selectedCharacter['image'],
      fit: BoxFit.fitWidth,
      height: 150,
      width: 150,
    );
  }
}
