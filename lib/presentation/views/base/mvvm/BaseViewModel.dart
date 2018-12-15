import 'package:mart_map/presentation/views/base/mvvm/BaseModel.dart';
import 'package:mart_map/presentation/views/base/mvvm/BaseView.dart';

abstract class BaseViewModel<M extends BaseModel, V extends BaseView<M>> {
  V _view;
  M _model;

  V get view => _view;
  M get model => _model;

  BaseViewModel(this._view) {
    _model = _view.model;
    init();
  }

  void init();
}
