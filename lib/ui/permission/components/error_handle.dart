import 'package:attendance_app/ui/permission/components/snake_bar.dart';
import 'package:flutter/material.dart';

class ErrorHandle {
  static void handleError(BuildContext context, dynamic error) {
    SnakeBarComponent.showSnakeBar(
      context,
      error,
      isError:  true
    );
    Navigator.of(context).pop();
  }
}