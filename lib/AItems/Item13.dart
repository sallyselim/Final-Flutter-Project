import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'file:///D:/Dart%20Programming%20-%20Data%20Types%20-%20Tutorialspoint_files/p1/flutter_appfinal/lib/AProoducts/ModelAllProducts.dart';
class Item13 extends StatefulWidget {
  @override
  _Item13State createState() => _Item13State();
}

class _Item13State extends State<Item13> {
  int _x = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      body: SafeArea(
        child: Center(
          child: Container(
              child: FutureBuilder<ModelAllproducts>(
                future: dioFetchAllData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState != ConnectionState.done)
                    return CircularProgressIndicator();
                  else if (snapshot.hasData) {
                    ModelAllproducts modelAllproducts = snapshot.data;
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                          child: Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Image(
                                    image: NetworkImage(
                                        modelAllproducts.products[13].avatar),
                                    width: 500,
                                    height: 300,
                                    // fit: BoxFit.cover,
                                  ),
                                  Text("${modelAllproducts.products[13].name}",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 20)),
                                  Text(
                                    "${modelAllproducts.products[13].title}",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 20),
                                  ),
                                  Text(
                                    "${modelAllproducts.products[13].description}",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 20),
                                  ),
                                  Divider(height: 40, color: Colors.brown),
                                  Row(
                                    children: [
                                      SizedBox(width: 10),
                                      Text(
                                          "${modelAllproducts.products[13].price}",
                                          style: TextStyle(
                                              color: Colors.blue[600],
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold)),
                                      SizedBox(width: 10),
                                      Text(
                                          "${modelAllproducts.products[13].currency}",
                                          style: TextStyle(
                                              color: Colors.blue[600],
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold)),
                                      SizedBox(width: 125),
                                      MaterialButton(
                                        onPressed: () {
                                          setState(() {
                                            _x++;
                                          });
                                        },
                                        child: Icon(Icons.add),
                                        minWidth: double.minPositive,
                                        color: Colors.red[700],
                                      ),
                                      SizedBox(width: 10),
                                      Text(("$_x"),
                                          style: TextStyle(fontSize: 20)),

                                      SizedBox(width: 10),
                                      MaterialButton(
                                        onPressed: () {
                                          setState(() {
                                            if (_x >= 1) {
                                              _x--;
                                            }
                                          });
                                        },
                                        child: Icon(Icons.remove),
                                        minWidth: double.minPositive,
                                        color: Colors.red[700],
                                      ), // This trailing com
                                    ],
                                  ),
                                  Divider(height: 30, color: Colors.brown),
                                  Container(
                                    width: double.infinity,
                                    height: 50,
                                    child: MaterialButton(
                                      color: Colors.green[700],
                                      onPressed: () {
                                        print("Add to cart");
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.add_shopping_cart_outlined,
                                              color: Colors.white),
                                          SizedBox(width: 10),
                                          Text(
                                            "Add To Cart",
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )),
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
