import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class edt_email_login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    final double fontSize = screenSize.height * 0.04;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      height: screenSize.height * 0.07,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFFF1F1F1)),
      ),
      child: Row(
        children: [
          Container(
            width: screenSize.height * 0.07,
            height: double.maxFinite,
            decoration: BoxDecoration(
              color: Color(0xFff1f1f1), // Màu nền cho Container
            ),
            child: Icon(Icons.credit_card, color: Color(0xFFD9D9D9), size: screenSize.height * 0.03),
          ),
          Expanded(
            child: TextField(
              style: TextStyle(
                fontSize: screenSize.height * 0.02,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Yours@.example.com',
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
