// file assessments.dart
import 'package:flutter/material.dart';
import 'package:prototype/features/assessment/widget_of_assessment/assessment_card_widget.dart';
import 'package:prototype/features/assessment/widget_of_assessment/header_widget.dart';
import 'package:prototype/features/assessment/widget_of_assessment/search_bar_widget.dart';
import 'package:prototype/features/student/student_page.dart';

class Assessments extends StatefulWidget {
  const Assessments({Key? key}) : super(key: key);

  @override
  State<Assessments> createState() => _AssessmentsState();
}
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

class _AssessmentsState extends State<Assessments> {
  List<Assessment> _assessments = [
    Assessment(
        title: "5D 2024, Học kỳ 2",
        className: "5D",
        date: DateTime(2024, 5, 2)),
    Assessment(
        title: "5D 2024, Học kỳ 2",
        className: "5D ",
        date: DateTime(2024, 5, 2)),
    Assessment(
        title: "5D 2024, Học kỳ 2",
        className: "5D",
        date: DateTime(2024, 5, 2)),
    Assessment(
        title: "5D 2024, Học kỳ 2",
        className: "5D",
        date: DateTime(2024, 5, 2)),
    // ... thêm các dữ liệu khác nếu cần
  ];

  String _searchText = ""; // Để tìm kiếm chức năng

  @override
  Widget build(BuildContext context) {
    // Lấy kích thước của màn hình
    Size screenSize = MediaQuery.of(context).size;

    // Kiểm tra nếu là máy tính (web)
    bool isWeb = screenSize.width > 600;

    // Thiết lập kích thước cho widget dựa trên điều kiện
    double widgetWidth = isWeb ? 400 : screenSize.width;

    return Scaffold(
      body: Center(
        child: Container(
          height: screenSize.height,
          width: widgetWidth,
          color: Color(0xFFF6F6F6),
          child: SingleChildScrollView(
            child: Column(
              children: [
                HeaderWidget(),
                SearchBarWidget(
                  controller: TextEditingController(),
                  onChanged: (text) {
                    setState(() {
                      _searchText = text.toLowerCase();
                    });
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 24, right: 24, top: 24, bottom: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          margin: EdgeInsets.only(left: 5),
                          child: Text(
                            'Title',
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            'Class',
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            'Task Date',
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Các thẻ đánh giá hiện có của bạn
                for (final assessment in _assessments)
                  AssessmentCardWidget(assessment),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

