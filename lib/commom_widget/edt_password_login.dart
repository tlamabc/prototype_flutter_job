import 'package:flutter/material.dart';

class edt_password_login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size; // Lấy kích thước của màn hình

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      height: screenSize.height * 0.07,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFFF1F1F1)),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          Container(
            width: screenSize.height * 0.07,
            height: double.maxFinite,
            decoration: BoxDecoration(
              color: Color(0xFff1f1f1),
            ),
            child: Icon(Icons.lock_outline_rounded,
                color: Color(0xFFD9D9D9),
                size: screenSize.height * 0.03),
          ),
          Expanded(
            child: TextField(
              obscureText: true,
              style: TextStyle(),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Your password',
                hintStyle: TextStyle(color: Colors.grey, fontSize: screenSize.height * 0.02),
                contentPadding: EdgeInsets.only(left: 15),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
