import 'package:flutter/material.dart';
import 'NumberAudio.dart';
import 'package:audioplayers/audio_cache.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  AudioCache audioPlayer = AudioCache();

  //array of all the sound objects
  List<NumberAudio> numberList = [
    NumberAudio("one.wav", Colors.red, "One"),
    NumberAudio("two.wav", Colors.blue, "Two"),
    NumberAudio("three.wav", Colors.green, "Three"),
    NumberAudio("four.wav", Colors.pink, "Four"),
    NumberAudio("five.wav", Colors.amber, "Five"),
    NumberAudio("six.wav", Colors.brown, "Six"),
    NumberAudio("seven.wav", Colors.blueGrey, "Seven"),
    NumberAudio("eight.wav", Colors.teal, "Eight"),
    NumberAudio("nine.wav", Colors.purple, "Nine"),
    NumberAudio("ten.wav", Colors.yellow, "Ten"),
  ];

  play(String uri){
    audioPlayer.play(uri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Spanish Number'),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Image(
                image: AssetImage("images/logo.png"),
              ),
              Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.all(10.0),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2.0,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                  ),
                  itemCount: numberList.length,
                  itemBuilder: (context, i) => SizedBox(
                    height: 50.0,
                    width: 100.0,
                    child: RaisedButton(
                      onPressed: () {
                        play(numberList[i].audioUri);
                      },
                      color: numberList[i].buttonColor,
                      child: Text(numberList[i].buttonText,
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}