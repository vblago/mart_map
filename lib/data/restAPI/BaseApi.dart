import 'package:http/http.dart' as http;

class BaseApi {
  Future<http.Response> postRequest(url, data) async {
    return await http.post(url, body: data);
  }

  Future<http.Response> getRequest(url) async {
    return await http.get(url);
  }
}
