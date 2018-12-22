import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:mart_map/data/api/entities/Store.dart';
import 'package:mart_map/data/api/entities/Review.dart';
import 'package:mart_map/domain/managers/api_manager.dart';
import 'package:mart_map/presentation/app/views_states.dart';
import 'package:mart_map/presentation/views/base/mvvm/BaseModel.dart';
import 'package:flutter/widgets.dart';
import 'package:mart_map/presentation/widgets/store_marker_item.dart';

class MainScreenModel extends BaseModel {
  OnClickCommand showStoreOnMap = new OnClickCommand();
  OnClickCommand showStoresOnMap = new OnClickCommand();

  MainViewSearchStates state = MainViewSearchStates.stateSearch;
  int page = 0;

  List<LayerOptions> layerOptions = [
    new TileLayerOptions(
        urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
        subdomains: ['a', 'b', 'c']),
  ];

  AnimationController animationController;

  ApiManager apiManager = new ApiManager();
  List<Store> stores = List();
  List<Review> reviews = List();
  Store currentStore;
  List<Review> currentReviews = List();

  MarkerLayerOptions getMarkerLayerOptions(context) {
    List<Marker> markers = new List();
    stores.forEach((Store store) {
      markers.add(
        Marker(
          point: LatLng(
            store.latitude,
            store.longitude,
          ),
          builder: (context) => storeMarkerItem(store),
          anchor: AnchorPos.top,
        ),
      );
    });
    return new MarkerLayerOptions(markers: markers);
  }

  MarkerLayerOptions getMarkerLayerOptionsByPosition(context, position) {
    List<Marker> markers = new List();
    markers.add(
        Marker(
          point: LatLng(
            stores[position].latitude,
            stores[position].longitude,
          ),
          builder: (context) => storeMarkerItem(stores[position]),
          anchor: AnchorPos.top,
        ),
      );
    return new MarkerLayerOptions(markers: markers);
  }
}
