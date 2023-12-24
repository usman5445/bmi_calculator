import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color childColor;
  final VoidCallback onPress;
  const ReusableCard({
    super.key,
    required this.icon,
    required this.title,
    required this.childColor,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onPress,
        child: Container(
          margin: EdgeInsets.all(15),
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Color(0xFF1D1F33),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 80,
                color: childColor,
              ),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: childColor),
              )
            ],
          ),
        ),
      ),
    );
  }
}
