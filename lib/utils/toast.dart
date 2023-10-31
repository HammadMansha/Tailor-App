import 'dart:ui';
import 'package:flutter/material.dart';
import '../main.dart';

enum ToastStatus {
  success,
  danger,
}

class KToast {
  static showToast(
      {String title = "",
        String subTitle = "",
        ToastStatus type = ToastStatus.success}) {
    ScaffoldMessenger.of(navigatorKey.currentContext!).removeCurrentSnackBar();
    ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
      SnackBar(
        backgroundColor: Colors.black.withOpacity(0),
        duration: const Duration(seconds: 3),
        content: _showToast(title: title, subTitle: subTitle, type: type),
        elevation: 0,
      ),
    );
  }
}

Widget _showToast({title, subTitle, type}) {
  Icon icon;
  if (type == ToastStatus.danger) {
    icon = Icon(
      Icons.error_sharp,
      color: Colors.redAccent,
      size: 20,
    );
  } else {
    icon = Icon(
      Icons.check_circle,
      color: Colors.greenAccent,
      size: 20,
    );
  }
  Color color =
  type == ToastStatus.danger ? Colors.redAccent : Colors.greenAccent;
  Color gradientColor =
  type == ToastStatus.danger ? Colors.red.shade300 : Colors.green.shade300;
  BoxDecoration _boxDecoration() => BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      gradient: LinearGradient(
          colors: [
            gradientColor.withOpacity(0.3),
            Colors.white.withOpacity(0.3),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          stops: const [
            0.1,
            0.5,
          ]));

  return ClipRRect(
    borderRadius: BorderRadius.circular(15),
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 30.0, sigmaY: 30.0),
      child: Container(
        height: 70,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: _boxDecoration(),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(padding: EdgeInsets.only(right: 15), child: icon),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: color,
                      fontSize: 17,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                  ),
                  Text(
                    subTitle,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w100,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}