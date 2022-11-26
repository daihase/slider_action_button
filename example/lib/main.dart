import 'package:flutter/material.dart';
import 'package:slider_action_button/slider_action_button.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainApp(),
    );
  }
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final sliderKey = GlobalObjectKey<SliderActionButtonState>(context);
    final reset = () {
      sliderKey.currentState?.reset();
    };

    return Scaffold(
      body: Center(
        child: SliderActionButton(
          key: sliderKey,
          icon: Icon(
            Icons.chevron_right,
          ),
          label: Text(
            'Slide to play',
          ),
          action: () {
            // do something...
          },
          height: 48,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          sliderColor: Colors.white,
          sliderDoneColor: Color(0xFFBBDEFB),
          iconColor: Colors.blue,
          padding: 4,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: reset,
        tooltip: 'reset',
        child: Icon(Icons.undo),
      ),
    );
  }
}
