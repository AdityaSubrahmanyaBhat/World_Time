import 'package:flutter/material.dart';
import 'package:world_time/pages/choose_location.dart';
import 'package:world_time/pages/loading.dart';
import 'package:world_time/pages/home.dart';
import 'package:http/http.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/loading',
    routes: {
      '/home': (context) => Home(),
      '/location': (context) => Location(),
      '/loading': (context) => Loading()
    },
  ));
}
