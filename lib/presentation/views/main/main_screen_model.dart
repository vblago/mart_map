import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mart_map/data/api/entities/Store.dart';
import 'package:mart_map/data/api/entities/Review.dart';
import 'package:mart_map/domain/managers/api_manager.dart';
import 'package:mart_map/presentation/app/views_states.dart';
import 'package:mart_map/presentation/views/base/mvvm/BaseModel.dart';
import 'package:flutter/widgets.dart';

class MainScreenModel extends BaseModel {
  OnClickCommand exitDialogStay = new OnClickCommand();

  PageController pageController;
  var children = <Widget>[];
  MainViewSearchStates state = MainViewSearchStates.stateSearch;
  int page = 0;

  List<LayerOptions> layerOptions = [
    new TileLayerOptions(
        urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
        subdomains: ['a', 'b', 'c']),
  ];

  AnimationController animationController;

  List<Store> stores = ApiManager().getPoints();
  List<Review> reviews = ApiManager().getReviews();

  MarkerLayerOptions markerLayerOptions(context) {
    List<Marker> markers = new List();
    stores.forEach((Store store) {
      markers.add(
        Marker(
          point: LatLng(
            store.latitude,
            store.longitude,
          ),
          builder: (context) => Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: store.priority ? Colors.redAccent : Colors.yellow,
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5),
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
              ),
          anchor: AnchorPos.top,
        ),
      );
    });
    return new MarkerLayerOptions(markers: markers);
  }
}
