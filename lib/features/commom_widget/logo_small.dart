import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class logo_small extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Center(
        child: Container(
          height: 30,
          width: 200,
          color: Colors.green,
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
