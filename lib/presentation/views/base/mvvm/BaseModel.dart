import 'package:flutter/widgets.dart';

class BaseModel {}

class OnClickCommand {
  List<Function> callbacks = new List();

  void addCallback(Function(BuildContext context) fun) {
    callbacks.add(fun);
  }

  void addCallbackObject<T>(Function(T value) fun) {
    callbacks.add(fun);
  }

  void addEmptyFunctionCallback(Function() fun){
    callbacks.add(fun);
  }

  void clearCallbacks() {
    callbacks.clear();
  }

  void onClick(BuildContext context) {
    callbacks.forEach((fun) => fun(context));
  }

  void onClickObject<T>(T value) {
    callbacks.forEach((fun) => fun(value));
  }

  void onClickEmptyFunction(){
    callbacks.forEach((fun) => fun());
  }
}
