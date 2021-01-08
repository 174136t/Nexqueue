import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppRoutes {
  static bool loaderShowing = false;
  static bool internetLoaderShowing = false;

  static void goto(context, page) {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) => page));
    // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  }

  static void replace(context, page) {
    Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (context) => page));
    // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  }

  static void makeFirst(context, page) {
    Navigator.of(context).popUntil((predicate) => predicate.isFirst);
    Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (context) => page));
    //  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  }

  static void dismiss(context) {
    Navigator.of(context).pop();
  }

  static void dismissTillFirst(context) {
    Navigator.of(context).popUntil((predicate) => predicate.isFirst);
  }

  static void dismissLoader(context) {
    print('dismissLoader $loaderShowing');
    if (loaderShowing) {
      loaderShowing = false;
      Navigator.of(context).pop();
    }
  }

  static void dismissInternetLoader(context) {
    print('dismissInternetLoader $internetLoaderShowing');
    if (internetLoaderShowing) {
      internetLoaderShowing = false;
      Navigator.of(context).pop();
    }
  }

  static void dismissAlert(context) {
    Navigator.of(context).pop();
  }

  static void showLoader(context) {
    loaderShowing = true;
    print('showLoader $loaderShowing');
//    showDialog(
//        context: context,
//        barrierDismissible: true,
//        builder: (BuildContext contextTemp) {
//          return FullScreenLoader();
//        });
  }

  static void showInternetLoader(context) {
    internetLoaderShowing = true;
    print('showInternetLoader $internetLoaderShowing');
//    showDialog(
//        context: context,
//        barrierDismissible: true,
//        builder: (BuildContext contextTemp) {
//          return new InternetLoader();
//        });
  }
}
