import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

import 'clock.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: kDebugMode, // only show it in debug mode
      builder: (context) => const MyApp(), // your existing app widget
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Activity 1 - Digital Clock',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
          brightness: Brightness.dark,
        ),
      ),
      home: const ClockHomePage(),
    );
  }
}

class ClockHomePage extends StatelessWidget {
  const ClockHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Activity1Clock(),
        ),
      ),
    );
  }
}
