import 'package:flutter/material.dart';
import 'package:flutter_despicable_me/models/character.dart';
import 'package:flutter_despicable_me/styleguide.dart';

class CharacterDetailScreen extends StatefulWidget {
  final Character character;

  const CharacterDetailScreen({Key key, this.character}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CharacterDetailScreenState();
  }

}

class _CharacterDetailScreenState extends State<CharacterDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery
        .of(context)
        .size
        .height;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Hero(
            tag: "background-${characters[0].name}",
            child: DecoratedBox(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: widget.character.colors,
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft)),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: IconButton(
                    iconSize: 40,
                    icon: Icon(Icons.close),
                    color: Colors.white.withOpacity(0.9),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Hero(
                    tag: "image-{$characters[0].name}",
                    child: Image.asset(
                      widget.character.imagePath, height: screenHeight * 0.45,),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Hero(
                      tag: "name-${characters[0].name}",
                      child: Material(
                        color: Colors.transparent,
                        child: Text(
                          widget.character.name, style: AppTheme.heading,),
                      )
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                  child: Text(
                    widget.character.description, style: AppTheme.subHeading,),
                )
              ],
            ),
          )
          ,
        ],
      ),
    );
  }
}