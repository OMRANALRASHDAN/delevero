class ProductModel {
  static const ID = "id";
  static const NAME = "name";
  static const RATING = "rating";
  static const IMAGE = "image";
  static const PRICE = "price";
  static const RESTAURANT_ID = "restaurantId";
  static const RESTAURANT = "restaurant";
  static const DESCRIPTION = "description";
  static const CATEGORY = "category";
  static const FEATURED = "featured";
  static const RATES = "rates";
  static const USER_LIKES = "userLikes";

  String id;
  String name;
  String restaurantId;
  String restaurant;
  String category;
  String image;
  String description;
  double rating;
  double price;
  int rates;
  bool featured;

  // public variable
  bool liked = false;

  ProductModel(
      {this.id,
      this.name,
      this.category,
      this.description,
      this.image,
      this.price,
      this.restaurantId,
      this.restaurant,
      this.rating,
      this.rates,
      this.featured,
      this.liked});

}
