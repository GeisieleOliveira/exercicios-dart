import 'package:flutter/material.dart';

void main() => runApp(const StackApp());

class StackApp extends StatelessWidget {
  const StackApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text('Stack & Positioned Widget'),
        ),
        body: const StackScreen(),
      ),
    );
  }
}

class StackScreen extends StatelessWidget {
  const StackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Stack(
        children: [
          Positioned(
            left: 20,
            top: 20,
            child: Container(
              width: 150,
              height: 180,
              padding: const EdgeInsets.all(8),
              color: Colors.green.shade400,
              child: const Text(
                'Green',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          Positioned(
            left: 45,
            top: 45,
            child: Container(
              width: 150,
              height: 180,
              padding: const EdgeInsets.all(8),
              color: Colors.red.shade400,
              child: const Text(
                'Red',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          Positioned(
            left: 70,
            top: 70,
            child: Container(
              width: 150,
              height: 180,
              padding: const EdgeInsets.all(8),
              color: Colors.purple.shade300,
              child: const Text(
                'Purple',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}