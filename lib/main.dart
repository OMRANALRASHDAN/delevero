import 'package:delivero/model/user.dart';
import 'package:delivero/provider/category.dart';
import 'package:delivero/provider/products.dart';
import 'package:delivero/provider/restaurant.dart';
import 'package:delivero/provider/user.dart';
import 'package:delivero/screen/cart.dart';
import 'package:delivero/screen/category.dart';
import 'package:delivero/screen/create-new-account.dart';
import 'package:delivero/screen/details.dart';
import 'package:delivero/screen/edit_profile.dart';
import 'package:delivero/screen/editproduct.dart';
import 'package:delivero/screen/forgot-password.dart';
import 'package:delivero/screen/login-screen.dart';
import 'package:delivero/screen/map.dart';
import 'package:delivero/screen/restaurant.dart';
import 'package:delivero/screen/restpromanagment.dart';
import 'package:delivero/screen/settings.dart';
import 'package:delivero/screen/splash.dart';

import './screen/home.dart';

import './screen/register.dart';
import 'package:provider/provider.dart';
import './screen/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Splash_Screen());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider( providers: [
      // ChangeNotifierProvider.value(value: AppProvider()),
      ChangeNotifierProvider.value(value: UserProvider.initialize()),
      ChangeNotifierProvider.value(value: CategoryProvider.initialize()),
       ChangeNotifierProvider.value(value: RestaurantProvider.initialize()),
      ChangeNotifierProvider.value(value: ProductProvider.initialize()),

    ],child: MaterialApp(
    title: 'Delovero',
    theme: ThemeData(
    primarySwatch: Colors.amber,
    accentColor: Colors.black,
    ),

    home:Home(),

    themeMode: ThemeMode.light,
    darkTheme: ThemeData(primaryColor: Colors.black),
        initialRoute: '/',

        routes: {

      RegistrationScreen.routeName: (ctx) => RegistrationScreen(),
  //  LoginScreen.routeName: (ctx) => LoginScreen(),
      CategoryScreen.routeName: (ctx) => CategoryScreen(),
      Details.routeName: (ctx) => Details(),
      RestaurantScreen.routeName: (ctx) => RestaurantScreen(),
          CartScreen.routeName: (ctx) => CartScreen(),
          Login_Screen.routeName   : (context) => Login_Screen(),
          ForgotPassword.routeName: (context) => ForgotPassword(),
        CreateNewAccount.routeName: (context) => CreateNewAccount(),
          SettingsPage.routeName: (context) => SettingsPage(),
          EditProfilePage.routeName: (context) => EditProfilePage(),
          MapWidget.routeName: (context) => MapWidget(),
          RestProManagment.routeName: (context) => RestProManagment(),

          EditProduct.routeName: (context) => EditProduct(),

        }
    ));

  }
}
