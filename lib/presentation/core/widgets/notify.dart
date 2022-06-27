// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:

class Notify {
  static void error(BuildContext context, String msg) {
    msg = msg.trim();
    if ( msg.isEmpty || msg.length > 100)
      msg = 'An error occured. Please try again.';

    remove(context);
    final snackBar = SnackBar(
      content: Text(msg, ),
      duration: Duration(seconds: 8),
      backgroundColor: Colors.red,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static void success(BuildContext context, String msg) {
    msg = msg.trim();
    if ( msg.isEmpty || msg.length > 100)
      msg = 'Success.';

    remove(context);
    final snackBar = SnackBar(
      content: Text(msg, ),
      duration: Duration(seconds: 8),
      backgroundColor: Colors.blue,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static void remove(BuildContext context) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
  }
}