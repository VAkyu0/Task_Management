// ignore_for_file: library_private_types_in_public_api, file_names

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class Iot extends StatefulWidget {
  const Iot({Key? key}) : super(key: key);

  @override
  _IotState createState() => _IotState();
}

class _IotState extends State<Iot> {
  final TextEditingController _exerciseController = TextEditingController();
  List<String> days = []; // List untuk hari
  List<double> exerciseData = []; // List untuk jumlah menit olahraga
  String? selectedDay; // Hari yang dipilih dalam DropdownButton

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grafik Latihan Mingguan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            const Text(
              'Hari dan Durasi Olahraga',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            // Formulir input data
            Row(
              children: [
                Expanded(
                  child: DropdownButton<String>(
                    value: selectedDay,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedDay = newValue;
                      });
                    },
                    items: <String>[
                      'Mon',
                      'Tue',
                      'Wed',
                      'Thu',
                      'Fri',
                      'Sat',
                      'Sun'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                Expanded(
                  child: TextField(
                    controller: _exerciseController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        labelText: 'Durasi Olahraga (menit)'),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    double newExercise =
                        double.tryParse(_exerciseController.text) ?? 0;
                    if (selectedDay != null) {
                      days.add(selectedDay!); // Tambahkan hari
                      exerciseData
                          .add(newExercise); // Tambahkan jumlah menit olahraga
                      setState(() {
                        selectedDay = null; // Reset pilihan hari
                      });
                    }
                    _exerciseController.text = '';
                  },
                  child: const Text('Tambahkan'),
                ),
              ],
            ),
            // Tabel grafik
            Expanded(
              child: ListView(
                children: <Widget>[
                  SizedBox(
                    width: double.infinity,
                    height: 300,
                    child: BarChart(
                      BarChartData(
                        titlesData: FlTitlesData(
                          leftTitles: SideTitles(
                              showTitles: true,
                              reservedSize: 40,
                              getTitles: (value) {
                                return value.toInt().toString();
                              }),
                          bottomTitles: SideTitles(
                            showTitles: true,
                            getTitles: (value) {
                              if (value >= 0 && value < days.length) {
                                return days[value.toInt()];
                              }
                              return '';
                            },
                          ),
                        ),
                        borderData: FlBorderData(show: true),
                        gridData: FlGridData(
                          checkToShowHorizontalLine: (value) => value % 1 == 0,
                        ),
                        barGroups: getBarGroups(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<BarChartGroupData> getBarGroups() {
    return List.generate(exerciseData.length, (index) {
      return BarChartGroupData(x: index, barRods: [
        BarChartRodData(
          y: exerciseData[index],
          colors: [Colors.blue],
        ),
      ]);
    });
  }

  @override
  void dispose() {
    _exerciseController.dispose();
    super.dispose();
  }
}
