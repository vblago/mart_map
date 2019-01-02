import 'dart:ui';

import 'package:flutter_share/flutter_share.dart';
import 'package:mart_map/presentation/app/views_states.dart';
import 'package:mart_map/presentation/utils/localizations.dart';
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
    model.changeSearchParameters
        .addEmptyFunctionCallback(changeSearchParameters);
    model.removeSearchParameters
        .addEmptyFunctionCallback(removeSearchParameters);
    model.makeReport.addCallbackObject(makeAndSharePdfReport);
    model.shareStore.addCallbackObject(shareStore);
    model.textController.addListener(changeText);
  }

  Future setData() async {
    model.stores = await model.dbManager.getStores(model.searchParameters);
    model.layerOptions.add(model.getMarkerLayerOptions(view.context));
    model.stateLoading = MainViewLoadingStates.stateLoadingFinish;
    view.changeState();
  }

  void showStore(int position) {
    model.layerOptions.removeLast();
    model.layerOptions
        .add(model.getMarkerLayerOptionsByPosition(view.context, position));
    model.currentStore = model.stores[position];
    model.state = MainViewSearchStates.statePoint;
    view.changeState();
  }

  Future shareStore(Image image) async {
    var byteData = await image.toByteData(format: ImageByteFormat.png);
    await EsysFlutterShare.shareImage(
        'store.png', byteData, AppLocalizations.of(view.context).shareStore);
  }

  Future makeAndSharePdfReport(Image image) async {
    model.stores = await model.dbManager.getStores(model.searchParameters);
    view.changeState();
    String path = await model.reportManager.getPdfTopStoresReport(image, model.dbManager);
    await FlutterShare.share(title: AppLocalizations.of(view.context).shareStores, fileUrl: path);
  }

  void showStores() {
    model.layerOptions.removeLast();
    model.layerOptions.add(model.getMarkerLayerOptions(view.context));
    model.state = MainViewSearchStates.stateSearch;
    model.currentStore = null;
    view.changeState();
  }

  Future changeText() async {
    if (model.searchParameters.text != model.textController.text) {
      await changeSearchParameters();
    }
  }

  Future changeSearchParameters() async {
    model.stateLoading = MainViewLoadingStates.stateLoading;
    view.changeState();
    model.searchParameters.text = model.textController.text;
    model.stores = await model.dbManager.getStores(model.searchParameters);
    if (model.layerOptions.length > 1) {
      model.layerOptions.removeLast();
    }
    if (model.stores.length > 0) {
      model.layerOptions.add(model.getMarkerLayerOptions(view.context));
    }
    model.stateLoading = MainViewLoadingStates.stateLoadingFinish;
    view.changeState();
  }

  void removeSearchParameters() {
    model.searchParameters.sort = null;
    model.searchParameters.sex = null;
    model.searchParameters.size = null;
    changeSearchParameters();
    view.changeState();
  }
}
