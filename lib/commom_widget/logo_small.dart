import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class logo_small extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return  Center(
      child: Container(
        color: Colors.green,
        width: screenSize.width * 0.5,
        height: screenSize.height * 0.1,
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage('assets/background_image.jpg'), // Đường dẫn đến tệp hình ảnh
        //     fit: BoxFit.cover, // Đảm bảo hình ảnh sẽ bao phủ toàn bộ kích thước của Container
        //   ),
        // ),
      ),
    );
  }
}
