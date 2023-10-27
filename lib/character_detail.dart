import 'package:flutter/material.dart';

class CharacterDetail extends StatelessWidget {
  final String name;
  final String description;
  final String imageUrl;

  const CharacterDetail(
      {super.key,
      required this.name,
      required this.description,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(this.name),
        ),
        // body: const Placeholder(),
        body: Padding(
          padding:
              const EdgeInsets.only(top: 12, right: 12, bottom: 8, left: 12),
          child: SingleChildScrollView(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(children: [
                Expanded(
                    child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(description),
                    ],
                  ),
                )),
                const SizedBox(
                  width: 16,
                ),
                buildImage(),
              ]),
            ],
          )),
        ));
  }

  Widget buildImage() {
    print('image url:');
    print(imageUrl);
    return Image.network(
      imageUrl,
      height: 200,
      width: 200,
      fit: BoxFit.fitHeight,
    );
  }
}
