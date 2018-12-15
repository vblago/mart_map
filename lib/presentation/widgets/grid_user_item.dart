import 'package:mart_map/resources/AppDimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget gridUserItem(photoUrl, name, work, distance) {
  return Padding(
    padding: const EdgeInsets.only(
        right: AppDimensions.paddingPico, left: AppDimensions.paddingPico),
    child: Card(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            photoUrl != null || photoUrl.toString().length == 0
                ? Image.network(
                    photoUrl,
                    width: 120.0,
                    height: 120.0,
                  )
                : Image.asset(
                    'assets/images/no_profile_picture.png',
                    width: 120.0,
                    height: 120.0,
                  ),
            Text(
              name,
              style: TextStyle(
                  color: Colors.black, fontSize: AppDimensions.textSizeNormal),
            ),
            work != null
                ? Text(
                    work,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: AppDimensions.textSizeMiddle),
                  )
                : Container(
                    width: 0.0,
                    height: 0.0,
                  ),
            Text(
              distance.toString(),
              style: TextStyle(
                  color: Colors.black, fontSize: AppDimensions.textSizeMiddle),
            ),
          ],
        ),
      ),
    ),
  );
}
