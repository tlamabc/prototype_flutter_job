import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For date formatting

class Assessment {
  const Assessment({
    required this.title,
    required this.className,
    required this.date,
  });

  final String title;
  final String className;
  final DateTime date;
}

class Assessments extends StatefulWidget {
  const Assessments({Key? key}) : super(key: key);

  @override
  State<Assessments> createState() => _AssessmentsState();
}

class _AssessmentsState extends State<Assessments> {
  List<Assessment> _assessments = [
    Assessment(title: "5D 2024, Term 2", className: "5D", date: DateTime(2024, 5, 2)),
    Assessment(title: "5D 2024, Term 2", className: "5D ", date: DateTime(2024, 5, 2)),
    Assessment(title: "5D 2024, Term 2", className: "5D", date: DateTime(2024, 5, 2)),
    Assessment(title: "5D 2024, Term 2", className: "5D", date: DateTime(2024, 5, 2)),
    // ... add more assessments if needed
  ];

  String _searchText = ""; // For search functionality

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF33A849), // Green color
        title: Text(
          "ASSESSMENTS",
          style: TextStyle(
            color: Colors.white, // White text
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        automaticallyImplyLeading: false, // Remove back button
      ),
      body: Column(
        children: [
          Expanded(
            flex: 4, // Give more space to the search field
            child: TextField(
              decoration: const InputDecoration(
                hintText: "Search by assessment title...",
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.all(16.0),
              ),
              onChanged: (text) {
                setState(() {
                  _searchText = text.toLowerCase(); // Search case-insensitive
                });
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround, // Distribute labels evenly
            children: [
              Text(
                'Title',
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Class',
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Task Date',
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16.0), // Add some spacing below the labels

          // Your existing assessment cards
          for (final assessment in _assessments)
            _assessmentCard(assessment),
        ],
      ),
    );
  }
  Widget _assessmentCard(Assessment assessment) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              flex: 2, // Set the width of the Title column
              child: Text(assessment.title),
            ),
            Expanded(
              flex: 1, // Set the width of the Class column
              child: Text(assessment.className),
            ),
            Expanded(
              flex: 1, // Set the width of the Task Date column
              child: Text(assessment.date.formatDate()),
            ),
          ],
        ),
      ),
    );
  }
}
extension DateTimeExtensions on DateTime {
  String formatDate() {
    final formatter = DateFormat("dd/MM/yyyy");
    return formatter.format(this);
  }
}
