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
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Color(0xFFF5F5F5),
          child: Center(
            child: Container(
              width: 350, // Đặt kích thước của container form đăng nhập
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                      color: Color(0xFFECECEC),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        logo_big(),
                        SizedBox(height: 20),
                        logo_small(),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  edt_email_login(),
                  SizedBox(height: 20),
                  edt_password_login(),
                  SizedBox(height: 30),
                  text_reset_password(),
                  SizedBox(height: 20),
                  btn_login(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
