
import 'package:delivero/model/cart_item.dart';
import 'package:flutter/cupertino.dart';

class UserModel with ChangeNotifier{



  String _name;
  String _email;
  String _id;
  String _stripeId;
  int _priceSum = 0;
  int _quantitySum = 0;


//  getters
  String get name => _name;
  String get email => _email;
  String get id => _id;
  String get stripeId => _stripeId;

//  public variable
  List<CartItemModel>cart=[];
  int totalCartPrice=0;

  void  AddItem(){

    notifyListeners();
  }

  // UserModel.fromSnapshot(DocumentSnapshot snapshot){
  //   _name = snapshot.data[NAME];
  //     _email = snapshot.data[EMAIL];
  //   _id = snapshot.data[ID];
  //   _stripeId = snapshot.data[STRIPE_ID];
  //   cart = _convertCartItems(snapshot.data[CART]) ?? [];
  //   totalCartPrice = snapshot.data[CART] == null ? 0 :getTotalPrice(cart: snapshot.data[CART]);
  // }

  int getTotalPrice({List cart}){
    if(cart == null){
      return 0;
    }
    for(Map cartItem in cart){
      _priceSum += cartItem["price"] * cartItem["quantity"];
    }

    int total = _priceSum;

    print("THE TOTAL IS $total");
    print("THE TOTAL IS $total");
    print("THE TOTAL IS $total");
    print("THE TOTAL IS $total");
    print("THE TOTAL IS $total");

    return total;
  }

 List<CartItemModel> _convertCartItems(List cart){
    List<CartItemModel> convertedCart = [];
    for(Map cartItem in cart){
      convertedCart.add(CartItemModel.fromMap(cartItem));
    }
    return convertedCart;
  }
}