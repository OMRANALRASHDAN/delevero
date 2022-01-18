import 'package:delivero/model/restaurant.dart';
import 'package:delivero/provider/restaurant.dart';
import 'package:delivero/screen/cart.dart';
import 'package:delivero/screen/editproduct.dart';
import 'package:delivero/widgets/dart/drawer.dart';
import 'package:delivero/widgets/dart/loading.dart';
import 'package:delivero/widgets/dart/prodmanag.dart';
import 'package:delivero/widgets/dart/product.dart';
import 'package:flutter/material.dart';
import '../model/category.dart';
import '../provider/products.dart';
import 'package:provider/provider.dart';

import 'details.dart';

class RestProManagment extends StatelessWidget {
  // RestaurantModel restaurantModel;
  static const routeName = 'restpromanagment';

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context,listen: false);
    final RestaurantId = ModalRoute.of(context).settings.arguments as String;
    final restaurantModel =
    Provider.of<RestaurantProvider>(context, listen: false)
        .findById('1');

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0.5,
        backgroundColor: Colors.amber,
        title: Text(
          "FoodApp",
        ),
        actions: <Widget>[
          Row(
            children: <Widget>[

              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed(EditProduct.routeName, arguments: null);
                },
              ),
            ],
          ),
        ],
      ),
      drawer:MainDrawer(),
      body: SafeArea(
          child: ListView(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Positioned.fill(
                      child: Align(
                        alignment: Alignment.center,
                        child: Loading(),
                      )),

                  // restaurant image
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                    child: Container(
                      height: 160,
                      width: double.infinity-30,
                      child: Image.network(
                        // placeholder: kTransparentImage,
                        restaurantModel.image,

                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  // fading black
                  Container(
                    height: 160,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                        ),
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black.withOpacity(0.6),
                            Colors.black.withOpacity(0.6),
                            Colors.black.withOpacity(0.6),
                            Colors.black.withOpacity(0.4),
                            Colors.black.withOpacity(0.06),
                            Colors.black.withOpacity(0.05),
                            Colors.black.withOpacity(0.025),
                          ],
                        )),
                  ),

                  //restaurant name
                  Positioned.fill(
                      bottom: 60,
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            restaurantModel.name,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 26,
                              fontWeight: FontWeight.w300,
                            ),
                          ))),

                  // average price
                  Positioned.fill(
                      bottom: 40,
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            "Average Price: \$" +
                                restaurantModel.avgPrice.toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                            ),
                          ))),

                  // rating widget
                  Positioned.fill(
                      bottom: 2,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Icon(
                                    Icons.star,
                                    color: Colors.yellow[900],
                                    size: 20,
                                  ),
                                ),
                                Text(restaurantModel.rating.toString()),
                              ],
                            ),
                          ),
                        ),
                      )),

                  // close button
                  Positioned.fill(
                      top: 5,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.black.withOpacity(0.2)),
                                child: Icon(
                                  Icons.close,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                      )),

                  //like button
                  Positioned.fill(
                      top: 5,
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: GestureDetector(
                            onTap: () {},
                            child: FlatButton(
                              child: Icon(Icons.favorite),
                              onPressed: () {},
                            ),
                          ),
                        ),
                      )),
                ],
              ),
              SizedBox(
                height: 10,
              ),

//              open & book section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    "Open",
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Container(
                      child: FlatButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.restaurant_menu),
                          label: Text("Book Now")))
                ],
              ),

              // products
              Column(
                children: productProvider.productsByRestaurant
                    .map((item) => GestureDetector(
                  onTap: () {
                    // changeScreen(
                    //     context,
                    //     Details(
                    //       product: item,
                    //     ));
                    // Navigator.of(context)
                    //     .pushNamed(EditProduct.routeName, arguments: item.id);
                  },
                  child: ProManagment(
                    product: item,
                  ),
                ))
                    .toList(),
              )
            ],
          )),
    );
  }
}
