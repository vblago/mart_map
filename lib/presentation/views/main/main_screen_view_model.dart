import 'package:mart_map/presentation/views/base/mvvm/BaseViewModel.dart';
import 'package:mart_map/presentation/views/main/main_screen_model.dart';
import 'package:mart_map/presentation/views/main/main_screen_view.dart';

class MainScreenViewModel
    extends BaseViewModel<MainScreenModel, MainScreenView> {
  MainScreenViewModel(MainScreenView view) : super(view);

  @override
  Future init() async {
    setData();
  }

  void setData(){
    model.stores = model.apiManager.getPoints();
    model.reviews = model.apiManager.getReviews();
    model.layerOptions.add(model.markerLayerOptions(view.context));
    view.changeState();
  }
}
