class RestaurantModel {
  static const ID = "id";
  static const NAME = "name";
  static const AVG_PRICE = "avgPrice";
  static const RATING = "rating";
  static const RATES = "rates";
  static const IMAGE = "image";
  static const POPULAR = "popular";
  static const USER_LIKES = "userLikes";

  String id;
  String name;
  String image;
  List<String> userLikes;
  double rating;
  double avgPrice;
  bool popular;
  int rates;

  RestaurantModel(
      {this.id,
      this.name,
      this.image,
      this.rates,
      this.rating,
      this.userLikes,
      this.avgPrice,
      this.popular});
//  getters
//   String get id => _id;
//
//   String get name => _name;
//
//   String get image => _image;
//
//   List<String> get userLikes => _userLikes;
//
//   double get avgPrice => _avgPrice;
//
//   double get rating => _rating;
//
//   bool get popular => _popular;
//
//   int get rates => _rates;
//
//   // public variable
//   bool liked = false;

}
