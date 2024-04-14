import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:prototype/features/students/students_page.dart';

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
                Container(
                  color: Colors.green,
                  margin: EdgeInsets.only(bottom: 50),
                  height: 50,
                  width: widgetWidth,
                  child: Center(
                    child: Text(
                      "ASSESSMENTS",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Container(
                    margin: EdgeInsets.only(bottom: 30),
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.green),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintStyle: TextStyle(
                          color: Colors.green, // Màu xanh lá
                          fontSize: 14.0, // Kích thước chữ nhỏ
                        ),
                        isDense: true,
                        hintText: "Search by assessment title...",
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.search, color: Colors.green),
                      ),
                      onChanged: (text) {
                        setState(() {
                          _searchText = text
                              .toLowerCase(); // Tìm kiếm không phân biệt chữ hoa chữ thường
                        });
                      },
                    ),
                  ),
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
                  _assessmentCard(assessment),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _assessmentCard(Assessment assessment) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => students()),
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
