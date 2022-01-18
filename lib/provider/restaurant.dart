import 'package:flutter/material.dart';
import '../model/restaurant.dart';

class RestaurantProvider with ChangeNotifier {
  // RestaurantServices _restaurantServices = RestaurantServices();
  static const routeName = 'login-screen';

  List<RestaurantModel> restaurants = [
    RestaurantModel(id: '1',
        name: 'Alzain',
        popular: true,
        rating: 3.9,
        rates: 4,
        image:    'https://cdn.pixabay.com/photo/2018/07/10/21/23/pancake-3529653_1280.jpg',

        userLikes: [],
        avgPrice: 20000),

  ];
  List<RestaurantModel> searchedRestaurants = [];

  RestaurantModel restaurant;


  RestaurantModel findById(String id) {
    return restaurants.firstWhere((element) => element.id == id);
  }

  RestaurantProvider.initialize(){
    //  loadRestaurants();
  }

// loadRestaurants()async{
//   restaurants = await _restaurantServices.getRestaurants();
//   notifyListeners();
// }
//
// loadSingleRestaurant({String retaurantId}) async{
//   restaurant = await _restaurantServices.getRestaurantById(id: retaurantId);
//   notifyListeners();
// }
//
// Future search({String name})async{
//   searchedRestaurants = await _restaurantServices.searchRestaurant(restaurantName: name);
//   print("RESTOS ARE: ${searchedRestaurants.length}");
//   notifyListeners();
// }
}