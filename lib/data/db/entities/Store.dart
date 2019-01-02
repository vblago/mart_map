import 'package:mart_map/data/db/entities/Category.dart';
import 'package:mart_map/data/db/entities/Review.dart';
import 'package:mart_map/domain/managers/entities/search_parameters.dart';

class Store {
  int id;
  String name;
  String num;
  String phone;
  double rate;
  String picUrl;
  double latitude;
  double longitude;
  String description;
  List<Category> categories;
  List<Review> reviews;
  bool priority;
  double avgRate;

  String get categoriesInfo{
    SearchParameters searchParameters = new SearchParameters();
    String categoriesStr = '';
    categories.forEach((Category category){
      categoriesStr += "${category.name} (${searchParameters.sexDescriptions[category.sex]}, ${searchParameters.sizeDescriptions[category.size]}); ";
    });
    return categoriesStr;
  }

  Store(
      this.id,
      this.name,
      this.num,
      this.rate,
      this.description,
      this.phone,
      this.latitude,
      this.longitude,
      this.picUrl,
      this.priority);

  static List<Store> parse(List<Map> inList) {
    List<Store> outList = new List();
    inList.forEach((Map map) {
      outList.add(Store(
          map['id'],
          map['name'],
          map['num'],
          map['avg_rate'],
          map['info'],
          map['phone'],
          map['latitude'],
          map['longitude'],
          map['img_url'],
          map['priority'] == 1 ? true : false));
    });
    return outList;
  }
}
