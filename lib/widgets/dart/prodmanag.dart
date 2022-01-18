import 'package:delivero/model/product.dart';
import 'package:delivero/provider/products.dart';
import 'package:delivero/screen/editproduct.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';


class ProManagment extends StatelessWidget {
  final ProductModel product;

  const ProManagment({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final restaurantProvider = Provider.of<RestaurantProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context,listen: false);


    return Padding(
      padding: const EdgeInsets.only(left: 4, right: 4, top: 4, bottom: 10),
      child: Container(
        height: 110,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey[300],
                  offset: Offset(-2, -1),
                  blurRadius: 5),
            ]
        ),
//            height: 160,
        child: Row(
          children: <Widget>[
            Container(
              width: 140,
              height: 120,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
                child: Image.network(product.image, fit: BoxFit.fill,),
              ),
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          product.name,
                          style: TextStyle(fontWeight:FontWeight.bold),
                        ),
                      ),

                    ],
                  ),

                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child:Row(children: [
                         Icon(Icons.price_check) , Text(
                            product.price.toString(),
                          ),

                        ],)
                      ),

                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 4),
                    //   child: Row(
                    //     children: <Widget>[
                    //       CustomText(text: "from: ", color: grey, weight: FontWeight.w300, size: 14,),
                    //       SizedBox(width: 10,),
                    //       GestureDetector(
                    //           onTap: ()async{
                    //             await productProvider.loadProductsByRestaurant(
                    //                 restaurantId: product.restaurantId.toString());
                    //             await restaurantProvider.loadSingleRestaurant(retaurantId: product.restaurantId.toString());
                    //             changeScreen(context, RestaurantScreen(restaurantModel: restaurantProvider.restaurant,));
                    //           },
                    //           child: CustomText(text: product.restaurant, color: primary, weight: FontWeight.w300, size: 14,)),
                    //
                    //   ],
                    // ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                        IconButton(
                          icon:Icon(Icons.edit,color: Colors.blue,) ,
                          onPressed: (){
                            Navigator.of(context)
                                .pushNamed(EditProduct.routeName, arguments: product.id);
                          },
                        ),
                          IconButton(
                            icon:Icon(Icons.delete,color: Colors.red,) ,

                          ),

                        ],
                      ),
                    ],
                  ),


                ],
              ),
            )
          ],
        ),)
      ,
    );
  }
}
