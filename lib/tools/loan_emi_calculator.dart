import 'dart:math';

import 'package:flutter/material.dart';

class LoanEMICalculatorPage extends StatefulWidget {
  const LoanEMICalculatorPage({super.key});

  @override
  State<LoanEMICalculatorPage> createState() => _LoanEMICalculatorPageState();
}

class _LoanEMICalculatorPageState extends State<LoanEMICalculatorPage> {
  final _principalController = TextEditingController();
  final _rateController = TextEditingController();
  final _tenureController = TextEditingController();

  double? emi;

  void calculateEMI() {
    final principal = double.tryParse(_principalController.text) ?? 0;
    final annualRate = double.tryParse(_rateController.text) ?? 0;
    final tenureYears = double.tryParse(_tenureController.text) ?? 0;

    if (principal <= 0 || annualRate <= 0 || tenureYears <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter valid positive values!')),
      );
      return;
    }

    final monthlyRate = annualRate / 12 / 100;
    final months = tenureYears * 12;

    final numerator = principal * monthlyRate * pow(1 + monthlyRate, months);
    final denominator = pow(1 + monthlyRate, months) - 1;

    final calculatedEMI = numerator / denominator;

    setState(() {
      emi = calculatedEMI;
    });
  }

  @override
  void dispose() {
    _principalController.dispose();
    _rateController.dispose();
    _tenureController.dispose();
    super.dispose();
  }

  Widget _buildInputField({
    required String label,
    required TextEditingController controller,
    String hintText = '',
    TextInputType keyboardType = TextInputType.number,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            )),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Loan EMI Calculator"),
        backgroundColor: const Color(0xFF6B73FF),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            _buildInputField(
                label: "Loan Amount (Principal)",
                controller: _principalController,
                hintText: "Enter loan amount (₹)"),
            const SizedBox(height: 16),
            _buildInputField(
              label: "Annual Interest Rate (%)",
              controller: _rateController,
              hintText: "Enter interest rate",
            ),
            const SizedBox(height: 16),
            _buildInputField(
              label: "Loan Tenure (Years)",
              controller: _tenureController,
              hintText: "Enter tenure in years",
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: calculateEMI,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6B73FF),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text(
                  "Calculate EMI",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            if (emi != null) ...[
              const SizedBox(height: 32),
              Text(
                "Estimated EMI: ₹${emi!.toStringAsFixed(2)}",
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Color(0xFF6B73FF)),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
