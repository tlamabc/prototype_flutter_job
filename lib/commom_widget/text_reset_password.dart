import 'package:flutter/material.dart';

class text_reset_password extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size; // Lấy kích thước của màn hình

    return GestureDetector(
      onTap: () {
        // Xử lý sự kiện khi container được nhấp
        // Ví dụ: chuyển hướng đến trang khôi phục mật khẩu
      },
      child: Container(
        padding: EdgeInsets.all(screenSize.width * 0.01),
        child: Text(
            "Don't remember your password?",
            textAlign: TextAlign.center, // Căn giữa văn bản
            style: TextStyle(fontSize: screenSize.height * 0.02), // Đặt kích thước chữ theo tỷ lệ của kích thước màn hình
          ),
        ),
    );
  }
}
