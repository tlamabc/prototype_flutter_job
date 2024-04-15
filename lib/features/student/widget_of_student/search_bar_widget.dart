
import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  final Function(String) onChanged;

  const SearchBarWidget({required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Container(
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.only(bottom: 30),
        height: 35,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.green),
        ),
        child: TextField(
          decoration: InputDecoration(
            hintStyle: TextStyle(
              color: Colors.green.withOpacity(0.6),
              fontWeight: FontWeight.w100,
            ),
            isDense: true,
            hintText: "Search by assessment title...",
            border: InputBorder.none,
            prefixIcon: Icon(Icons.search, color: Colors.green),
          ),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
