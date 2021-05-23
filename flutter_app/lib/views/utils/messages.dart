import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

class OLMessage {
  static showLinearDialog(context) {
    return showDialog(
      context: context,
      useRootNavigator: true,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        content: LinearProgressIndicator(),
      ),
    );
  }

  static showStatusDialog(
      context, DialogType type, String message, Function callback) {
    // return showGeneralDialog(
    //   context: context,
    //   useRootNavigator: true,
    //   barrierDismissible: false,
    //   barrierColor: Color.fromRGBO(44, 49, 55, 1),
    //   transitionDuration: Duration(milliseconds: 700),
    //   transitionBuilder: (context, animation, secondaryAnimation, child) =>
    //       SlideTransition(
    //     position:
    //         Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(animation),
    //     child: child,
    //   ),
    //   pageBuilder: (BuildContext context, Animation<double> animation,
    //           Animation<double> secondaryAnimation) =>
    //       Container(
    //     height: 250.0,
    //     width: 200.0,
    //     color: Colors.black,
    //     child: Center(
    //       child: Column(
    //         mainAxisSize: MainAxisSize.min,
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         children: [
    //           Text(
    //             message,
    //             style: Theme.of(context).textTheme.bodyText1,
    //           ),
    //           VerticalSpacer(distance: 8.0),
    //           ElevatedButton(
    //             onPressed: () =>
    //                 Navigator.of(context, rootNavigator: true).pop(),
    //             child: Icon(Icons.check_circle_outline),
    //           )
    //         ],
    //       ),
    //     ),
    //   ),
    // );
    return AwesomeDialog(
      context: context,
      animType: AnimType.SCALE,
      dialogType: type,
      headerAnimationLoop: false,
      desc: message,
      btnOkIcon: Icons.check_circle_outline_rounded,
      btnOkColor: Theme.of(context).colorScheme.primary,
      dismissOnTouchOutside: false,
      dismissOnBackKeyPress: true,
      useRootNavigator: true,
      // btnOkOnPress: () => Navigator.of(context, rootNavigator: true).pop(),
      btnOkOnPress: callback,
    ).show();
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
