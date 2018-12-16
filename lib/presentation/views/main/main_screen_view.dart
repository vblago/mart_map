import 'package:flutter/src/scheduler/ticker.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:mart_map/data/api/entities/Store.dart';
import 'package:mart_map/presentation/views/base/mvvm/BaseView.dart';
import 'package:mart_map/presentation/views/main/main_screen_model.dart';
import 'package:flutter/material.dart';
import 'package:backdrop/backdrop.dart';
import 'package:mart_map/presentation/views/main/point_cart.dart';
import 'package:mart_map/resources/AppDimensions.dart';

class MainScreenView extends BaseView<MainScreenModel>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  MainScreenView(MainScreenModel model) : super(model);

  static MainScreenView of(BuildContext context) =>
      context.ancestorStateOfType(const TypeMatcher<MainScreenView>());

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
    model.animationController = AnimationController(vsync: this, animationBehavior: AnimationBehavior.preserve);
    return BackdropScaffold(
      controller: model.animationController,
      headerHeight: 200,
      title: Text("MartMap"),
      backLayer: FlutterMap(
        options: new MapOptions(
          center: new LatLng(50.002711, 36.306370),
          zoom: 17.5,
          maxZoom: 17.5,
          minZoom: 17.5,
        ),
        mapController: MapController(),
        layers: model.layerOptions,
      ),
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
            getFrontLayer(model.stores)
          ],
        ),
      ),
      iconPosition: BackdropIconPosition.action,
    );
  }

  Widget getFrontLayer(List<Store> stores) {
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


  model.layerOptions.add(model.markerLayerOptions(context));
  model.animationController.fling(animationBehavior: AnimationBehavior.normal);
  setState(() {});


    return Container(
      padding: EdgeInsets.only(top: AppDimensions.paddingSmall),
      height: 505.0,
      child: ListView.builder(
        itemBuilder: (context, position) {
          return getCardPointItem(stores[position], theme.appBarColor);
        },
        itemCount: stores.length,
      ),
    );
  }

  @override
  BaseView<MainScreenModel> getView() {
    return this;
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

}
