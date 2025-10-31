import 'package:flutter/material.dart';

class edgeInsets extends StatelessWidget {
  const edgeInsets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mantilla_Activity2'),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16), // general padding around body
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Example 1: EdgeInsets.all
            Container(
              padding: const EdgeInsets.all(20),
              color: Colors.amber,
              child: const Text(
                'EdgeInsets.all(20)',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 16),

            // Example 2: EdgeInsets.only
            Container(
              padding: const EdgeInsets.only(left: 40, top: 10),
              color: Colors.lightBlue,
              child: const Text(
                'EdgeInsets.only(left: 40, top: 10)',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 16),

            // Example 3: EdgeInsets.fromLTRB
            Container(
              padding: const EdgeInsets.fromLTRB(10, 20, 30, 40),
              color: Colors.greenAccent,
              child: const Text(
                'EdgeInsets.fromLTRB(10, 20, 30, 40)',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 16),

            // Example 4: EdgeInsets.symmetric
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              color: Colors.pinkAccent,
              child: const Text(
                'EdgeInsets.symmetric(horizontal: 50, vertical: 20)',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
