import 'package:mart_map/presentation/views/base/mvvm/BaseModel.dart';
import 'package:mart_map/presentation/views/base/mvvm/BaseView.dart';
import 'package:mart_map/presentation/views/base/mvvm/BaseViewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class BaseScreen<M extends BaseModel, V extends BaseView<M>,
    VM extends BaseViewModel<M, V>> extends StatefulWidget {
  VM _viewModel;
  M _model;
  V _view;

  M get model => _model;
  VM get viewModel => _viewModel;
  V get view => _view;

  BaseScreen() {
    _model = initModel();
    _view = initView(_model);
    _viewModel = initViewModel(_view);
  }

  @override
  V createState() {
    return _viewModel.view;
  }

  M initModel();
  V initView(M model);
  VM initViewModel(V view);
}
