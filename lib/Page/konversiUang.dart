// ignore_for_file: prefer_const_constructors, file_names, library_private_types_in_public_api

import 'package:flutter/material.dart';

class KonversiUang extends StatefulWidget {
  const KonversiUang({Key? key}) : super(key: key);

  @override
  _KonversiUangState createState() => _KonversiUangState();
}

class _KonversiUangState extends State<KonversiUang> {
  double amount = 0.0;
  double conversionRate = 1.0;
  String selectedCurrency = 'USD';

  Map<String, double> conversionRates = {
    'USD': 1.0,
    'EUR': 0.84,
    'GBP': 0.72,
    'JPY': 110.15,
    'AUD': 1.33,
    'CAD': 1.25,
    'SGD': 1.33,
    'INR': 74.47,
    'CNY': 6.43,
    'IDR': 14211.85,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Container(
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Enter Amount in USD:',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold, // Menggunakan font tebal
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                keyboardType: TextInputType.number,
                onChanged: (String text) {
                  setState(() {
                    amount = double.tryParse(text) ?? 0.0;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Amount',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Select Currency to Convert:',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold, // Menggunakan font tebal
                ),
              ),
              DropdownButton<String>(
                value: selectedCurrency,
                items: conversionRates.keys.map((String currency) {
                  return DropdownMenuItem<String>(
                    value: currency,
                    child: Text(currency),
                  );
                }).toList(),
                onChanged: (String? newCurrency) {
                  setState(() {
                    selectedCurrency = newCurrency ?? 'USD';
                    conversionRate = conversionRates[selectedCurrency]!;
                  });
                },
              ),
              const SizedBox(height: 20),
              Text(
                'Converted Amount:',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold, // Menggunakan font tebal
                ),
              ),
              Text(
                '${(amount * conversionRate).toStringAsFixed(2)} $selectedCurrency',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold, // Menggunakan font tebal
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
