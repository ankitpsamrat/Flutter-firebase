import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String btnName;

  const CustomButton({
    required this.onPressed,
    required this.btnName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Material(
        elevation: 0,
        borderRadius: BorderRadius.circular(10),
        color: Colors.lightBlue,
        child: MaterialButton(
          padding: const EdgeInsets.all(15),
          minWidth: double.infinity,
          onPressed: onPressed,
          child: Text(
            btnName,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 15,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
