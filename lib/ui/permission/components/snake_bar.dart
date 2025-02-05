import 'package:flutter/material.dart';

class SnakeBarComponent {
  // static model -> untuk mempertahankan value dari function yg dipanggil
  static void showSnakeBar(BuildContext context, String message, {bool isError = false}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Row(
        children: [
          Icon(
            isError ? Icons.error_outline : Icons.check_circle_outline,
            color: Colors.white,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
      backgroundColor: isError ? Colors.red : Colors.blueGrey,
      shape: const StadiumBorder(),
      behavior: SnackBarBehavior.floating,
    ));
  }
}