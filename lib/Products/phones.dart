import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_appfinal/AItems/Item11.dart';
import 'package:flutter_appfinal/AItems/Item12.dart';
import 'package:flutter_appfinal/AItems/Item4.dart';
import 'package:flutter_appfinal/AItems/Item5.dart';
import 'dart:async';
import 'file:///D:/Dart%20Programming%20-%20Data%20Types%20-%20Tutorialspoint_files/p1/flutter_appfinal/lib/AProoducts/ModelAllProducts.dart';

class Phones extends StatefulWidget {
  @override
  _PhonesState createState() => _PhonesState();
}

class _PhonesState extends State<Phones> {
  bool fav = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.green[50],
      body: SafeArea(
        child: Center(
          child: FutureBuilder<ModelAllproducts>(
            future: dioFetchAllData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done)
                return CircularProgressIndicator();
              else if (snapshot.hasData) {
                ModelAllproducts modelAllproducts = snapshot.data;
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListView(
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 150,
                            width: 150,
                            child: Image(
                                image: NetworkImage(
                                    modelAllproducts.products[11].avatar)),
                          ),
                          SizedBox(height:10),
                          Container(
                              alignment: Alignment.center,
                              child: IconButton(
                                icon: Icon(fav ? Icons.favorite_border : Icons.favorite),
                                onPressed: () {
                                  setState(() {
                                    fav = !fav;
                                  });
                                  print("Add to Favorite");
                                },
                              )),
                        ],
                      ),
                      SizedBox(height:10),
                      Text("${modelAllproducts.products[11].name}",
                          style:
                          TextStyle(color: Colors.black, fontSize: 15,fontWeight: FontWeight.bold)),
                      Text("${modelAllproducts.products[11].title}",
                          style:
                          TextStyle(color: Colors.black, fontSize: 15,fontWeight: FontWeight.bold)),
                      Row(
                        children: [
                          Container(
                            child: MaterialButton(
                              onPressed: () {
                                print("Add to cart");
                              },
                              child: Icon(Icons.add_shopping_cart,
                                  color: Colors.white),
                              minWidth: double.minPositive,
                              color: Colors.green[600],
                            ),
                          ),

                          // ),

                          SizedBox(width: 35),
                          Text("${modelAllproducts.products[11].price}",
                              style: TextStyle(
                                  color: Colors.blue[600],
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(width: 5),
                          Text("${modelAllproducts.products[11].currency}",
                              style: TextStyle(
                                  color: Colors.blue[600],
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold)),
                          TextButton(child: Text("Show Details",
                              style: TextStyle(
                                color: Colors.red[900],
                                fontSize: 15,
                              )),
                            onPressed: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Item11()));
                            },
                          )
                        ],
                      ),
                      Divider(),
                      Stack(
                        children: [
                          Container(
                            height: 150,
                            width: 150,
                            child: Image(
                                image: NetworkImage(
                                    modelAllproducts.products[12].avatar)),
                          ),
                          Container(
                              alignment: Alignment.center,
                              child: IconButton(
                                icon: Icon(fav ? Icons.favorite_border : Icons.favorite),
                                onPressed: () {
                                  setState(() {
                                    fav = !fav;
                                  });
                                  print("Add to Favorite");
                                },
                              )),
                        ],
                      ),
                      SizedBox(height:10),
                      Text("${modelAllproducts.products[12].name}",
                          style:
                          TextStyle(color: Colors.black, fontSize: 15,fontWeight: FontWeight.bold)),
                      Text("${modelAllproducts.products[12].title}",
                          style:
                          TextStyle(color: Colors.black, fontSize: 15,fontWeight: FontWeight.bold)),
                      Row(
                        children: [
                          Container(
                            child: MaterialButton(
                              onPressed: () {
                                print("Add to cart");
                              },
                              child: Icon(Icons.add_shopping_cart,
                                  color: Colors.white),
                              minWidth: double.minPositive,
                              color: Colors.green[600],
                            ),
                          ),

                          // ),

                          SizedBox(width: 35),
                          Text("${modelAllproducts.products[12].price}",
                              style: TextStyle(
                                  color: Colors.blue[600],
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(width: 5),
                          Text("${modelAllproducts.products[12].currency}",
                              style: TextStyle(
                                  color: Colors.blue[600],
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold)),
                          TextButton(child: Text("Show Details",
                              style: TextStyle(
                                color: Colors.red[900],
                                fontSize: 15,
                              )),
                            onPressed: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Item12()));
                            },
                          )
                        ],
                      ),



                    ],
                  ),
                );

              } else {
                return Center(child: Text("No Data Found"));
              }
            },
          ),
        ),
      ),
    );
  }

  Future<ModelAllproducts> dioFetchAllData() async {
    Response response;
    var dio = Dio();
    response = await dio.get('https://retail.amit-learning.com/api/products');

    print(response.data);
    print(response.statusCode);

    ModelAllproducts data = ModelAllproducts.fromJson(response.data);

    return data;
  }

  @override
  void initState() {
    super.initState();
    dioFetchAllData();
  }
}
