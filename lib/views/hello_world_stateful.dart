import 'package:flutter/material.dart';

// Task 3: Convert to StatefulWidget with counter button
class HelloWorldStateful extends StatefulWidget {
  const HelloWorldStateful({super.key});

  @override
  State<HelloWorldStateful> createState() => _HelloWorldStatefulState();
}

class _HelloWorldStatefulState extends State<HelloWorldStateful> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello World - Stateful'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Hello World!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              'Counter: $_counter',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _incrementCounter,
              child: const Text('Increment'),
            ),
          ],
        ),
      ),
    );
  }
}
