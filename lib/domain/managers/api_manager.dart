import 'package:mart_map/data/db/entities/Store.dart';
import 'package:mart_map/data/db/entities/Review.dart';

class ApiManager {

  ApiManager();

  Future<List> getData() async {
    return new List();
  }

  List<Store> getPoints() {
    List<Store> points = new List();
    List<String> categories = List();

    categories.add("Куртки");
    categories.add("Сумки");
    categories.add("Туфли");
    categories.add("Блузки");
    categories.add("Ремешки");
    categories.add("Сапоги");

//    points.add(new Store("Rica Mare", "AYF 173", 4.5,
//        "https://evdress.com/upload/adv_mat/ricamare-br-front.jpg",
//        "Наша команда дизайнеров тщательно отслеживает последние модные тенденции, ищет свежие стилевые решения и новые формы. "
//            "Таким образом, одежда RicaMare всегда актуальна и современна, что прекрасные покупательницы не могут не оценить!",
//        ["Куртки", "Сумки", "Туфли", "Блузки", "Сапоги"], [0, 2, 5, 6], "+38 (095) 345 2345", 50.003098, 36.306834, true));
//
//    points.add(new Store("ООО «ЗимаЛето»", "BDJ 384", 4.5,
//        "http://fashion-man.kh.ua/image/catalog/aboutus/1.jpg",
//        "Вас приветствует ООО «ЗимаЛето»! В связи с расширением нашего бизнеса, в 2016 году была основана  ООО «ЗимаЛето». "
//            "Не смотря на молодость нашей компании мы около 10 лет УСПЕШНО занимаемся оптовой и розничной продажей мужской и женской верхней одежды от известных брендовых фабрик HERMZI",
//        ["Куртки"], [0, 2], "+38 (095) 345 2345", 50.003622, 36.306378, false));
//
//    points.add(new Store("Фабрика", "JDB 938", 3.5,
//        "http://www.mtf.com.ua/images/stores/harkiv-barabashova.jpg",
//        "Команда модельеров-конструкторов постоянно разрабатывает новые коллекции, внедряет смелые идеи, следит за развитием моды и технологий. "
//            "Фабрика работает по принципу «красиво и удобно», а интеллектуальный потенциал сотрудников позволяет воплощать в жизнь идеи достаточно быстро. ",
//        ["Куртки", "Сумки", "Туфли", "Блузки", "Сапоги", "Ремешки"], [3, 7], "+38 (095) 345 2345", 50.003074, 36.306268, false));
//
//    points.add(new Store("Де - Виктори", "NDG 362", 5,
//        "http://fashionindustry.com.ua/media/address/201fdufcepmy1384965634.jpg",
//        "Де - Виктори - известный крупный представитель производства женской одежды на территории Украины. Предприятие производит продукцию высокого качества по доступным ценам и реализует любые оптовые поставки по всем направлениям Украины и ближнего зарубежья.",
//        ["Куртки", "Ремешки"], [0], "+38 (095) 345 2345", 50.003403, 36.306072, true));
//
//    points.add(new Store("Mirage Style", "LAF 375", 4,
//        "http://mirage-style.com.ua/wa-data/public/site/img/IMG_2476-1.JPG.pagespeed.ce.dq9HtYcPgO.jpg",
//        "Наша команда дизайнеров тщательно отслеживает последние модные тенденции, ищет свежие стилевые решения и новые формы. "
//            "Таким образом, одежда RicaMare всегда актуальна и современна, что прекрасные покупательницы не могут не оценить!",
//        ["Куртки"], [6, 2], "+38 (095) 345 2345", 50.002791, 36.305629, false));
//
//    points.add(new Store("B-planet", "MJG 735", 5,
//        "http://b-planet.com.ua/Multimedia/Images/Magazin-b-planet-1.jpg",
//        "Коллекция мужской верхней одежды от производителя B-planet – это симбиоз элегантности, неизменно высокого качества и приятных цен. "
//            "Каталог производителя включает десятки разнообразных моделей осенних и зимних мужских курток и пальто, пиджаков и спортивных анораков, предназначенных для представителей сильного пола различной комплекции и возрастных групп.",
//        ["Куртки","Туфли", "Блузки", "Сапоги"], [5, 6], "+38 (095) 345 2345", 50.002813, 36.306485, false));
//
//    points.add(new Store("UaMode", "AKN 23", 3,
//        "https://s.optlist.ru/i/47/20/14bde1e34d6ed005-4720-1-w250.jpg",
//        "Мы производственно-торговая компания, специализирующаяся на пошиве модной, молодежной женской одежды, которая за 15 лет на рынке Украины,"
//            " и стран ближнего зарубежья завоевала доверие и любовь покупателей.",
//        ["Сумки", "Сапоги", "Ремешки"], [4, 5], "+38 (095) 345 2345", 50.003369, 36.307075, false));

    return points;
  }

  List<Review> getReviews(){
    List<Review> reviews = new List();

    reviews.add(new Review("Дмитрий", 5, "Супер обслуживание! Всем рекомендую!"));
    reviews.add(new Review("Иван", 4, "Хороший магазин, но большие очереди."));
    reviews.add(new Review("Елена", 3, "Неплохо, но можно и лучше."));
    reviews.add(new Review("Николай", 2, "Плохо, больше сюда не прийду."));
    reviews.add(new Review("Валентина", 1, "Ужас! Никому не рекомендую!"));
    reviews.add(new Review("Саша", 5, "Огромный асортимент и приятные цены."));
    reviews.add(new Review("Еврений", 5, "Очень качественная ткань."));
    reviews.add(new Review("Даниил", 4, "Дисконт радует, а так цены немного завышены."));

    return reviews;
  }

}
