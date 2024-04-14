import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart'; // Để định dạng ngày tháng

class Students {
  const Students({
    required this.title,
    required this.className,
    required this.date,
    required this.ando,

  });
  final String ando;
  final String title;
  final String className;
  final DateTime date;
}

class students extends StatefulWidget {
  const students({Key? key}) : super(key: key);

  @override
  State<students> createState() => _StudentsState();
}

class _StudentsState extends State<students> {
  List<Students>  _students = [
    Students(title: "5D 2024, Học kỳ 2", className: "5D", date: DateTime(2024, 5, 2), ando: "ANDO345"),
    Students(title: "5D 2024, Học kỳ 2", className: "5D ", date: DateTime(2024, 5, 2),ando: "ANDO345"),
    Students(title: "5D 2024, Học kỳ 2", className: "5D", date: DateTime(2024, 5, 2),ando: "ANDO345"),
    Students(title: "5D 2024, Học kỳ 2", className: "5D", date: DateTime(2024, 5, 2),ando: "ANDO345"),
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
      body:Center(
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
                    child: Stack  (
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
                          fontWeight: FontWeight.w100,// Kích thước chữ nhỏ
                        ),
                        isDense: true,
                        hintText: "Search by assessment title...",
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.search, color: Colors.green),
                      ),
                      onChanged: (text) {
                        setState(() {
                          _searchText = text.toLowerCase(); // Tìm kiếm không phân biệt chữ hoa chữ thường
                        });
                      },
                    ),
                  ),
                ),


                Padding(
                  padding: const EdgeInsets.only(left: 24, right: 24,top: 24,bottom: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded (
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
                // Các thẻ đánh giá hiện có của bạn
                for (final students in _students)
                  _studentsCard(students),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget _studentsCard(Students students) {
    return Card(
      elevation: 4,
      color: Colors.white,
      margin: const EdgeInsets.all(8.0),
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
                      Text(students.title),
                      Text(students.ando),
                    ],
                  )),
            ),
            Expanded(
              flex: 1,
              child: Container(
                  alignment: Alignment.center,
                  child: Text(students.className)),
            ),
            Expanded(
              flex: 1,
              child: Stack(
                children: [
                  ///nếu có dữ liệu véion thì hiện 2 container này lên
                  // Container(
                  //   height: 45,
                  //     alignment: Alignment.center,
                  //     child: Text(
                  ///số vesion sẽ hiển thị vào text này
                  //       '3',
                  //       style: TextStyle(
                  //         fontWeight: FontWeight.bold,
                  //       color: Colors.green,
                  //     ),
                  //     ),
                  //   ),
                  /// ảnh document hiển thị cùng với số vesion
                  // Container(
                  //   alignment: Alignment.center,
                  //   child: Image.asset('assets/img/icons8_document_64.png',height: 45,color: Colors.green,), // Đường dẫn đến hình ảnh
                  // ),
                  Container(
                    alignment: Alignment.center,
                    child: Image.asset('assets/img/icons8_plus_50.png',width: 30,color: Colors.amber,), // Đường dẫn đến hình ảnh
                  ),
                ],
              ),
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
