import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:mart_map/data/api/entities/Store.dart';
import 'package:mart_map/resources/AppDimensions.dart';
import 'package:flutter_rating/flutter_rating.dart';

final formater = new NumberFormat("#,#0.0", "en_US");

Widget getCardPointItem(Store point, Color pointColor) {
  return Padding(
    padding: const EdgeInsets.all(AppDimensions.paddingPico),
    child: Card(
      child: Row(
        children: <Widget>[
          Image.network(
            point.picUrl,
            width: AppDimensions.imageSizeNormal,
            height: AppDimensions.imageSizeNormal,
            fit: BoxFit.cover,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    point.name,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(point.num),
                  Row(
                    children: <Widget>[
                      StarRating(
                        rating: point.rate,
                        size: AppDimensions.iconSizeSmall,
                      ),
                      Text("${formater.format(point.rate)} / 5.0"),
                    ],
                  ),
                  Text(point.phone),
                ],
              ),
            ),
          ),
          FlatButton(
            onPressed: () => {},
            child: Column(
              children: <Widget>[
                Icon(
                  Icons.location_on,
                  size: 48,
                  color: pointColor,
                ),
                Text("На карте")
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
