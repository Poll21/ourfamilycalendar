import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


bool periodicApi = true;
errorsScreenMethod(BuildContext context, String error) {
    Fluttertoast.showToast(
        msg: error,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 5,
        backgroundColor: Theme.of(context).colorScheme.error,
        textColor: Colors.white,
        fontSize: 16.0);
  }