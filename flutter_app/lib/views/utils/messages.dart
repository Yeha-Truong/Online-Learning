import 'package:flutter/material.dart';

class OLMessage {
  static showLinearDialog(context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        content: LinearProgressIndicator(),
      ),
    );
  }

  static showSnackBarMessge(context, String message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: Theme.of(context).textTheme.caption,
        ),
      ),
    );
  }
}
