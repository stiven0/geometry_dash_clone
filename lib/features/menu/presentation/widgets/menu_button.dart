import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {

  final String text;
  final VoidCallback onPressed;
  final Color buttonBackgroundColor;

  const MenuButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.buttonBackgroundColor,
  });

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: 260,
      height: 55,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonBackgroundColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
  
}