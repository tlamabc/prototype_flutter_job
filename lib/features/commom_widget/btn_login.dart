import 'package:flutter/material.dart';

class btn_login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Container(
      height: screenSize.height * 0.09, // Chiều cao 150
      color: Color((0xFF559a2a)), // Màu nền xanh
      child: GestureDetector(
        onTap: () {
          // Xử lý khi container được nhấn
          print('Container được nhấn');
        },
        child: Center(
          child: Container(
            padding: EdgeInsets.all(8),
            // color: Colors.red,
            color: Color((0xFF559a2a)), // Màu nền xanh
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'LOG IN',
                  style: TextStyle(
                    fontSize: screenSize.height * 0.02,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 5),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: screenSize.height * 0.02,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
