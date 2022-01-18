import 'package:delivero/model/product.dart';
import 'package:delivero/provider/products.dart';
import 'package:delivero/screen/map.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, right: 4, top: 4, bottom: 10),
      child: Container(
        height: 85,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey[300],
                  offset: Offset(-2, -1),
                  blurRadius: 5),
            ]),
//            height: 160,
        child: Row(
          children: <Widget>[
            Container(
              width: 70,
              height: 50,
                  child: Icon(Icons.location_history_outlined,size: 30,color: Colors.blueAccent,),
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Text(
                          'Delivery To : HOME',
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),
                        ),
                      ),
                      Container(
                        child: Padding(
                            padding: const EdgeInsets.all(0.5),
                            child: FlatButton(
                              color: Colors.white,
                              child: Text('Change'

                                 , style: TextStyle(
                                 color: Colors.amber,
                                  fontSize: 14,
                                  )
                              ),
                              onPressed: () {Navigator.of(context).pushNamed( MapWidget.routeName);},
                            )),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.location_on_outlined),
                      Text('Daraa-Tafas',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                              fontWeight: FontWeight.w400))
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
