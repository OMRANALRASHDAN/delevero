import 'package:delivero/model/category.dart';
import 'package:delivero/provider/products.dart';
import 'package:delivero/screen/cart.dart';
import 'package:delivero/screen/details.dart';
import 'package:delivero/widgets/dart/drawer.dart';
import 'package:delivero/widgets/dart/loading.dart';
import 'package:delivero/widgets/dart/product.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class CategoryScreen extends StatelessWidget {
  static const routeName = 'category';

  final CategoryModel categoryModel;

  const CategoryScreen({Key key, this.categoryModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<ProductProvider>(context,listen: false);
    final ProductId = ModalRoute.of(context).settings.arguments as String;
    final productProvider =
        Provider.of<ProductProvider>(context, listen: false).findById(ProductId);

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0.5,
        backgroundColor: Colors.amber,
        title: Text(
          "FoodApp",
        ),
        actions: <Widget>[
          Stack(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.of(context).pushNamed(CartScreen.routeName);
                },
              ),
            ],
          ),
        ],
      ),
      drawer: MainDrawer(),
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
              ClipRRect(
               borderRadius: BorderRadius.only(
                 bottomLeft: Radius.circular(15),
                 bottomRight: Radius.circular(15),
              ),
                child: Container(
                  height: 180,
                  width: double.infinity-30,

                  child: Image.network(
                    // placeholder: kTransparentImage,
                    productProvider.image,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                height: 180,
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
                    Colors.black.withOpacity(0.1),
                    Colors.black.withOpacity(0.05),
                    Colors.black.withOpacity(0.025),
                  ],
                )),
              ),
              Positioned.fill(
                  bottom: 40,
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        productProvider.name,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.w300,
                        ),
                      ))),
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
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            children: productsProvider.products
                .map((item) => GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(Details.routeName,arguments: item.id);
                      },
                      child: ProductWidget(
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
