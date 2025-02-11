import 'package:attendance_app/ui/permission/components/snake_bar.dart';
import 'package:flutter/material.dart';

class ErrorHandle {
  static void handleError(BuildContext context, dynamic error) {
    if (error is PermissionDeniedException) {
      SnakeBarComponent.showSnakeBar(
        context, 
        "Permission Denied",
        isError: true,
      );
    } else {
      SnakeBarComponent.showSnakeBar(
        context, 
        error,
        isError: true
      );
    }
    Navigator.of(context).pop();
  }
}

class PermissionDeniedException implements Exception {
  final String message;
  // proses pembuatan placeholder dari sebuah exception/error
  PermissionDeniedException([this.message = '']);
  
  @override
  String toString() => message.isEmpty ? "Permission Denied" : message;
}