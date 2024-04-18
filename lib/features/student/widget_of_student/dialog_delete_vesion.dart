import 'package:flutter/material.dart';

class DeleteConfirmationDialog {
  static void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.red,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          title: Column(
            children: [
              SizedBox(height: 16),
              Center(
                child: Text(
                  "ARE YOU SURE YOU WANT TO DELETE?",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true); // Trả về true khi người dùng chọn "Delete"
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Text(
                    "Delete",
                    style: TextStyle(color: Colors.green),
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false); // Trả về false khi người dùng chọn "Keep"
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Text(
                    "Keep",
                    style: TextStyle(color: Colors.green),
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
