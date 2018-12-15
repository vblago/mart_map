import 'package:mart_map/presentation/views/base/mvvm/BaseViewModel.dart';
import 'package:mart_map/presentation/views/main/main_screen_model.dart';
import 'package:mart_map/presentation/views/main/main_screen_view.dart';

class MainScreenViewModel
    extends BaseViewModel<MainScreenModel, MainScreenView> {
  MainScreenViewModel(MainScreenView view) : super(view);

  @override
  Future init() async {

  }
}
