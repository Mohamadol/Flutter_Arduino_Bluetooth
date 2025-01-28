import 'package:flutter/material.dart';
import 'bluetooth_app.dart'; // Import the BluetoothApp class

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 58, 85, 183)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'ELEC 391'),
    );
  }
}
