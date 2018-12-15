import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mart_map/data/api/entities/Point.dart';
import 'package:mart_map/data/api/entities/Review.dart';
import 'package:mart_map/domain/managers/api_manager.dart';
import 'package:mart_map/presentation/app/views_states.dart';
import 'package:mart_map/presentation/views/base/mvvm/BaseModel.dart';
import 'package:flutter/widgets.dart';

class MainScreenModel extends BaseModel {
  OnClickCommand exitDialogStay = new OnClickCommand();

  PageController pageController;
  GoogleMapController mapsController;
  var children = <Widget>[];
  MainViewSearchStates state = MainViewSearchStates.stateSearch;
  int page = 0;

  List<Point> points = ApiManager().getPoints();
  List<Review> reviews = ApiManager().getReviews();

  List<Marker> get markers{
    List<Marker> list = new List();
    points.forEach((Point point){
      list.add(Marker(point.num, MarkerOptions(
        position: LatLng(
          point.latitude,
          point.longitude,
        ),
        infoWindowText: InfoWindowText(point.name, point.num),
      )));
    });
    return list;
  }
}
