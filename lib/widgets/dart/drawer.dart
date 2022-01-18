import 'package:delivero/screen/cart.dart';
import 'package:delivero/screen/edit_profile.dart';
import 'package:delivero/screen/login-screen.dart';
import 'package:delivero/screen/login.dart';
import 'package:delivero/screen/restpromanagment.dart';
import 'package:delivero/screen/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:ui';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Drawer(
      child: ListView(
        children: <Widget>[

              UserAccountsDrawerHeader(
                currentAccountPicture: Container(
                  child: ClipOval(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                      child: CircleAvatar(
                        // radius: size.width * 0.12,
                        backgroundColor: Colors.grey[400].withOpacity(
                          0.9,
                        ),
                        child: Icon(
                          FontAwesomeIcons.user,
                          color: Colors.white,
                          size: size.width * 0.1,
                        ),
                      ),
                    ),
                  ),
                ),
                decoration: BoxDecoration(color: Colors.amber),
                accountName: Text(
                  "username lading...",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                accountEmail: Text(
                  // text: user.userModel?.email ?? "email loading...",
                  "email loading...",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),

          ListTile(
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
            leading: Icon(Icons.home),
            title: Text("Home"),
          ),
          ListTile(
            onTap: () async {
              // await user.getOrders();
              // changeScreen(context, OrdersScreen());
            },
            leading: Icon(Icons.bookmark_border),
            title: Text("My orders"),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pushNamed(CartScreen.routeName);
            },
            leading: Icon(Icons.shopping_cart),
            title: Text("Cart"),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pushNamed(RestProManagment.routeName);
            },
            leading: Icon(Icons.production_quantity_limits),
            title: Text("Product Managment"),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pushNamed(EditProfilePage.routeName);
            },
            leading: Icon(Icons.account_box),
            title: Text("Account"),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pushNamed(SettingsPage.routeName);
            },
            leading: Icon(Icons.settings),
            title: Text("Settings"),
          ),
          ListTile(
            onTap: () {
              // user.signOut();
              Navigator.of(context)
                  .pushReplacementNamed(Login_Screen.routeName);
            },
            leading: Icon(Icons.exit_to_app),
            title: Text("Log out"),
          ),
        ],
      ),
    );
  }
}
