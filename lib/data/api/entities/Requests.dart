class FindUsersRequest {
  String user_id;
  String latitude;
  String offset;
  String longitude;
  String limit;
  String device_token;

  FindUsersRequest(this.user_id, this.latitude, this.offset, this.longitude,
      this.limit, this.device_token);

  Map<String, dynamic> toJson() => {
        'user_id': user_id,
        'latitude': latitude,
        'offset': offset,
        'longitude': longitude,
        'limit': limit,
        'device_token': device_token,
      };
}

class GetConversationRequest {
  String user_id;
  String latitude;
  String longitude;

  GetConversationRequest(this.user_id, this.latitude, this.longitude);

  Map<String, dynamic> toJson() => {
    'user_id': user_id,
    'latitude': latitude,
    'longitude': longitude,
  };
}
