import 'package:flutter/material.dart';

class LearnHubPage extends StatefulWidget {
  const LearnHubPage({super.key});

  @override
  State<LearnHubPage> createState() => _LearnHubPageState();
}

class _LearnHubPageState extends State<LearnHubPage> {
  final List<Tutorial> tutorials = [
    Tutorial(title: 'Budgeting Basics', category: 'Budgeting'),
    Tutorial(title: 'Saving Strategies', category: 'Saving'),
    Tutorial(title: 'Investing 101', category: 'Investment'),
    Tutorial(title: 'Debt Management', category: 'Debt'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Learn Hub'),
        backgroundColor: const Color(0xFF6B73FF),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: tutorials.length,
        itemBuilder: (context, index) {
          final tutorial = tutorials[index];
          return Card(
            child: ListTile(
              title: Text(tutorial.title),
              subtitle: Text(tutorial.category),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Implement tutorial details or video/playback here
              },
            ),
          );
        },
      ),
    );
  }
}

class Tutorial {
  final String title;
  final String category;

  Tutorial({required this.title, required this.category});
}
