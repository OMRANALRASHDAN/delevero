import 'package:delivero/model/product.dart';
import 'package:delivero/provider/products.dart';
import 'package:delivero/provider/user.dart';
import 'package:delivero/screen/cart.dart';
import 'package:delivero/widgets/dart/loading.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';


class Details extends StatefulWidget {
  // final ProductModel product;
  static const routeName = 'details';

  // const Details({this.product});

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  int quantity = 1;
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
     final user = Provider.of<UserProvider>(context,listen: false);
    // final app = Provider.of<AppProvider>(context);
    final ProductId = ModalRoute.of(context).settings.arguments as String;
    final product =
    Provider.of<ProductProvider>(context, listen: false).findById(ProductId);
    return Scaffold(
      key: _key,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.of(context).pushNamed(CartScreen.routeName);

            },
          ),
        ],
        leading: IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        // child: app.isLoading ? Loading() :
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 120,
              backgroundImage: NetworkImage(product.image),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              product.name,
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            Text(
              "\$${product.price / 100}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Description",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
              product.description,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w300),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                      icon: Icon(
                        Icons.remove,
                        size: 36,
                      ),
                      onPressed: () {
                        if (quantity != 1) {
                          setState(() {
                            quantity -= 1;
                          });
                        }
                      }),
                ),
                GestureDetector(
                  onTap: ()  {
                     // app.changeLoading();
                     // print("All set loading");

                    user.AddItem( product.id, quantity);
                    Navigator.of(context).pop();
                    print(user.userModel.cart.length
                    );
                    // if(value){
                    //   print("Item added to cart");
                    //   _key.currentState.showSnackBar(
                    //       SnackBar(content: Text("Added ro Cart!"))
                    //   );
                    //   user.reloadUserModel();
                    //   app.changeLoading();
                    //   return;
                    // } else{
                    //   print("Item NOT added to cart");
                    //
                    // }
                    //  print("lOADING SET TO FALSE");
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(20)),
                    // child: app.isLoading
                    //     ? Loading()
                    //     :
                  child:  Padding(
                            padding: const EdgeInsets.fromLTRB(28, 12, 28, 12),
                            child: Text(
                              "Add $quantity To Cart",
                              style: TextStyle( color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w300,),

                            ),
                          ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                      icon: Icon(
                        Icons.add,
                        size: 36,
                        color: Colors.amber,
                      ),
                      onPressed: () {
                        setState(() {
                          quantity += 1;
                        });
                      }),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
