import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:prototype/features/student/widget_of_student/header_widget.dart';
import 'package:prototype/features/student/widget_of_student/search_bar_widget.dart';

import '../scan_document/scanDocument.dart';

class Student {
  Student({
    required this.title,
    required this.className,
    required this.date,
    required this.ando,
    required this.vesion,
    required this.dateVesion,
    this.isExpanded = false,
  });

  final String ando;
  final String title;
  final String className;
  final DateTime date;
  final List<String> vesion;
  final List<DateTime> dateVesion;
  bool isExpanded;
}

class StudentPage extends StatefulWidget {
  const StudentPage({Key? key}) : super(key: key);

  @override
  State<StudentPage> createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {
  String _searchText = "";

  // Define your list of Student objects here
  List<Student> _students = [
    Student(
      title: "5D 2024, Học kỳ 2",
      className: "5D",
      date: DateTime(2024, 5, 2),
      ando: "ANDO345",
      vesion: ["vesion 1", "vesion 2"],
      dateVesion: [DateTime(2024, 04, 14), DateTime(2024, 05, 02)],
    ),
    Student(
      title: "5D 2024, Học kỳ 2",
      className: "5D ",
      date: DateTime(2024, 5, 2),
      ando: "ANDO345",
      vesion: [],
      dateVesion: [],
    ),
    Student(
      title: "5D 2024, Học kỳ 2",
      className: "5D",
      date: DateTime(2024, 5, 2),
      ando: "ANDO345",
      vesion: ["vesion 1"],
      dateVesion: [DateTime(2024, 04, 14)],
    ),
    Student(
      title: "5D 2024, Học kỳ 2",
      className: "5D",
      date: DateTime(2024, 5, 2),
      ando: "ANDO345",
      vesion: ["vesion 1 ", "vesion 2", "vesion 3"],
      dateVesion: [
        DateTime(2024, 05, 02),
        DateTime(2024, 05, 02),
        DateTime(2024, 05, 02)
      ],
    ),
    // Add more Student objects as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Color(0xFFF6F6F6),
          child: SingleChildScrollView(
            child: Column(
              children: [
                HeaderWidget(),
                SearchBarWidget(
                  onChanged: (text) {
                    setState(() {
                      _searchText = text.toLowerCase();
                    });
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 16, right: 16, top: 0, bottom: 0),
                  child: Column(
                    children: _students.map<Widget>((student) {
                      return MyCustomExpansionPanel(
                        title: student.title,
                        ando: student.ando,
                        className: student.className,
                        vesion: student.vesion,
                        dateVesion: student.dateVesion,
                        isExpanded: student.isExpanded,
                        onToggle: (bool isExpanded) {
                          setState(() {
                            student.isExpanded = isExpanded;
                          });
                        },
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyCustomExpansionPanel extends StatefulWidget {
  final String title;
  final String className;
  final String ando;
  final List<String> vesion;
  final List<DateTime> dateVesion;
  final bool isExpanded;
  final Function(bool isExpanded) onToggle;

  const MyCustomExpansionPanel({
    required this.title,
    required this.className,
    required this.ando,
    required this.vesion,
    required this.dateVesion,
    required this.isExpanded,
    required this.onToggle,
    Key? key,
  }) : super(key: key);

  @override
  _MyCustomExpansionPanelState createState() => _MyCustomExpansionPanelState();
}

class _MyCustomExpansionPanelState extends State<MyCustomExpansionPanel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          GestureDetector(
            onTap: widget.vesion.isNotEmpty
                ? () {
              widget.onToggle(!widget.isExpanded);
            }
                : null, // Nếu vesion rỗng, không cho phép nhấp vào
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              margin: const EdgeInsets.only(top: 16),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.title),
                            Text(widget.ando),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(widget.className),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Stack(
                        children: [
                          if (widget.vesion.isNotEmpty) // Kiểm tra nếu có ít nhất 1 phiên bản
                            Container(
                              height: 45,
                              alignment: Alignment.center,
                              child: Text(
                                '${widget.vesion.length}', // Hiển thị số
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                ),
                              ),
                            ),
                          if (widget.vesion.isEmpty) // Kiểm tra nếu không có phiên bản
                            Container(
                              alignment: Alignment.center,
                              child: Image.asset(
                                'assets/img/icons8_plus_50.png',
                                width: 30,
                                color: Colors.amber,
                              ),
                            ),
                          if (widget.vesion.isNotEmpty) // Kiểm tra nếu có ít nhất 1 phiên bản
                            Container(
                              alignment: Alignment.center,
                              child: Image.asset(
                                'assets/img/icons8_document_64.png',
                                height: 45,
                                color: Colors.green,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (widget.isExpanded) /// item giao diện khi click
            Container(
              margin: EdgeInsets.only(top: 3),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
                color: Colors.white, // Đặt màu nền của container
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Container(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: widget.vesion.length,
                          itemBuilder: (BuildContext context, int index) {
                            String vesion = widget.vesion[index];
                            DateTime dateTime = widget.dateVesion[index];
                            return Container(
                              child: Row(
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.delete_outline_outlined, size: 18, color: Colors.red,),
                                    onPressed: () {
                                      // Xử lý xóa phiên bản ở đây
                                    },
                                  ),
                                  Text(vesion, style: TextStyle(color: Colors.green)),
                                  SizedBox(width: 10), // Khoảng cách giữa icon xóa và văn bản
                                  Text(DateFormat('yyyy MM dd').format(dateTime),style: TextStyle(color: Colors.green)),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),

                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          ScanDocument();
                         },
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Image.asset(
                            'assets/img/icons8_plus_50.png',
                            width: 30,
                            color: Colors.amber,
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
