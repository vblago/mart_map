import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseApi {
  Database db;

  Future dbOpen() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'mart_map.db');
    db = await openDatabase(path);
  }

  Future<List<Map>> getStores(
      String text, String sex, String size, String sort) async {
    await dbOpen();
    String selectQuery =
        "SELECT DISTINCT store.id, store.num, store.name, store.latitude, store.longitude, store.phone, store.info, store.img_url, store.priority, store.avg_rate FROM store, stores_cat WHERE store.id = stores_cat.store_id AND stores_cat.category_id IN (SELECT id FROM cat_list WHERE name LIKE '%$text%'$sex$size) $sort";
    return await db.rawQuery(selectQuery);
  }

  Future<List<Map>> getStoreCategories(int id) async {
    String selectQuery =
        "SELECT cat_list.name, cat_list.sex, cat_list.size FROM cat_list, stores_cat WHERE cat_list.id = stores_cat.category_id AND stores_cat.store_id = $id";
    return await db.rawQuery(selectQuery);
  }

  Future<List<Map>> getStoreReviews(int id) async {
    String selectQuery =
        "SELECT review.store_id, user.login, review.rate, review.info FROM review, user WHERE review.user_id = user.id AND review.store_id = $id";
    return await db.rawQuery(selectQuery);
  }

  Future createDatabase() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'mart_map.db');
    await deleteDatabase(path);

    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE store (id INTEGER PRIMARY KEY, num TEXT, name TEXT, latitude REAL, longitude REAL, phone TEXT, info TEXT, img_url TEXT, priority INTEGER, avg_rate REAL)');
      await db.execute(
          'CREATE TABLE review (store_id INTEGER, user_id INTEGER, rate INTEGER, info TEXT)');
      await db.execute(
          'CREATE TABLE user (id INTEGER, register_date DATE, login TEXT, phone TEXT, email TEXT, password TEXT)');
      await db.execute(
          'CREATE TABLE cat_list (id INTEGER, name TEXT, sex INTEGER, size INTEGER)');
      await db.execute(
          'CREATE TABLE stores_cat (store_id INTEGER, category_id INTEGER)');
    });

    await database.transaction((txn) async {
      await txn.rawInsert(
          "INSERT INTO store(id, num, name, latitude, longitude, phone, info, img_url, priority, avg_rate) VALUES(0, 'AYF 173', 'Rica Mare', 50.003098, 36.306834, '+38 (095) 345 2345', 'Наша команда дизайнеров тщательно отслеживает последние модные тенденции, ищет свежие стилевые решения и новые формы. Таким образом, одежда RicaMare всегда актуальна и современна, что прекрасные покупательницы не могут не оценить!', 'https://evdress.com/upload/adv_mat/ricamare-br-front.jpg', 1, 4.5)");
      await txn.rawInsert(
          "INSERT INTO store(id, num, name, latitude, longitude, phone, info, img_url, priority, avg_rate) VALUES(1, 'BDJ 384', 'ООО «ЗимаЛето»', 50.003622, 36.306378, '+38 (066) 535 9841', 'Вас приветствует ООО «ЗимаЛето»! В связи с расширением нашего бизнеса, в 2016 году была основана  ООО «ЗимаЛето». Не смотря на молодость нашей компании мы около 10 лет УСПЕШНО занимаемся оптовой и розничной продажей мужской и женской верхней одежды от известных брендовых фабрик HERMZI', 'http://fashion-man.kh.ua/image/catalog/aboutus/1.jpg', 0, 4.5)");
      await txn.rawInsert(
          "INSERT INTO store(id, num, name, latitude, longitude, phone, info, img_url, priority, avg_rate) VALUES(2, 'JDB 938', 'Фабрика', 50.003074, 36.306268, '+38 (067) 678 03952', 'Команда модельеров-конструкторов постоянно разрабатывает новые коллекции, внедряет смелые идеи, следит за развитием моды и технологий. Фабрика работает по принципу «красиво и удобно», а интеллектуальный потенциал сотрудников позволяет воплощать в жизнь идеи достаточно быстро.', 'http://www.mtf.com.ua/images/stores/harkiv-barabashova.jpg', 0, 3.5)");
      await txn.rawInsert(
          "INSERT INTO store(id, num, name, latitude, longitude, phone, info, img_url, priority, avg_rate) VALUES(3, 'NDG 362', 'Де - Виктори', 50.003403, 36.306072, '+38 (097) 945 9643', 'Де - Виктори - известный крупный представитель производства женской одежды на территории Украины. Предприятие производит продукцию высокого качества по доступным ценам и реализует любые оптовые поставки по всем направлениям Украины и ближнего зарубежья.', 'http://fashionindustry.com.ua/media/address/201fdufcepmy1384965634.jpg', 1, 5)");
      await txn.rawInsert(
          "INSERT INTO store(id, num, name, latitude, longitude, phone, info, img_url, priority, avg_rate) VALUES(4, 'LAF 375', 'Mirage Style', 50.002791, 36.305629, '+38 (095) 3757 4756', 'Наша команда дизайнеров тщательно отслеживает последние модные тенденции, ищет свежие стилевые решения и новые формы. Таким образом, одежда RicaMare всегда актуальна и современна, что прекрасные покупательницы не могут не оценить!', 'http://mirage-style.com.ua/wa-data/public/site/img/IMG_2476-1.JPG.pagespeed.ce.dq9HtYcPgO.jpg', 0, 4)");
      await txn.rawInsert(
          "INSERT INTO store(id, num, name, latitude, longitude, phone, info, img_url, priority, avg_rate) VALUES(5, 'MJG 735', 'B-planet', 50.002813, 36.306485, '+38 (099) 369 9365', 'Коллекция мужской верхней одежды от производителя B-planet – это симбиоз элегантности, неизменно высокого качества и приятных цен. Каталог производителя включает десятки разнообразных моделей осенних и зимних мужских курток и пальто, пиджаков и спортивных анораков, предназначенных для представителей сильного пола различной комплекции и возрастных групп.', 'http://b-planet.com.ua/Multimedia/Images/Magazin-b-planet-1.jpg', 0, 5)");
      await txn.rawInsert(
          "INSERT INTO store(id, num, name, latitude, longitude, phone, info, img_url, priority, avg_rate) VALUES(6, 'AKN 23', 'UaMode', 50.003369, 36.307075, '+38 (066) 005 02650', 'Мы производственно-торговая компания, специализирующаяся на пошиве модной, молодежной женской одежды, которая за 15 лет на рынке Украины, и стран ближнего зарубежья завоевала доверие и любовь покупателей.', 'https://s.optlist.ru/i/47/20/14bde1e34d6ed005-4720-1-w250.jpg', 0, 3)");
    });

    await database.transaction((txn) async {
//      await txn.rawInsert("INSERT INTO review(store_id, user_id, rate, info) VALUES(, 0, 5, 'Супер обслуживание! Всем рекомендую!')");
//      await txn.rawInsert("INSERT INTO review(store_id, user_id, rate, info) VALUES(, 1, 4, 'Хороший магазин, но большие очереди.')");
//      await txn.rawInsert("INSERT INTO review(store_id, user_id, rate, info) VALUES(, 2, 3, 'Неплохо, но можно и лучше.')");
//      await txn.rawInsert("INSERT INTO review(store_id, user_id, rate, info) VALUES(, 3, 2, 'Плохо, больше сюда не прийду.')");
//      await txn.rawInsert("INSERT INTO review(store_id, user_id, rate, info) VALUES(, 4, 1, 'Ужас! Никому не рекомендую!')");
//      await txn.rawInsert("INSERT INTO review(store_id, user_id, rate, info) VALUES(, 5, 5, 'Огромный асортимент и приятные цены.')");
//      await txn.rawInsert("INSERT INTO review(store_id, user_id, rate, info) VALUES(, 6, 5, 'Очень качественная ткань.')");
//      await txn.rawInsert("INSERT INTO review(store_id, user_id, rate, info) VALUES(, 7, 4, 'Дисконт радует, а так цены немного завышены.')");
      await txn.rawInsert(
          "INSERT INTO review(store_id, user_id, rate, info) VALUES(0, 0, 5, 'Супер обслуживание! Всем рекомендую!')");
      await txn.rawInsert(
          "INSERT INTO review(store_id, user_id, rate, info) VALUES(0, 2, 3, 'Неплохо, но можно и лучше.')");
      await txn.rawInsert(
          "INSERT INTO review(store_id, user_id, rate, info) VALUES(0, 5, 5, 'Огромный асортимент и приятные цены.')");
      await txn.rawInsert(
          "INSERT INTO review(store_id, user_id, rate, info) VALUES(0, 6, 5, 'Очень качественная ткань.')");
      await txn.rawInsert(
          "INSERT INTO review(store_id, user_id, rate, info) VALUES(1, 0, 5, 'Супер обслуживание! Всем рекомендую!')");
      await txn.rawInsert(
          "INSERT INTO review(store_id, user_id, rate, info) VALUES(1, 2, 3, 'Неплохо, но можно и лучше.')");
      await txn.rawInsert(
          "INSERT INTO review(store_id, user_id, rate, info) VALUES(2, 3, 2, 'Плохо, больше сюда не прийду.')");
      await txn.rawInsert(
          "INSERT INTO review(store_id, user_id, rate, info) VALUES(2, 7, 4, 'Дисконт радует, а так цены немного завышены.')");
      await txn.rawInsert(
          "INSERT INTO review(store_id, user_id, rate, info) VALUES(3, 0, 5, 'Супер обслуживание! Всем рекомендую!')");
      await txn.rawInsert(
          "INSERT INTO review(store_id, user_id, rate, info) VALUES(4, 6, 5, 'Очень качественная ткань.')");
      await txn.rawInsert(
          "INSERT INTO review(store_id, user_id, rate, info) VALUES(4, 2, 3, 'Неплохо, но можно и лучше.')");
      await txn.rawInsert(
          "INSERT INTO review(store_id, user_id, rate, info) VALUES(5, 5, 5, 'Огромный асортимент и приятные цены.')");
      await txn.rawInsert(
          "INSERT INTO review(store_id, user_id, rate, info) VALUES(5, 6, 5, 'Очень качественная ткань.')");
      await txn.rawInsert(
          "INSERT INTO review(store_id, user_id, rate, info) VALUES(6, 4, 1, 'Ужас! Никому не рекомендую!')");
      await txn.rawInsert(
          "INSERT INTO review(store_id, user_id, rate, info) VALUES(6, 5, 5, 'Огромный асортимент и приятные цены.')");
    });

    await database.transaction((txn) async {
      await txn.rawInsert(
          "INSERT INTO user(id, register_date, login, phone, email, password) VALUES(0, '2018-11-14', 'Дмитрий', '+38 (095) 345 2345', 'user@gmail.com', 'user_pass')");
      await txn.rawInsert(
          "INSERT INTO user(id, register_date, login, phone, email, password) VALUES(1, '2018-11-14', 'Иван', '+38 (095) 345 2345', 'user@gmail.com', 'user_pass')");
      await txn.rawInsert(
          "INSERT INTO user(id, register_date, login, phone, email, password) VALUES(2, '2018-11-14', 'Елена', '+38 (095) 345 2345', 'user@gmail.com', 'user_pass')");
      await txn.rawInsert(
          "INSERT INTO user(id, register_date, login, phone, email, password) VALUES(3, '2018-11-14', 'Николай', '+38 (095) 345 2345', 'user@gmail.com', 'user_pass')");
      await txn.rawInsert(
          "INSERT INTO user(id, register_date, login, phone, email, password) VALUES(4, '2018-11-14', 'Валентина', '+38 (095) 345 2345', 'user@gmail.com', 'user_pass')");
      await txn.rawInsert(
          "INSERT INTO user(id, register_date, login, phone, email, password) VALUES(5, '2018-11-14', 'Саша', '+38 (095) 345 2345', 'user@gmail.com', 'user_pass')");
      await txn.rawInsert(
          "INSERT INTO user(id, register_date, login, phone, email, password) VALUES(6, '2018-11-14', 'Еврений', '+38 (095) 345 2345', 'user@gmail.com', 'user_pass')");
      await txn.rawInsert(
          "INSERT INTO user(id, register_date, login, phone, email, password) VALUES(7, '2018-11-14', 'Даниил', '+38 (095) 345 2345', 'user@gmail.com', 'user_pass')");
    });

    await database.transaction((txn) async {
      await txn.rawInsert(
          "INSERT INTO cat_list(id, name, sex, size) VALUES(0, 'Куртки', 0, 1)");
      await txn.rawInsert(
          "INSERT INTO cat_list(id, name, sex, size) VALUES(1, 'Куртки', 1, 1)");
      await txn.rawInsert(
          "INSERT INTO cat_list(id, name, sex, size) VALUES(2, 'Сапоги', 0, 1)");
      await txn.rawInsert(
          "INSERT INTO cat_list(id, name, sex, size) VALUES(3, 'Кофты', 1, 1)");
      await txn.rawInsert(
          "INSERT INTO cat_list(id, name, sex, size) VALUES(4, 'Ремни', 1, 1)");
      await txn.rawInsert(
          "INSERT INTO cat_list(id, name, sex, size) VALUES(5, 'Ремни', 1, 0)");
      await txn.rawInsert(
          "INSERT INTO cat_list(id, name, sex, size) VALUES(6, 'Очки', 0, 1)");
      await txn.rawInsert(
          "INSERT INTO cat_list(id, name, sex, size) VALUES(7, 'Блузки', 0, 1)");
      await txn.rawInsert(
          "INSERT INTO cat_list(id, name, sex, size) VALUES(8, 'Туфли', 0, 1)");
      await txn.rawInsert(
          "INSERT INTO cat_list(id, name, sex, size) VALUES(9, 'Сумки', 0, 1)");
      await txn.rawInsert(
          "INSERT INTO cat_list(id, name, sex, size) VALUES(10, 'Ремни', 0, 1)");
    });

    await database.transaction((txn) async {
      await txn.rawInsert(
          "INSERT INTO stores_cat(store_id, category_id) VALUES(0, 0)");
      await txn.rawInsert(
          "INSERT INTO stores_cat(store_id, category_id) VALUES(0, 9)");
      await txn.rawInsert(
          "INSERT INTO stores_cat(store_id, category_id) VALUES(0, 8)");
      await txn.rawInsert(
          "INSERT INTO stores_cat(store_id, category_id) VALUES(0, 7)");
      await txn.rawInsert(
          "INSERT INTO stores_cat(store_id, category_id) VALUES(0, 2)");
      await txn.rawInsert(
          "INSERT INTO stores_cat(store_id, category_id) VALUES(1, 1)");
      await txn.rawInsert(
          "INSERT INTO stores_cat(store_id, category_id) VALUES(2, 0)");
      await txn.rawInsert(
          "INSERT INTO stores_cat(store_id, category_id) VALUES(2, 9)");
      await txn.rawInsert(
          "INSERT INTO stores_cat(store_id, category_id) VALUES(2, 8)");
      await txn.rawInsert(
          "INSERT INTO stores_cat(store_id, category_id) VALUES(2, 7)");
      await txn.rawInsert(
          "INSERT INTO stores_cat(store_id, category_id) VALUES(2, 2)");
      await txn.rawInsert(
          "INSERT INTO stores_cat(store_id, category_id) VALUES(2, 10)");
      await txn.rawInsert(
          "INSERT INTO stores_cat(store_id, category_id) VALUES(3, 0)");
      await txn.rawInsert(
          "INSERT INTO stores_cat(store_id, category_id) VALUES(3, 10)");
      await txn.rawInsert(
          "INSERT INTO stores_cat(store_id, category_id) VALUES(4, 0)");
      await txn.rawInsert(
          "INSERT INTO stores_cat(store_id, category_id) VALUES(5, 0)");
      await txn.rawInsert(
          "INSERT INTO stores_cat(store_id, category_id) VALUES(5, 8)");
      await txn.rawInsert(
          "INSERT INTO stores_cat(store_id, category_id) VALUES(5, 7)");
      await txn.rawInsert(
          "INSERT INTO stores_cat(store_id, category_id) VALUES(5, 2)");
      await txn.rawInsert(
          "INSERT INTO stores_cat(store_id, category_id) VALUES(6, 0)");
      await txn.rawInsert(
          "INSERT INTO stores_cat(store_id, category_id) VALUES(6, 6)");
      await txn.rawInsert(
          "INSERT INTO stores_cat(store_id, category_id) VALUES(6, 3)");
    });

    await database.close();
  }
}
