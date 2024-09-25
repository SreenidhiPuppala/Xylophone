import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(Xylophone());
}

class Xylophone extends StatelessWidget {
  //var soundNum;
  var color;
  void playSound(int soundNum) {
    final player = AudioPlayer();
    player.play(AssetSource("note$soundNum.wav"));
  }

  Expanded buildKey(
      {required Color color, required int soundNum, required double len}) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(5),
        width: len,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(50),
        ),
        child: TextButton(
          onPressed: () {
            playSound(soundNum);
          },
          child: Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween, // Space circles apart
            children: [
              // Left Circle
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: CircleAvatar(
                  radius: 15,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: CircleAvatar(
                  radius: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
         centerTitle: true,
          title: Text('Xylophone'),
          backgroundColor: Colors.blueGrey[900],
          foregroundColor: Colors.white,
        ),
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            children: <Widget>[
              buildKey(color: Colors.redAccent, soundNum: 1, len: 400),
              buildKey(color: Colors.orangeAccent, soundNum: 2, len: 370),
              buildKey(color: Colors.yellowAccent, soundNum: 3, len: 340),
              buildKey(color: Colors.greenAccent, soundNum: 4, len: 310),
              buildKey(color: Colors.blueAccent, soundNum: 5, len: 280),
              buildKey(color: Colors.indigoAccent, soundNum: 6, len: 250),
              buildKey(color: Colors.purpleAccent, soundNum: 7, len: 220),
            ],
          ),
        ),
      ),
    );
  }
}
