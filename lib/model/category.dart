
class CategoryModel {
  static const ID = "id";
  static const NAME = "name";
  static const IMAGE = "image";

  String id;
  String name;
  String image;

  //  getters
  // int get id => _id;
  //
  // String get name => _name;
  //
  // String get image => _image;
  CategoryModel({this.id,this.name,this.image});
  //
  // CategoryModel.fromSnapshot(DocumentSnapshot snapshot){
  //   _id = snapshot.data[ID];
  //   _name = snapshot.data[NAME];
  //   _image = snapshot.data[IMAGE];
  // }
}
