import 'package:delivero/provider/category.dart';
import 'package:delivero/provider/restaurant.dart';
import 'package:delivero/screen/cart.dart';
import 'package:delivero/screen/category.dart';
import 'package:delivero/screen/restaurant.dart';
import 'package:delivero/widgets/dart/categories.dart';
import 'package:delivero/widgets/dart/drawer.dart';
import 'package:delivero/widgets/dart/featured_products.dart';
import 'package:delivero/widgets/dart/restaurant.dart';

import '../provider/products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    // final user = Provider.of<UserProvider>(context);
    // final app = Provider.of<AppProvider>(context);
    final categoryProvider = Provider.of<CategoryProvider>(context,listen: false);
    final restaurantProvider = Provider.of<RestaurantProvider>(context,listen: false);
    final productProvider = Provider.of<ProductProvider>(context,listen: false);
    // restaurantProvider.loadSingleRestaurant();
    return Scaffold(
      appBar:  AppBar(
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
      backgroundColor: Colors.white,
      body:
          // app.isLoading
          //     ? Container(
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: <Widget>[Loading()],
          //   ),
          // )
          //     :
          SafeArea(
        child: ListView(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20))),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 8, left: 8, right: 8, bottom: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ListTile(
                    leading: Icon(
                      Icons.search,
                      color: Colors.amberAccent,
                    ),
                    title: TextField(
                      textInputAction: TextInputAction.search,
                      onSubmitted: (pattern) async {
                        // app.changeLoading();
                        // if(app.search == SearchBy.PRODUCTS){
                        //   await productProvider.search(productName: pattern);
                        //   changeScreen(context, ProductSearchScreen());
                        // }else{
                        //   await restaurantProvider.search(name: pattern);
                        //   changeScreen(context, RestaurantsSearchScreen());
                        // }
                        // app.changeLoading();
                      },
                      decoration: InputDecoration(
                        hintText: "Find food and restaurant",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  "Search by:",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                DropdownButton<String>(
                  // value: app.filterBy,
                  style:
                      TextStyle(color: Colors.amber, fontWeight: FontWeight.w300),
                  icon: Icon(
                    Icons.filter_list,
                    color: Colors.amber,
                  ),
                  elevation: 0,
                  onChanged: (value) {
                    // if (value == "Products"){
                    //   app.changeSearchBy(newSearchBy: SearchBy.PRODUCTS);
                    // }else{
                    //   app.changeSearchBy(newSearchBy: SearchBy.RESTAURANTS);
                    // }
                  },
                  items: <String>["Products", "Restaurants"]
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                        value: value, child: Text(value));
                  }).toList(),
                ),
              ],
            ),
            Divider(),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 100,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categoryProvider.categories.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () async {
//                              app.changeLoading();
//                         await productProvider.loadProductsByCategory(
//                             categoryName:
//                             categoryProvider.categories[index].name);
                        Navigator.of(context).pushNamed(CategoryScreen.routeName,arguments: categoryProvider.categories[index].id
                        );

                        // app.changeLoading();
                      },
                      child: CategoryWidget(
                        category: categoryProvider.categories[index],
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Featured",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20,
                      )),
                ],
              ),
            ),
            Featured(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Popular restaurants",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20,
                      )),
                ],
              ),
            ),
            Column(
                children: restaurantProvider.restaurants
                    .map((item) => GestureDetector(
                  onTap: () async {
                    // app.changeLoading();
                    //
                    // await productProvider.loadProductsByRestaurant(
                    //     restaurantId: item.id);
                    // app.changeLoading();

                    // changeScreen(
                    //     context,
                    //     RestaurantScreen(
                    //       restaurantModel: item,
                    //     ));

                    Navigator.of(context).pushNamed(RestaurantScreen.routeName,arguments: item.id);

                    },
                  child: RestaurantWidget(
                    restaurant: item,
                  ),
                ))
                    .toList(),
                )
          ],
        ),
      ),
    );
  }
}
