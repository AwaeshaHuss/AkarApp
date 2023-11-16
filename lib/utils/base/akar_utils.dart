import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

bool isOpenKeyboard(context) => MediaQuery.of(context).viewInsets.bottom == 0;
bool isArabicLangSelected(context) => Directionality.of(context) == TextDirection.rtl;

rebuild(context, {bool sleepBeforeRebuild = false, int sleepDuration = 1000}){
    try {
      sleepBeforeRebuild ?
      sleep(Duration(milliseconds: sleepDuration)) : null;
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      (context as Element).markNeedsBuild();
      log('timeStamp from rebuild: $timeStamp');
    });
    } on Exception catch (e) {
      log(e.toString());
      ShowToastSnackBar.displayToast(message: 'error rebuilding screen\'s state,\n $e');
    }
  }

double getScreenWidth(BuildContext context, {bool realWidth = false}) {
  if (realWidth) {
    return MediaQuery.of(context).size.width;
  } //to preview widget like phone scale in preview

  if (kIsWeb) {
    return MediaQuery.of(context).orientation == Orientation.landscape
        ? MediaQuery.of(context).size.width / 4
        : MediaQuery.of(context).size.height / 4;
  }

  return MediaQuery.of(context).orientation == Orientation.portrait
      ? MediaQuery.of(context).size.width
      : MediaQuery.of(context).size.height;
}

double getScreenHeight(BuildContext context, {bool realHeight = false}) {
  if (realHeight) {
    return MediaQuery.of(context).size.height;
  } //to preview widget like phone scale in preview
  if (kIsWeb) {
    return MediaQuery.of(context).orientation == Orientation.landscape
        ? MediaQuery.of(context).size.height / 1.4
        : MediaQuery.of(context).size.width / 1.4;
  }
  return MediaQuery.of(context).orientation == Orientation.portrait
      ? MediaQuery.of(context).size.height
      : MediaQuery.of(context).size.width;
}

class ProgressCircleDialog {
  static bool _isShow = false;

  static void show(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => const Center(child: CircularProgressIndicator()),
        barrierDismissible: false);
    _isShow = true;
  }

  static dissmed(BuildContext context) {
    if (_isShow) {
      Navigator.pop(context);
      _isShow = false;
    }
  }
}

class ShowToastSnackBar {
  static Future<bool?> displayToast({
    required String? message,
    bool isError = false,
    bool isSuccess = false,
  }) {
    return Fluttertoast.showToast(
        msg: message!,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        textColor: Colors.white,
        backgroundColor: const Color(0xff7A3FE1),
        fontSize: 14.0);

  }

  static void showSnackBars(BuildContext context,
      {required String? message,
        bool isError = false,
        bool isSuccess = false,
        Duration? duration,
        SnackBarAction? snackBarAction}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        message!,
      ),
      duration: duration ?? const Duration(seconds: 3),
      action: snackBarAction,
      backgroundColor: isError
          ? Colors.red[800]
          : isSuccess
          ? Colors.green[800]
          : null,
    ));
  }
}