import 'package:flutter/material.dart';

class AppNavigation {
  // Simple push navigation
  static void push(BuildContext context, Widget page) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => page),
    );
  }

  // Go back
  static void pop(BuildContext context) {
    Navigator.of(context).pop();
  }

  // Clear previous pages and navigate forward
  static void pushAndClear(BuildContext context, Widget page) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => page),
          (Route<dynamic> route) => false, // removes all previous routes
    );
  }

  // Replace current page with new page (equivalent to Get.off)
  static void pushReplacement(BuildContext context, Widget page) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => page),
    );
  }
}

// Usage:
// AppNavigation.push(context, const SpaServicePage());
// AppNavigation.pop(context);