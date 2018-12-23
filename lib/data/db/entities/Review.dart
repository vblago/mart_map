class Review{
  String userName;
  int rate;
  String description;

  Review(this.userName, this.rate, this.description);

  static List<Review> parse(List<Map> inList){
    List<Review> outList = new List();
    inList.forEach((Map map){
      outList.add(Review(map['login'], map['rate'], map['info']));
    });
    return outList;
  }
}