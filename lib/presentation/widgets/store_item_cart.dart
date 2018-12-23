import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:mart_map/data/db/entities/Store.dart';
import 'package:mart_map/resources/AppDimensions.dart';
import 'package:flutter_rating/flutter_rating.dart';

final formatter = new NumberFormat("#,#0.0", "en_US");

Widget getCardStoreItem(Store store, Color storeColor) {
  return Padding(
    padding: const EdgeInsets.all(AppDimensions.paddingPico),
    child: Card(
      child: Row(
        children: <Widget>[
          Image.network(
            store.picUrl,
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
                    store.name,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(store.num),
                  Row(
                    children: <Widget>[
                      StarRating(
                        rating: store.rate,
                        size: AppDimensions.iconSizeSmall,
                      ),
                      Text("${formatter.format(store.rate)} / 5.0"),
                    ],
                  ),
                  Text(store.phone),
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
                  color: storeColor,
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
