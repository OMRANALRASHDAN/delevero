import 'dart:async';
import 'package:delivero/model/cart_item.dart';
import 'package:delivero/model/order.dart';
import 'package:delivero/model/product.dart';
import 'package:delivero/model/user.dart';
import 'package:delivero/provider/products.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';


enum Status{Uninitialized, Authenticated, Authenticating, Unauthenticated}

class UserProvider with ChangeNotifier{
  // FirebaseAuth _auth;
  // FirebaseUser _user;
  // Status _status = Status.Uninitialized;
  // Firestore _firestore = Firestore.instance;
  // UserServices _userServicse = UserServices();
  // OrderServices _orderServices = OrderServices();
  UserModel _userModel=UserModel();

//  getter
  UserModel get userModel => _userModel;
  // Status get status => _status;
  // FirebaseUser get user => _user;

  // public variables
  List<OrderModel> orders = [];

  final formkey = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();

//
  UserProvider.initialize(){
    // _auth.onAuthStateChanged.listen(_onStateChanged);
  }

  void AddItem(String ProdID, int quantityy) {
    final product =new ProductProvider().findById(ProdID);
    print(product.id);
    if (!userModel.cart.contains(ProdID)) {
     userModel.cart.add(
         CartItemModel(
             id: DateTime.now().toString()
             ,name: product.name
             ,restaurantId: product.restaurantId
             ,price:product.price
             ,image:product.image ,
             productId: product.id,
             quantity: quantityy,
             totalRestaurantSale: 12
         ),
       );
     userModel.AddItem();
      notifyListeners();
    }
      notifyListeners();
    }

//
//   Future<bool> signIn()async{
//     try{
//       _status = Status.Authenticating;
//       notifyListeners();
//       await _auth.signInWithEmailAndPassword(email: email.text.trim(), password: password.text.trim());
//       return true;
//     }catch(e){
//       _status = Status.Unauthenticated;
//       notifyListeners();
//       print(e.toString());
//       return false;
//     }
//   }
//
//
//   Future<bool> signUp()async{
//     try{
//       _status = Status.Authenticating;
//       notifyListeners();
//       await _auth.createUserWithEmailAndPassword(email: email.text.trim(), password: password.text.trim()).then((result){
//         _firestore.collection('users').document(result.user.uid).setData({
//           'name':name.text,
//           'email':email.text,
//           'uid':result.user.uid,
//           "likedFood": [],
//           "likedRestaurants": []
//         });
//       });
//       return true;
//     }catch(e){
//       _status = Status.Unauthenticated;
//       notifyListeners();
//       print(e.toString());
//       return false;
//     }
//   }
//
//   Future signOut()async{
//     _auth.signOut();
//     _status = Status.Unauthenticated;
//     notifyListeners();
//     return Future.delayed(Duration.zero);
//   }
//
//   void clearController(){
//     name.text = "";
//     password.text = "";
//     email.text = "";
//   }
//
//   Future<void> reloadUserModel()async{
//     _userModel = await _userServicse.getUserById(user.uid);
//     notifyListeners();
//   }
//
//
//   Future<void> _onStateChanged(FirebaseUser firebaseUser) async{
//     if(firebaseUser == null){
//       _status = Status.Unauthenticated;
//     }else{
//       _user = firebaseUser;
//       _status = Status.Authenticated;
//       _userModel = await _userServicse.getUserById(user.uid);
//     }
//     notifyListeners();
//   }
//
//   Future<bool> addToCard({ProductModel product, int quantity})async{
//     print("THE PRODUC IS: ${product.toString()}");
//     print("THE qty IS: ${quantity.toString()}");
//
//     try{
//       var uuid = Uuid();
//       String cartItemId = uuid.v4();
//       List cart = _userModel.cart;
// //      bool itemExists = false;
//       Map cartItem ={
//         "id": cartItemId,
//         "name": product.name,
//         "image": product.image,
//         "restaurantId": product.restaurantId,
//         "totalRestaurantSale": product.price * quantity,
//         "productId": product.id,
//         "price": product.price,
//         "quantity": quantity
//       };
//
//         CartItemModel item = CartItemModel.fromMap(cartItem);
// //      if(!itemExists){
//         print("CART ITEMS ARE: ${cart.toString()}");
//         _userServicse.addToCart(userId: _user.uid, cartItem: item);
// //      }
//
//
//
//       return true;
//     }catch(e){
//       print("THE ERROR ${e.toString()}");
//       return false;
//     }
//
//   }
//
//   getOrders()async{
//     orders = await _orderServices.getUserOrders(userId: _user.uid);
//     notifyListeners();
//   }
//
//   Future<bool> removeFromCart({CartItemModel cartItem})async{
//     print("THE PRODUC IS: ${cartItem.toString()}");
//
//     try{
//       _userServicse.removeFromCart(userId: _user.uid, cartItem: cartItem);
//       return true;
//     }catch(e){
//       print("THE ERROR ${e.toString()}");
//       return false;
//     }
//
//   }
}