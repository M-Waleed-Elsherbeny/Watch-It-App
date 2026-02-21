import 'package:flutter/material.dart';
import 'package:watch_it/watch_it_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Watch It App',
      debugShowCheckedModeBanner: false,
      home: const WatchItView(),
    );
  }
}

