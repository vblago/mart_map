import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:mart_map/data/api/entities/Store.dart';
import 'package:mart_map/presentation/app/views_states.dart';
import 'package:mart_map/presentation/views/base/mvvm/BaseView.dart';
import 'package:mart_map/presentation/views/main/main_screen_model.dart';
import 'package:flutter/material.dart';
import 'package:backdrop/backdrop.dart';
import 'package:mart_map/presentation/widgets/store_item_cart.dart';
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
    model.animationController = AnimationController(
        vsync: this, animationBehavior: AnimationBehavior.preserve);
    return BackdropScaffold(
      controller: model.animationController,
      headerHeight: AppDimensions.headerHeight,
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
        padding: const EdgeInsets.fromLTRB(AppDimensions.paddingSmall,
            AppDimensions.paddingSmall, AppDimensions.paddingSmall, 0),
        child: Column(
          children: <Widget>[
            TextFormField(
              style: new TextStyle(
                fontWeight: FontWeight.normal,
                color: Colors.black,
                fontSize: 16.0,
              ),
              decoration: InputDecoration(
                hintText: 'Введите категорию...',
                prefixIcon: Icon(Icons.search),
                suffixIcon: Icon(Icons.filter_list),
                contentPadding: new EdgeInsets.symmetric(
                    vertical: AppDimensions.paddingSmall,
                    horizontal: AppDimensions.paddingSmall),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                        AppDimensions.borderRadiusMedium)),
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
    switch (model.state) {
      case MainViewSearchStates.stateSearch:
        {
          return Container(
            padding: EdgeInsets.only(top: AppDimensions.paddingSmall),
            height: AppDimensions.listHeight,
            child: ListView.builder(
              itemBuilder: (context, position) {
                return getCardStoreItem(stores[position], theme.appBarColor);
              },
              itemCount: stores.length,
            ),
          );
        }
      case MainViewSearchStates.statePoint:
        {
          return Container();
        }
      default:
        {}
    }
    return Center(
      child: Text("Введите категорию..."),
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
