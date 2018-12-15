import 'package:mart_map/presentation/views/base/BaseScreen.dart';
import 'package:mart_map/presentation/views/main/main_screen_model.dart';
import 'package:mart_map/presentation/views/main/main_screen_view.dart';
import 'package:mart_map/presentation/views/main/main_screen_view_model.dart';

class MainScreen
    extends BaseScreen<MainScreenModel, MainScreenView, MainScreenViewModel> {
  @override
  MainScreenModel initModel() {
    return new MainScreenModel();
  }

  @override
  MainScreenView initView(MainScreenModel model) {
    return MainScreenView(model);
  }

  @override
  MainScreenViewModel initViewModel(MainScreenView view) {
    return MainScreenViewModel(view);
  }
}
