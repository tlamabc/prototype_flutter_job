import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class Students {
  Students({
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

class StudentsPage extends StatefulWidget {
  const StudentsPage({Key? key}) : super(key: key);

  @override
  State<StudentsPage> createState() => _StudentsPageState();
}

class _StudentsPageState extends State<StudentsPage> {
  List<Students> _students = [
    Students(title: "5D 2024, Học kỳ 2", className: "5D", date: DateTime(2024, 5, 2), ando: "ANDO345", vesion: ["vesion 1", "vesion 2"],dateVesion: [DateTime(2024,04, 14),DateTime(2024, 05, 02)]),
    Students(title: "5D 2024, Học kỳ 2", className: "5D ", date: DateTime(2024, 5, 2), ando: "ANDO345", vesion: [],dateVesion: []),
    Students(title: "5D 2024, Học kỳ 2", className: "5D", date: DateTime(2024, 5, 2), ando: "ANDO345", vesion: ["vesion 1"],dateVesion: [DateTime(2024,04, 14),]),
    Students(title: "5D 2024, Học kỳ 2", className: "5D", date: DateTime(2024, 5, 2), ando: "ANDO345", vesion: ["vesion 1 ", "vesion 2","vesion 3"],dateVesion: [DateTime(2024, 05, 02),DateTime(2024, 05, 02),DateTime(2024, 05, 02)]),
    // ... thêm các dữ liệu khác nếu cần
  ];

  String _searchText = "";

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    bool isWeb = screenSize.width > 600;
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
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                          icon: Icon(Icons.arrow_back_ios_outlined),
                          color: Colors.white,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "STUDENTS",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(bottom: 30),
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.green),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintStyle: TextStyle(
                          color: Colors.green.withOpacity(0.6),
                          fontWeight: FontWeight.w100,
                        ),
                        isDense: true,
                        hintText: "Search by assessment title...",
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.search, color: Colors.green),
                      ),
                      onChanged: (text) {
                        setState(() {
                          _searchText = text.toLowerCase();
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
                            'Student',
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
                            'Upload',
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
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 0, bottom: 0),
                  child: Column(
                    children: _students.map<Widget>((Students student) {
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
            onTap: widget.vesion.isNotEmpty ? () {
              widget.onToggle(!widget.isExpanded);
            } : null,// Nếu vesion rỗng, không cho phép nhấp vào
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
          if (widget.isExpanded)  /// item giao diện khi click
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
                padding: const EdgeInsets.symmetric(horizontal:10 ),
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
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Image.asset(
                          'assets/img/icons8_plus_50.png',
                          width: 30,
                          color: Colors.amber,
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
