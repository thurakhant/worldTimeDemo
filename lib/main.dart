import 'package:flutter/material.dart';
import 'package:world_time_demo/pages/choose_location.dart';
import 'package:world_time_demo/pages/home.dart';
import 'package:world_time_demo/pages/loading.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => const Loading(),
      '/home': (context) => const Home(),
      '/location': (context) => const ChooseLocation(),
    },
  ));
}
