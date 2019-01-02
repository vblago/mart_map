import 'package:mart_map/data/db/entities/Category.dart';
import 'package:mart_map/data/db/entities/Review.dart';
import 'package:mart_map/data/db/entities/Store.dart';
import 'package:mart_map/data/db/database.dart';
import 'package:mart_map/domain/managers/entities/search_parameters.dart';

class DBManager {
  DatabaseApi databaseApi = DatabaseApi();
  final int TOPQUANTITY = 5;

  Future<List<Store>> getStores(SearchParameters params) async{
    String text = "", sex = "", size = "", sort = "";
    if (params.text != null){
      text = params.text;
    }
    if (params.sex != null) {
      sex = " AND sex = '" + params.sex.toString() + "'";
    }
    if (params.size != null) {
      size = " AND size = '" + params.size.toString() + "'";
    }
    if (params.sort != null) {
      sort = "ORDER BY ";
      if (params.sort == 0) {
        sort += "num ASC";
      } else if (params.sort == 1) {
        sort += "num DESC";
      } else if (params.sort == 2) {
        sort += "name ASC";
      } else if (params.sort == 3) {
        sort += "name DESC";
      }
    }
    List<Store> stores = Store.parse(await databaseApi.getStores(text, sex, size, sort));
    List<Store> fullStores = new List();

    for (int i = 0; i < stores.length; i++){
      stores[i].categories = Category.parse(await databaseApi.getStoreCategories(stores[i].id));
      stores[i].reviews = Review.parse(await databaseApi.getStoreReviews(stores[i].id));
      fullStores.add(stores[i]);
    }
    return fullStores;
  }

  Future<List<Store>> getTopCategoriesStores() async{
    List<Store> stores = Store.parse(await databaseApi.getTopCategoriesStores(TOPQUANTITY));
    List<Store> fullStores = new List();

    for (int i = 0; i < stores.length; i++){
      stores[i].categories = Category.parse(await databaseApi.getStoreCategories(stores[i].id));
      fullStores.add(stores[i]);
    }
    return fullStores;
  }
}
