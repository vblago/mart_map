import 'package:mart_map/presentation/app/theme.dart';
import 'package:mart_map/presentation/views/base/mvvm/BaseModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class BaseView<M extends BaseModel> extends State<StatefulWidget> {
  bool isLoading = false;

  M _model;
  M get model => _model;
  ThemeApp theme = new ThemeApp();

  BaseView(this._model);

  @override
  Widget build(BuildContext context) {
    return getView().build(context);
  }

  BaseView<M> getView();

  void setLoading(bool value) {
    setState(() {
      isLoading = true;
    });
  }

  void showSnackBar(
      BuildContext context, GlobalKey<ScaffoldState> scafKey, String text) {
    final snackBar = SnackBar(content: Text(text));
    scafKey.currentState.showSnackBar(snackBar);
  }

  void navigateTo(BuildContext context, Widget widget) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );
  }
}
