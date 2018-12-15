import 'package:mart_map/data/api/entities/Point.dart';
import 'package:mart_map/presentation/views/base/mvvm/BaseView.dart';
import 'package:mart_map/presentation/views/main/main_screen_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'package:backdrop/backdrop.dart';
import 'package:mart_map/presentation/views/main/point_cart.dart';
import 'package:mart_map/resources/AppDimensions.dart';

class MainScreenView extends BaseView<MainScreenModel>
    with AutomaticKeepAliveClientMixin {
  MainScreenView(MainScreenModel model) : super(model);

  static MainScreenView of(BuildContext context) =>
      context.ancestorStateOfType(const TypeMatcher<MainScreenView>());

  final LatLng center = const LatLng(50.002711, 36.306370);

  @override
  void initState() {
    super.initState();
  }

  void changeState() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BackdropScaffold(
      headerHeight: 200,
      title: Text("MartMap"),
      backLayer: getGoogleMaps(),
      frontLayer: Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
        child: Column(
          children: <Widget>[
            TextFormField(
              style: new TextStyle(
                fontWeight: FontWeight.normal,
                color: Colors.black,
                fontSize: 16.0,
              ),
              decoration: InputDecoration(
                hintText: 'Введите категорию',
                prefixIcon: Icon(Icons.search),
                suffixIcon: Icon(Icons.filter_list),
                contentPadding:
                    new EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0)),
              ),
            ),
            getFrontLayer(model.points)
          ],
        ),
      ),
      iconPosition: BackdropIconPosition.action,
    );
  }

  double zoom = 17.5;

  Widget getGoogleMaps() {
    return new GoogleMap(
      onMapCreated: onMapCreated,
      options: GoogleMapOptions(
        cameraPosition: CameraPosition(
          target: center,
          zoom: zoom,
        ),
      ),
    );
  }

  Widget getFrontLayer(List<Point> points) {
//    switch (model.state) {
//      case MainViewSearchStates.stateSearch:
//
//        break;
//      case MainViewSearchStates.statePoint:
//        break;
//      default:
//        return Center(
//          child: Text("Введите категорию..."),
//        );
//        break;
//    }

    return Container(
      padding: EdgeInsets.only(top: AppDimensions.paddingSmall),
      height: 505.0,
      child: ListView.builder(
        itemBuilder: (context, position) {
          return getCardPointItem(points[position], theme.appBarColor);
        },
        itemCount: points.length,
      ),
    );
  }

  void onMapCreated(GoogleMapController controller) {
    setState(() {
      model.mapsController = controller;
    });

    addMarkersToMap();
  }

  void addMarkersToMap() {
    model.markers.forEach((Marker marker) async {
      await model.mapsController.addMarker(marker.options);
    });
    removeMarkersFromMap();
  }

  void removeMarkersFromMap() {
    setState(() {
      model.mapsController.clearMarkers();
    });
  }

  @override
  BaseView<MainScreenModel> getView() {
    return this;
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
