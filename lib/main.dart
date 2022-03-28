

// This Api IS wihout Any Model Is made by json to dart and this model
// is made by me in local class hardcorded.

import 'package:api_app_2/apicallingpage/apicalling.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ApiCallingPage(),
    );
  }
}
