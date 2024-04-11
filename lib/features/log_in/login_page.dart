import 'package:flutter/material.dart';
import 'package:prototype/features/commom_widget/btn_login.dart';
import 'package:prototype/features/commom_widget/edt_email_login.dart';
import 'package:prototype/features/commom_widget/edt_password_login.dart';
import 'package:prototype/features/commom_widget/logo_big.dart';
import 'package:prototype/features/commom_widget/logo_small.dart';
import 'package:prototype/features/commom_widget/text_reset_password.dart';

class MyLogin extends StatelessWidget {
  const MyLogin({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size; // Lấy kích thước của màn hình

    return Scaffold(
        body: Container(
          child: Column(
            children: [
              Container(
                height: screenSize.height * 0.45,
                color: Color(0xFFF1F1F1),
                child: Column(
                  children: [
                    SizedBox(height: screenSize.height * 0.1),
                    logo_big(),
                    SizedBox(height: screenSize.height * 0.05),
                    logo_small(),
                    SizedBox(height: screenSize.height * 0.01),
                  ],
                ),
              ),
              SizedBox(height: screenSize.height * 0.05),
              edt_email_login(),
              SizedBox(height: screenSize.height * 0.02),
              edt_password_login(),
              Expanded(child: Container()),
              text_reset_password(),
              SizedBox(height: screenSize.height * 0.05),
              btn_login(),
            ],
          ),
        ));
  }
}
