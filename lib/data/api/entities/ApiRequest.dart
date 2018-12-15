import 'dart:core';

class ApiRequest {
  String param_1;
  String param_2;

  ApiRequest(this.param_1, this.param_2);

  Map<String, dynamic> toJson() =>
      {'param_1': param_1.toString(), 'param_2': param_2.toString()};
}
