class CartItemModel {
  static const ID = "id";
  static const NAME = "name";
  static const IMAGE = "image";
  static const PRODUCT_ID = "productId";
  static const QUANTITY = "quantity";
  static const PRICE = "price";
  static const RESTAURANT_ID = "restaurantId";
  static const TOTAL_RESTAURANT_SALES = "totalRestaurantSale";


  String id;
  String name;
  String image;
  String productId;
  String restaurantId;
  int totalRestaurantSale;
  int quantity;
  double price;

  CartItemModel({
    this.id,
    this.name,
    this.image, this.restaurantId, this.price, this.productId, this.quantity, this.totalRestaurantSale
  });

// //  getters
// String get id => _id;
//
// String get name => _name;
//
// String get image => _image;
//
// String get productId => _productId;
//
// String get restaurantId => _restaurantId;
//
// int get price => _price;
//
// int get totalRestaurantSale => _totalRestaurantSale;
//
// int get quantity => _quantity;
//
//
CartItemModel.fromMap(Map data){
  id = data[ID];
  name =  data[NAME];
  image =  data[IMAGE];
  productId = data[PRODUCT_ID];
  price = data[PRICE];
  quantity = data[QUANTITY];
  totalRestaurantSale = data[TOTAL_RESTAURANT_SALES];
  restaurantId = data[RESTAURANT_ID];
}

Map toMap() => {
  ID: id,
  IMAGE: image,
  NAME: name,
  PRODUCT_ID: productId,
  QUANTITY: quantity,
  PRICE: price,
  RESTAURANT_ID: restaurantId,
  TOTAL_RESTAURANT_SALES: totalRestaurantSale
};
}
