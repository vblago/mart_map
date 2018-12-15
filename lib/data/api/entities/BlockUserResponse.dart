class ApiResponse {
  String response;

  ApiResponse(this.response);

  ApiResponse.fromJson(Map<String, dynamic> json)
      : response = json['response'].toString();
}
