class Store{
  String name;
  String num;
  String phone;
  double rate;
  String picUrl;
  double latitude;
  double longitude;
  String description;
  List<String> categories;
  List<int> reviews;
  bool priority;

  Store(this.name, this.num, this.rate, this.picUrl, this.description,
      this.categories, this.reviews, this.phone, this.latitude, this.longitude, this.priority);
}