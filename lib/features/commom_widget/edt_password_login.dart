import 'package:flutter/material.dart';

class edt_password_login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size; 

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      height: screenSize.height * 0.06,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFFF1F1F1)),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          Container(
            width: screenSize.height * 0.06,
            height: double.maxFinite,
            decoration: BoxDecoration(
              color: Color(0xFff1f1f1),
            ),
            child: Icon(Icons.lock_outline_rounded,
                color: Color(0xFFD9D9D9),
                size: screenSize.height * 0.02),
          ),
          Expanded(
              child: TextField(
                 obscureText: true,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Your password',
                isDense: true,
                hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                contentPadding: EdgeInsets.only(left: 15),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
