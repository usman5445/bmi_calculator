import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({
    super.key,
    required this.title,
    required this.onPressed,
  });
  final String title;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Container(
        width: double.infinity,
        height: AppBarTheme.of(context).toolbarHeight ?? kToolbarHeight,
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(
            fontSize: 25,
          ),
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}
