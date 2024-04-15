import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:prototype/features/student/student_page.dart';

import '../assessment_page.dart';

class AssessmentCardWidget extends StatelessWidget {
  final Assessment assessment;

  AssessmentCardWidget(this.assessment);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => StudentPage()),
        );
      },
      child: Card(
        elevation: 4,
        color: Colors.white,
        margin: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(child: Text(assessment.title)),
              ),
              Expanded(
                flex: 1,
                child: Container(
                    alignment: Alignment.center,
                    child: Text(assessment.className)),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.center,
                  child: Text(assessment.date.formatDateFromAssessment()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
extension DateTimeExtensions on DateTime {
  String formatDateFromAssessment() {
    final formatter = DateFormat("dd/MM/yyyy");
    return formatter.format(this);
  }
}