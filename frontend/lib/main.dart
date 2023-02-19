import 'package:flutter/material.dart';
import 'package:frontend/Screens/screen1.dart';

void main() {
  runApp(MaterialApp(
    routes: {
      '/': (context) => const Screen1(),
    },
  ));
}
