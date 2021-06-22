import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_appfinal/AItems/Item0.dart';
import 'package:flutter_appfinal/AItems/Item1.dart';
import 'package:flutter_appfinal/AItems/Item2.dart';
import 'package:flutter_appfinal/AItems/Item3.dart';
import 'dart:async';
import 'file:///D:/Dart%20Programming%20-%20Data%20Types%20-%20Tutorialspoint_files/p1/flutter_appfinal/lib/AProoducts/ModelAllProducts.dart';

class Fashion extends StatefulWidget {
  @override
  _FashionState createState() => _FashionState();
}

class _FashionState extends State<Fashion> {
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
                                    modelAllproducts.products[0].avatar)),
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
                      Text("${modelAllproducts.products[0].name}",
                          style:
                          TextStyle(color: Colors.black, fontSize: 15,fontWeight: FontWeight.bold)),
                      Text("${modelAllproducts.products[0].title}",
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
                          Text("${modelAllproducts.products[0].price}",
                              style: TextStyle(
                                  color: Colors.blue[600],
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(width: 5),
                          Text("${modelAllproducts.products[0].currency}",
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
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Item0()));
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
                                    modelAllproducts.products[1].avatar)),
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
                      Text("${modelAllproducts.products[1].name}",
                          style:
                          TextStyle(color: Colors.black, fontSize: 15,fontWeight: FontWeight.bold)),
                      Text("${modelAllproducts.products[1].title}",
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
                          Text("${modelAllproducts.products[1].price}",
                              style: TextStyle(
                                  color: Colors.blue[600],
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(width: 5),
                          Text("${modelAllproducts.products[1].currency}",
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
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Item1()));
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
                                    modelAllproducts.products[2].avatar)),
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
                      Text("${modelAllproducts.products[2].name}",
                          style:
                          TextStyle(color: Colors.black, fontSize: 15,fontWeight: FontWeight.bold)),
                      Text("${modelAllproducts.products[2].title}",
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
                          Text("${modelAllproducts.products[2].price}",
                              style: TextStyle(
                                  color: Colors.blue[600],
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(width: 5),
                          Text("${modelAllproducts.products[2].currency}",
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
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Item2()));
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
                                    modelAllproducts.products[3].avatar)),
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
                      Text("${modelAllproducts.products[3].name}",
                          style:
                          TextStyle(color: Colors.black, fontSize: 15,fontWeight: FontWeight.bold)),
                      Text("${modelAllproducts.products[3].title}",
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
                          Text("${modelAllproducts.products[3].price}",
                              style: TextStyle(
                                  color: Colors.blue[600],
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(width: 5),
                          Text("${modelAllproducts.products[3].currency}",
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
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Item3()));
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
