import 'package:flutter_svg/svg.dart';
import 'package:mart_map/data/db/entities/Store.dart';
import 'package:mart_map/resources/AppDimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget storeMarkerItem(Store store) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Container(
        decoration: BoxDecoration(
          color: store.priority ? Colors.redAccent : Colors.yellow,
          borderRadius: BorderRadius.all(Radius.circular(AppDimensions.paddingMicro)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppDimensions.paddingMicro),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                store.name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                store.num,
                style: TextStyle(
                  fontSize: 8,
                ),
              ),
            ],
          ),
        ),
      ),
      SvgPicture.asset(
        'assets/icons/triangle.svg',
        color: store.priority ? Colors.redAccent : Colors.yellow,
        width: 30,
        height: 10,
      ),
    ],
  );
}
