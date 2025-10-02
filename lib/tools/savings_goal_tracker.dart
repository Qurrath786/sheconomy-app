import 'package:flutter/material.dart';

class SavingsGoalTrackerPage extends StatefulWidget {
  const SavingsGoalTrackerPage({super.key});

  @override
  State<SavingsGoalTrackerPage> createState() => _SavingsGoalTrackerPageState();
}

class _SavingsGoalTrackerPageState extends State<SavingsGoalTrackerPage> {
  final _goalAmountController = TextEditingController();
  final _savedAmountController = TextEditingController();
  final _targetDateController = TextEditingController();

  double? goalAmount;
  double? savedAmount;
  DateTime? targetDate;

  bool showResult = false;

  @override
  void dispose() {
    _goalAmountController.dispose();
    _savedAmountController.dispose();
    _targetDateController.dispose();
    super.dispose();
  }

  void _pickTargetDate() async {
    DateTime initialDate = DateTime.now().add(const Duration(days: 1));
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 10),
    );
    if (picked != null) {
      setState(() {
        targetDate = picked;
        _targetDateController.text =
            "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  void calculateProgress() {
    final goal = double.tryParse(_goalAmountController.text);
    final saved = double.tryParse(_savedAmountController.text);

    if (goal == null || goal <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter a valid goal amount!")),
      );
      return;
    }
    if (saved == null || saved < 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter a valid saved amount!")),
      );
      return;
    }
    if (targetDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please select a target date!")),
      );
      return;
    }
    if (saved > goal) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text("Saved amount cannot exceed goal amount!")),
      );
      return;
    }
    setState(() {
      goalAmount = goal;
      savedAmount = saved;
      showResult = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    double progress = 0;
    int daysLeft = 0;

    if (goalAmount != null && savedAmount != null && targetDate != null) {
      progress = (savedAmount! / goalAmount!).clamp(0, 1);
      daysLeft = targetDate!.difference(DateTime.now()).inDays;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Savings Goal Tracker"),
        backgroundColor: const Color(0xFF6B73FF),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            TextField(
              controller: _goalAmountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Goal Amount (₹)",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _savedAmountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Already Saved (₹)",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _targetDateController,
              readOnly: true,
              decoration: const InputDecoration(
                labelText: "Target Date",
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.calendar_today),
              ),
              onTap: _pickTargetDate,
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: calculateProgress,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6B73FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  "Calculate Progress",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            const SizedBox(height: 30),
            if (showResult) ...[
              Text(
                "You have saved ₹${savedAmount!.toStringAsFixed(2)} of your ₹${goalAmount!.toStringAsFixed(2)} goal.",
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 15),
              LinearProgressIndicator(
                value: progress,
                minHeight: 15,
                backgroundColor: Colors.grey[300],
                valueColor:
                    AlwaysStoppedAnimation<Color>(const Color(0xFF6B73FF)),
              ),
              const SizedBox(height: 15),
              Text(
                progress == 1.0
                    ? "Goal reached! 🎉"
                    : "$daysLeft day${daysLeft != 1 ? 's' : ''} left to reach your goal.",
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
