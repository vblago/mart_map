import 'dart:convert';

import 'package:mart_map/data/api/entities/ApiRequest.dart';
import 'package:mart_map/data/api/entities/ApiResponse.dart';
import 'package:mart_map/data/restAPI/BaseApi.dart';

class FindApi extends BaseApi {
  final String BASE_URL =
      "http://website.com/api/";

  final String APIDATA = "info/data";


  Future<ApiResponse> request(param_1, param_2) {
    ApiRequest apiRequest = ApiRequest(param_1, param_2);

    return postRequest(BASE_URL + APIDATA, apiRequest.toJson())
        .then((response) {
      return ApiResponse.fromJson(json.decode(response.body)['body']);
    });
  }
}
