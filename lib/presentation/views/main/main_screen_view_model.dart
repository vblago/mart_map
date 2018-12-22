import 'package:mart_map/data/api/entities/Review.dart';
import 'package:mart_map/presentation/app/views_states.dart';
import 'package:mart_map/presentation/views/base/mvvm/BaseViewModel.dart';
import 'package:mart_map/presentation/views/main/main_screen_model.dart';
import 'package:mart_map/presentation/views/main/main_screen_view.dart';

class MainScreenViewModel
    extends BaseViewModel<MainScreenModel, MainScreenView> {
  MainScreenViewModel(MainScreenView view) : super(view);

  @override
  Future init() async {
    setData();
    model.showStoreOnMap.addCallbackObject(showStore);
    model.showStoresOnMap.addEmptyFunctionCallback(showStores);
  }

  void setData(){
    model.stores = model.apiManager.getPoints();
    model.reviews = model.apiManager.getReviews();
    model.layerOptions.add(model.getMarkerLayerOptions(view.context));
    view.changeState();
  }

  void showStore(int position){
    model.layerOptions.add(model.getMarkerLayerOptionsByPosition(view.context, position));
    model.currentStore = model.stores[position];
    model.state = MainViewSearchStates.statePoint;

    int i = 0;
    model.reviews.forEach((Review review){
      if(model.currentStore.reviews.contains(i)){
        model.currentReviews.add(review);
      }
      i++;
    });
    view.changeState();
  }

  void showStores(){
    model.layerOptions.add(model.getMarkerLayerOptions(view.context));
    model.state = MainViewSearchStates.stateSearch;
    model.currentStore = null;
    model.currentReviews.clear();
    view.changeState();
  }
}
