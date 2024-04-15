import 'package:flutter/material.dart';

class ExpansionPanelWidget extends StatelessWidget {
  final String title;
  final List<String> vesion;
  final List<DateTime> dateVesion;
  final bool isExpanded;
  final Function(bool isExpanded) onToggle;

  const ExpansionPanelWidget({
    required this.title,
    required this.vesion,
    required this.dateVesion,
    required this.isExpanded,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: vesion.isNotEmpty ? () => onToggle(!isExpanded) : null,
      child: Column(
        children: [
          // Your expansion panel content
        ],
      ),
    );
  }
}
