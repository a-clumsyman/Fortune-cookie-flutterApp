// main.dart

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class FortuneCookieScreen extends StatefulWidget {
  @override
  _FortuneCookieScreenState createState() => _FortuneCookieScreenState();
}

class _FortuneCookieScreenState extends State<FortuneCookieScreen> {
  final List<String> fortunes = [
    "You will have a great day!",
    "Good fortune is coming your way.",
    "A pleasant surprise is waiting for you.",
    "The fortune you seek is in another cookie.",
    "You are cleverly disguised as a responsible adult.",
    "Your road to glory will be rocky but fulfilling.",
    "An important person will offer you support.",
    "Any decision you have to make tomorrow is a good decision.",
    "If you look back, you'll soon be going that way!",
    "An inch of time is an inch of gold.",
    "Believe in yourself and others will too.",
    "Accept something that you cannot change, you will feel better.",
    "You will live long enough to open many fortune cookies.",
    "At the touch of love, everyone becomes a poet.",
    "Courage is not the absence of fear, it is the conquest of it.",
    "Better ask twice than lose yourself once.",
    "Any day above ground is a good day.",
    "A foolish man listens to his heart. A wise man listens to cookies.",
    "When chosen for jury duty, tell the judge “fortune cookie say guilty!”",
    "A feather in hand is better than a bird in the air.",
    "An acquaintance of the past will affect you in the near future.",
    "A truly rich life contains love and art in abundance.",
    "Because you demand more from yourself, others respect you deeply.",
    "A lifetime friend shall soon be made.",
    "Curiosity kills boredom. Nothing kills curiosity.",
    "Beauty in its various forms appeals to you.",
    "A soft voice may be awfully persuasive.",
    "Bide your time, for success is near.",
    "Inside every old person is a young person wondering what the hell happened.",
    "A fresh start will put you on your way.",
    "A cynic is only a frustrated optimist.",
    "Dedicate yourself with a calm mind to the task at hand.",
    "Allow compassion to guide your decisions.",
    "Believe it can be done.",
    "Be on the alert to recognize your prime at whatever time of your life it might occur.",
    "A faithful friend is a strong defense.",
    "All things are difficult before they are easy.",
    "Courage is not simply one of the virtues, but the form of every virtue at the testing point.",
    "Be careful or you could fall for some tricks today.",
    "A smooth long journey! Great expectations await.",
    "Depart not from the path that fate has you assigned.",
    "Real kindness comes from within you.",
    "The usefulness of a cup is in its emptiness.",
    "Some days you are the pigeon, some days you are the statue. Today, bring an umbrella.",
    "Success lies in the hands of those who want it.",
    "A fanatic is one who can’t change his mind and won’t change the subject.",
    "A smile is your personal welcome mat.",
    "All your hard work will soon pay off.",
    "A smart husband buys his wife fine china, then she doesn’t trust him to wash it.",
    "Nothing is so much to be feared as fear.",
    "A conclusion is simply the place where you got tired of thinking.",
    "Determination is what you need now.",
    "Carve your name on your heart and not on marble.",

    // Add more fortunes as needed
  ];

  String currentImage = 'assets/UBFC.png';
  String initialImage = 'assets/UBFC.png';

  String displayedFortune = '';
  bool allowGesture = true;
  bool showResetButton = false;

  void toughCookie(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('This looks like a Tough cookie'),
          content: Text('Try Double Tap'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void changeImage() {
    AudioPlayer audioPlayer = AudioPlayer(); // Local variable
    audioPlayer.play('assets/crunch.mp3', isLocal: true);

    setState(() {
      currentImage = 'assets/BFC.png';
      displayedFortune = ''; // Reset displayed fortune when the image changes
      allowGesture = false; // Disable gestures after image change
      showResetButton =
          true; // Show the reset button after the initial double-tap
    });
  }

  void resetImage() {
    setState(() {
      currentImage = initialImage;
      displayedFortune = ''; // Reset displayed fortune when the image resets
      allowGesture = true; // Enable gestures after image reset
      showResetButton = false; // Hide the reset button
    });
  }

  void showFortune() {
    String randomFortune = fortunes[Random().nextInt(fortunes.length)];
    setState(() {
      displayedFortune = randomFortune;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fortune Cookie App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                if (allowGesture) {
                  toughCookie(context);
                }
              },
              onDoubleTap: () {
                if (allowGesture) {
                  changeImage();
                  showFortune();
                }
              },
              child: Stack(
                children: [
                  Image.asset(currentImage),
                  if (displayedFortune.isNotEmpty)
                    Center(
                      child: Text(
                        displayedFortune,
                        style: TextStyle(
                          color: Color.fromARGB(255, 7, 0, 0),
                          fontSize: 14.0,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            SizedBox(height: 20),
            if (showResetButton)
              ElevatedButton(
                onPressed: () {
                  resetImage();
                },
                child: Text('New Cookie'),
              ),
          ],
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FortuneCookieScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

void main() {
  runApp(MyApp());
}
