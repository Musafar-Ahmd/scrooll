import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  late FixedExtentScrollController _dateController;
  final int totalDays = 365;
  late DateTime startDate;

  @override
  void initState() {
    super.initState();
    startDate = DateTime.now();
    _dateController = FixedExtentScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Calendar",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_forward),
        onPressed: () {
          final nextIndex = _dateController.selectedItem + 1;
          if (nextIndex < totalDays) {
            _dateController.animateToItem(
              nextIndex,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          }
        },
      ),
      body: Column(
        children: [
          Expanded(
            child: ListWheelScrollView.useDelegate(
              controller: _dateController,
              itemExtent: 120,
              physics: const FixedExtentScrollPhysics(),
              perspective: 0.003,
              diameterRatio: 2.5,
              childDelegate: ListWheelChildBuilderDelegate(
                childCount: totalDays,
                builder: (context, index) {
                  DateTime date = startDate.add(Duration(days: index));
                  return _buildDateCard(date);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateCard(DateTime date) {
    final String day = DateFormat('EEEE').format(date);
    final String monthDay = DateFormat('MMM d, yyyy').format(date);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Material(
        elevation: 6,
        borderRadius: BorderRadius.circular(20),
        shadowColor: Colors.black26,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                day,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                monthDay,
                style: const TextStyle(fontSize: 16, color: Colors.deepPurple),
              ),
              const SizedBox(height: 8),
              const Text(
                'Tap to select',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
