import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import SystemChrome
import 'splash_screen.dart'; // Import the widget for landscape mode
import 'package:responsive_builder/responsive_builder.dart';

void main() {
  // Lock the orientation to landscape mode
  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Montserrat'),
      home: splash_screen(), // Use the widget for landscape mode
    );
  }
}
