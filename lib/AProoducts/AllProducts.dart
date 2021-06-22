import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter/painting.dart';
import 'dart:async';
import 'file:///D:/Dart%20Programming%20-%20Data%20Types%20-%20Tutorialspoint_files/p1/flutter_appfinal/lib/AProoducts/ModelAllProducts.dart';

class AllProducts extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<AllProducts> {
  int currentindex = 0;
  bool fav = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
              color: Colors.green[50],
              child: FutureBuilder<ModelAllproducts>(
                future: dioFetchAllData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState != ConnectionState.done)
                    return CircularProgressIndicator();
                  else if (snapshot.hasData) {
                    ModelAllproducts modelAllproducts = snapshot.data;
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        color: Colors.green[50],
                        child: GridView.count(
                          mainAxisSpacing: 1.0,
                          crossAxisSpacing: 2.0,
                          shrinkWrap: true,
                          crossAxisCount: 2,
                          children: List.generate(
                              modelAllproducts.products.length,
                              (index) => Container(
                                    height: 650,
                                    child: Column(
                                      children: [
                                        Flexible(
                                          flex: 4,
                                          child: Stack(
                                            children: [
                                              Image(
                                                  image: NetworkImage(
                                                      modelAllproducts
                                                          .products[index]
                                                          .avatar)),
                                              Container(
                                                  alignment: Alignment.topRight,
                                                  child: IconButton(
                                                    icon: Icon(fav
                                                        ? Icons.favorite_border
                                                        : Icons.favorite),
                                                    onPressed: () {
                                                      setState(() {
                                                        fav = !fav;
                                                      });
                                                      print("Add to Favorite");
                                                    },
                                                  )),
                                            ],
                                          ),
                                        ),
                                        Flexible(
                                          flex: 1,
                                          child: Text(
                                              "${modelAllproducts.products[index].name}",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 10)),
                                        ),
                                        Flexible(
                                          flex: 1,
                                          child: Text(
                                              "${modelAllproducts.products[index].title}",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 10)),
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              child: MaterialButton(
                                                onPressed: () {
                                                  print("Add to cart");
                                                },
                                                child: Icon(
                                                    Icons.add_shopping_cart,
                                                    color: Colors.white),
                                                minWidth: double.minPositive,
                                                color: Colors.green[600],
                                              ),
                                            ),

                                            // ),

                                            SizedBox(width: 35),
                                            Text(
                                                "${modelAllproducts.products[index].price}",
                                                style: TextStyle(
                                                    color: Colors.blue[600],
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            SizedBox(width: 5),
                                            Text(
                                                "${modelAllproducts.products[index].currency}",
                                                style: TextStyle(
                                                    color: Colors.blue[600],
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold))
                                          ],
                                        ), // This trailing com
                                      ],
                                    ),
                                  )),
                        ),
                      ),
                    );
                  } else {
                    return Center(child: Text("No Data Found"));
                  }
                },
              )),
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
