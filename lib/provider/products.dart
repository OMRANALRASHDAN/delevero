import '../model/product.dart';
import 'package:flutter/material.dart';

class ProductProvider with ChangeNotifier {
  ProductProvider();
  List<ProductModel> products = [
  ProductModel(
  id:'1',
  name:'Classic Hamburger',
  image:    'https://cdn.pixabay.com/photo/2014/10/23/18/05/burger-500054_1280.jpg',

      price: 20000,
  category:'main food',
  featured:true,
  liked:true,
  rates:5,
  rating:4.2,
  restaurant:'Classic Hamburger',
  restaurantId: '1',
    description: 'this is a description'
  ),

  ProductModel(
  id:'2',
  name:'Salad with Smoked Salmon',
  image:
  'https://cdn.pixabay.com/photo/2016/10/25/13/29/smoked-salmon-salad-1768890_1280.jpg',
  price: 5400,
  category:'main food',
  featured:true,
  liked:true,
  rates:4,
  rating:3.9,
  restaurant:'Fast Fast',
  restaurantId:'2',
      description: 'this is a description'

  ),


  ProductModel(
  id:'3',
  name:'burger',
  image:     'https://cdn.pixabay.com/photo/2014/10/23/18/05/burger-500054_1280.jpg',

      price: 6400,
  category:'main food',
  featured:true,
  liked:false,
  rates:4,
  rating:4.9,
  restaurant:'burger house',
  restaurantId:'2',
      description: 'this is a description'

  ),
  ];

  List<ProductModel> productsByCategory = [

    ProductModel(
        id:'1',
        name:'Classic Hamburger',
        image:    'https://cdn.pixabay.com/photo/2014/10/23/18/05/burger-500054_1280.jpg',

        price: 20000,
        category:'main food',
        featured:true,
        liked:true,
        rates:5,
        rating:4.2,
        restaurant:'Classic Hamburger',
        restaurantId: '1',
        description: 'this is a description'
    ),

    ProductModel(
        id:'2',
        name:'Salad with Smoked Salmon',
        image:
        'https://cdn.pixabay.com/photo/2016/10/25/13/29/smoked-salmon-salad-1768890_1280.jpg',
        price: 5400,
        category:'main food',
        featured:true,
        liked:true,
        rates:4,
        rating:3.9,
        restaurant:'Fast Fast',
        restaurantId:'2',
        description: 'this is a description'

    ),


    ProductModel(
        id:'3',
        name:'burger',
        image:     'https://cdn.pixabay.com/photo/2014/10/23/18/05/burger-500054_1280.jpg',

        price: 6400,
        category:'main food',
        featured:true,
        liked:false,
        rates:4,
        rating:4.9,
        restaurant:'burger house',
        restaurantId:'2',
        description: 'this is a description'

    ),
  ];
  List<ProductModel> productsByRestaurant = [

    ProductModel(
        id:'1',
        name:'Classic Hamburger',
        image:    'https://cdn.pixabay.com/photo/2014/10/23/18/05/burger-500054_1280.jpg',

        price: 20000,
        category:'main food',
        featured:true,
        liked:true,
        rates:5,
        rating:4.2,
        restaurant:'Classic Hamburger',
        restaurantId: '1',
        description: 'this is a description'
    ),

    ProductModel(
        id:'2',
        name:'Salad with Smoked Salmon',
        image:
        'https://cdn.pixabay.com/photo/2016/10/25/13/29/smoked-salmon-salad-1768890_1280.jpg',
        price: 5400,
        category:'main food',
        featured:true,
        liked:true,
        rates:4,
        rating:3.9,
        restaurant:'Fast Fast',
        restaurantId:'2',
        description: 'this is a description'

    ),


    ProductModel(
        id:'3',
        name:'burger',
        image:     'https://cdn.pixabay.com/photo/2014/10/23/18/05/burger-500054_1280.jpg',

        price: 6400,
        category:'main food',
        featured:true,
        liked:false,
        rates:4,
        rating:4.9,
        restaurant:'burger house',
        restaurantId:'2',
        description: 'this is a description'

    ),

  ];
  List<ProductModel> productsSearched = [];

  List<ProductModel> get Products {
    return products.toList();
  }

  ProductModel findById(String id) {
    return products.firstWhere((element) => element.id == id);
  }
  void AddProduct(ProductModel Product){
    productsByRestaurant.add(Product);
    products.add(Product);

  }

  ProductProvider.initialize() {
    // loadProducts();
  }

  // loadProducts()async{
  //   products = await _productServices.getProducts();
  //   notifyListeners();
  // }
  //
  // Future loadProductsByCategory({String categoryName})async{
  //   productsByCategory = await _productServices.getProductsOfCategory(category: categoryName);
  //   notifyListeners();
  // }
  //
  // Future loadProductsByRestaurant({String restaurantId})async{
  //   productsByRestaurant = await _productServices.getProductsByRestaurant(id: restaurantId);
  //   notifyListeners();
  // }

//  likeDislikeProduct({String userId, ProductModel product, bool liked})async{
//    if(liked){
//      if(product.userLikes.remove(userId)){
//        _productServices.likeOrDislikeProduct(id: product.id, userLikes: product.userLikes);
//      }else{
//        print("THE USER WA NOT REMOVED");
//      }
//    }else{
//
//      product.userLikes.add(userId);
//        _productServices.likeOrDislikeProduct(id: product.id, userLikes: product.userLikes);
//
//
//      }
//  }

  Future search({String productName}) async {
    // productsSearched = await _productServices.searchProducts(productName: productName);
    print("THE NUMBER OF PRODUCTS DETECTED IS: ${productsSearched.length}");
    print("THE NUMBER OF PRODUCTS DETECTED IS: ${productsSearched.length}");
    print("THE NUMBER OF PRODUCTS DETECTED IS: ${productsSearched.length}");

    notifyListeners();
  }
}
