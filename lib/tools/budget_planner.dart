import 'package:flutter/material.dart';

class BudgetPlannerPage extends StatefulWidget {
  const BudgetPlannerPage({super.key});

  @override
  State<BudgetPlannerPage> createState() => _BudgetPlannerPageState();
}

class _BudgetPlannerPageState extends State<BudgetPlannerPage> {
  final _incomeController = TextEditingController();
  double? income;
  bool showResult = false;

  Map<String, double> allocations = {
    "Needs (50%)": 0,
    "Wants (30%)": 0,
    "Savings (20%)": 0,
  };

  void calculateBudget() {
    final input = double.tryParse(_incomeController.text);
    if (input == null || input <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid positive income!')),
      );
      return;
    }
    setState(() {
      income = input;
      allocations["Needs (50%)"] = income! * 0.50;
      allocations["Wants (30%)"] = income! * 0.30;
      allocations["Savings (20%)"] = income! * 0.20;
      showResult = true;
    });
  }

  @override
  void dispose() {
    _incomeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Budget Planner"),
        backgroundColor: const Color(0xFF6B73FF),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            TextField(
              controller: _incomeController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: 'Monthly Income',
                prefixText: '₹ ',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculateBudget,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF6B73FF),
                minimumSize: const Size.fromHeight(50),
              ),
              child: const Text(
                'Calculate',
                style: TextStyle(fontSize: 18),
              ),
            ),
            if (showResult) ...[
              const SizedBox(height: 30),
              Text(
                'Budget Allocation',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade700,
                ),
              ),
              const SizedBox(height: 20),
              ...allocations.entries.map((entry) => ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: CircleAvatar(
                      backgroundColor: const Color(0xFF6B73FF),
                      child: Text(
                        entry.key[0],
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    title: Text(entry.key),
                    trailing: Text('₹${entry.value.toStringAsFixed(2)}'),
                  )),
            ]
          ],
        ),
      ),
    );
  }
}
