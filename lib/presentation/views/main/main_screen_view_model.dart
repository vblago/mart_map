import 'dart:ui';

import 'package:mart_map/presentation/app/views_states.dart';
import 'package:mart_map/presentation/views/base/mvvm/BaseViewModel.dart';
import 'package:mart_map/presentation/views/main/main_screen_model.dart';
import 'package:mart_map/presentation/views/main/main_screen_view.dart';
import 'package:esys_flutter_share/esys_flutter_share.dart';

class MainScreenViewModel
    extends BaseViewModel<MainScreenModel, MainScreenView> {
  MainScreenViewModel(MainScreenView view) : super(view);

  @override
  Future init() async {
    await setData();
    model.showStoreOnMap.addCallbackObject(showStore);
    model.showStoresOnMap.addEmptyFunctionCallback(showStores);
    model.shareStore.addCallbackObject(shareStore);
  }

  Future setData() async{
    model.stores = await model.dbManager.getStores(model.searchParameters);
    model.layerOptions.add(model.getMarkerLayerOptions(view.context));
    view.changeState();
  }

  void showStore(int position){
    model.layerOptions.removeLast();
    model.layerOptions.add(model.getMarkerLayerOptionsByPosition(view.context, position));
    model.currentStore = model.stores[position];
    model.state = MainViewSearchStates.statePoint;
    view.changeState();
  }

  Future shareStore(Image image) async {
    var byteData = await image.toByteData(format: ImageByteFormat.png);
    await EsysFlutterShare.shareImage('myImageTest.png', byteData, 'Image Title');
  }

  void showStores(){
    model.layerOptions.removeLast();
    model.layerOptions.add(model.getMarkerLayerOptions(view.context));
    model.state = MainViewSearchStates.stateSearch;
    model.currentStore = null;
    view.changeState();
  }
}
