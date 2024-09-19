import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
/*
import 'package:geolocator/geolocator.dart';
import 'package:value_up/core/resource/palette.dart';
*/

class AppWidgets {
  static Widget getErrorMessage(BuildContext context, String errMsg) {
    return AlertDialog(
      contentPadding: EdgeInsets.fromLTRB(20, 5, 20, 5),
      content: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 30,
              ),
              Text(
                '오류',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                errMsg,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
          Positioned(
            top: 0.0,
            right: -10.0,
            child: IconButton(
              icon: Icon(
                Icons.close_rounded,
                color: Colors.black,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
        ],
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 56,
              width: 127,
              child: TextButton(
                style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    foregroundColor: Colors.white,
                    fixedSize: Size(127, 56),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    backgroundColor: Colors.black),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  '확인',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

