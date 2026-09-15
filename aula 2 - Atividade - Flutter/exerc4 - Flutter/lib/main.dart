import 'package:flutter/material.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text('Insert Image Example'),
        ),
        body: const ImagesScreen(),
      ),
    );
  }
}

class ImagesScreen extends StatelessWidget {
  const ImagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 150,
            child: FittedBox(
              fit: BoxFit.cover,
              child: Image.network(
                'https://picsum.photos/id/1018/600/300',
              ),
            ),
          ),
          const SizedBox(height: 30),
          SizedBox(
            width: double.infinity,
            height: 250,
            child: FittedBox(
              fit: BoxFit.cover,
              child: Image.network(
                'https://picsum.photos/id/1025/600/400',
              ),
            ),
          ),
        ],
      ),
    );
  }
}