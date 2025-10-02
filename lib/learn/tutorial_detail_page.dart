import 'package:flutter/material.dart';
import 'learn_hub_page.dart'; // Adjust import path if needed

class TutorialDetailPage extends StatelessWidget {
  final Tutorial tutorial;

  const TutorialDetailPage({super.key, required this.tutorial});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tutorial.title),
        backgroundColor: const Color(0xFF6B73FF),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          "Detailed content for '${tutorial.title}' goes here.\n\n"
          "Category: ${tutorial.category}\n\n"
          "This is an example. Replace with your actual tutorial content.",
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
