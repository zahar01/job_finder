import 'package:flutter/material.dart';

class PositionButton extends StatelessWidget {
  final String positionName;
  final bool positionState;
  final VoidCallback positionTapped;
  final double fontSize; 

  const PositionButton({
    super.key,
    required this.positionName,
    required this.positionState,
    required this.positionTapped,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 22, top: 14),
      child: GestureDetector(
        onTap: positionTapped,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(19),
            color: !positionState ? Colors.grey[200] : Colors.green[100],
          ),
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Text(
              positionName,
              style: TextStyle(
                fontSize: fontSize,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
