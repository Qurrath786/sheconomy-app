import 'dart:math';
import 'package:flutter/material.dart';

class SipCalculatorPage extends StatefulWidget {
  const SipCalculatorPage({super.key});

  @override
  State<SipCalculatorPage> createState() => _SipCalculatorPageState();
}

class _SipCalculatorPageState extends State<SipCalculatorPage> {
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _rateController = TextEditingController();
  final TextEditingController _yearsController = TextEditingController();

  double? maturityValue;

  void calculateSIP() {
    final double p = double.tryParse(_amountController.text) ?? 0;
    final ratePercent = double.tryParse(_rateController.text) ?? 0;
    final int years = int.tryParse(_yearsController.text) ?? 0;

    if (p <= 0 || ratePercent <= 0 || years <= 0) {
      setState(() {
        maturityValue = null;
      });
      return;
    }

    // Monthly rate as decimal
    final double r = ratePercent / 12 / 100;
    final int n = years * 12;

    // SIP future value formula: FV = p * [ ( (1 + r)^n - 1 ) / r ] * (1 + r)
    final double fv = p * ((pow(1 + r, n) - 1) / r) * (1 + r);

    setState(() {
      maturityValue = fv;
    });
  }

  @override
  void dispose() {
    _amountController.dispose();
    _rateController.dispose();
    _yearsController.dispose();
    super.dispose();
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String label,
    String hint = '',
    TextInputType keyboardType = TextInputType.number,
    String prefixText = '',
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
            hintText: hint,
            prefixText: prefixText,
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
        title: const Text("SIP Calculator"),
        backgroundColor: const Color(0xFF6B73FF),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildInputField(
                controller: _amountController,
                label: "Monthly SIP Amount",
                hint: "Enter amount",
                prefixText: "₹ ",
              ),
              const SizedBox(height: 16),
              _buildInputField(
                controller: _rateController,
                label: "Expected Annual Rate of Return (%)",
                hint: "For example: 12",
              ),
              const SizedBox(height: 16),
              _buildInputField(
                controller: _yearsController,
                label: "Investment Duration (Years)",
                hint: "Enter years",
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6B73FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: calculateSIP,
                  child: const Text(
                    "Calculate",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              if (maturityValue != null)
                Column(
                  children: [
                    const Text(
                      "Estimated Maturity Value",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "₹${maturityValue!.toStringAsFixed(2)}",
                      style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF6B73FF)),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
