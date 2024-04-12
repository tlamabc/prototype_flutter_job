import 'package:flutter/material.dart';

class btn_login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return OutlinedButton(
      onPressed: () {
        // Xử lý khi nút được nhấn
        print('Container được nhấn');
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF559A2A)),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          EdgeInsets.symmetric(vertical: screenSize.height * 0.035, horizontal: screenSize.width * 0),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
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
    );
  }
}
