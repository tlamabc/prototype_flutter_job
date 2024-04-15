import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      margin: EdgeInsets.only(bottom: 50),
      height: 50,
      width: MediaQuery.of(context).size.width,
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
              "Student",
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
    );
  }
}
