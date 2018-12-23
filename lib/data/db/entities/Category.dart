class Category{
  String name;
  int sex;
  int size;

  Category(this.name, this.sex, this.size);

  static List<Category> parse(List<Map> inList){
    List<Category> outList = new List();
    inList.forEach((Map map){
      outList.add(Category(map['name'], map['sex'], map['size']));
    });
    return outList;
  }
}