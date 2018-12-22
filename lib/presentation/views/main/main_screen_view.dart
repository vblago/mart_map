import 'package:flutter/rendering.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:latlong/latlong.dart';
import 'package:mart_map/data/api/entities/Review.dart';
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
    model.animationController = AnimationController(
        vsync: this, animationBehavior: AnimationBehavior.preserve);
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
      controller: model.animationController,
      headerHeight: AppDimensions.headerHeight,
      title: Text("MartMap"),
      backLayer: RepaintBoundary(
          key: model.screenshotKey,
          child: Column(
            children: <Widget>[
              Expanded(
                child: FlutterMap(
                  options: new MapOptions(
                    center: new LatLng(50.003224, 36.306316),
                    zoom: 17.5,
                    maxZoom: 17.5,
                    minZoom: 17.5,
                  ),
                  mapController: MapController(),
                  layers: model.layerOptions,
                ),
              ),
              model.currentStore != null
                  ? Card(
                      child: Row(
                        children: <Widget>[
                          Image.network(
                            model.currentStore.picUrl,
                            width: AppDimensions.imageSizeNormal,
                            height: AppDimensions.imageSizeNormal,
                            fit: BoxFit.cover,
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(
                                  AppDimensions.paddingSmall),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    model.currentStore.name,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(model.currentStore.num),
                                  Row(
                                    children: <Widget>[
                                      StarRating(
                                        rating: model.currentStore.rate,
                                        size: AppDimensions.iconSizeSmall,
                                      ),
                                      Text(
                                          "${formatter.format(model.currentStore.rate)} / 5.0"),
                                    ],
                                  ),
                                  Text(model.currentStore.phone),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Container(),
            ],
          )),
      frontLayer: Padding(
          padding: const EdgeInsets.fromLTRB(AppDimensions.paddingSmall,
              AppDimensions.paddingSmall, AppDimensions.paddingSmall, 0),
          child: getFrontLayer(model.stores)),
      iconPosition: BackdropIconPosition.action,
    );
  }

  Widget getFrontLayer(List<Store> stores) {
    switch (model.state) {
      case MainViewSearchStates.stateSearch:
        {
          return Column(
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
              Container(
                padding: EdgeInsets.only(top: AppDimensions.paddingSmall),
                height: AppDimensions.listHeight,
                child: ListView.builder(
                  itemBuilder: (context, position) {
                    return getCardStoreItem(stores[position], position);
                  },
                  itemCount: stores.length,
                ),
              ),
            ],
          );
        }
      case MainViewSearchStates.statePoint:
        {
          return Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Image.network(
                      model.currentStore.picUrl,
                      width: AppDimensions.imageSizeNormal,
                      height: AppDimensions.imageSizeNormal,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(AppDimensions.paddingSmall),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            model.currentStore.name,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(model.currentStore.num),
                          Row(
                            children: <Widget>[
                              StarRating(
                                rating: model.currentStore.rate,
                                size: AppDimensions.iconSizeSmall,
                              ),
                              Text(
                                  "${formatter.format(model.currentStore.rate)} / 5.0"),
                            ],
                          ),
                          Text(model.currentStore.phone),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.cancel),
                        color: Colors.grey,
                        onPressed: () =>
                            model.showStoresOnMap.onClickEmptyFunction(),
                      ),
                      IconButton(
                        icon: Icon(Icons.share),
                        color: theme.appBarColor,
                        onPressed: () async {
                          RenderRepaintBoundary boundary = model
                              .screenshotKey.currentContext
                              .findRenderObject();
                          var image = await boundary.toImage();

                          model.shareStore.onClickObject(image);
                        },
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  model.currentStore.description,
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Divider(
                  height: 5,
                  color: Colors.black12,
                ),
              ),
              Text(
                "Отзывы",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, position) {
                    return getReviewItem(model.currentReviews[position]);
                  },
                  itemCount: model.currentReviews.length,
                ),
              ),
            ],
          );
        }
      default:
        {}
    }
    return Center(
      child: Text("Введите категорию..."),
    );
  }

  Widget getReviewItem(Review review) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            review.userName,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),
          ),
          Row(
            children: <Widget>[
              StarRating(
                rating: review.rate.toDouble(),
                size: AppDimensions.iconSizeSmall,
              ),
              Text("${formatter.format(review.rate.toDouble())} / 5.0"),
            ],
          ),
          Text(review.description),
          Divider()
        ],
      ),
    );
  }

  Widget getCardStoreItem(Store store, int position) {
    return Padding(
      padding: const EdgeInsets.all(AppDimensions.paddingPico),
      child: GestureDetector(
        onTap: () {
          setState(() {
            model.animationController.fling(
                velocity: 2.0, animationBehavior: AnimationBehavior.preserve);
          });
          model.layerOptions.removeLast();
          model.showStoreOnMap.onClickObject(position);
          changeState();
        },
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
                  padding: const EdgeInsets.all(AppDimensions.paddingSmall),
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
            ],
          ),
        ),
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
