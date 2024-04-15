import 'package:flutter/material.dart';

class StudentCardWidget extends StatelessWidget {
  final String title;
  final String className;
  final String ando;

  const StudentCardWidget({
    required this.title,
    required this.className,
    required this.ando,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle onTap event
      },
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
                      Text(title),
                      Text(ando),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.center,
                  child: Text(className),
                ),
              ),
              // Add other widgets as needed
            ],
          ),
        ),
      ),
    );
  }
}
