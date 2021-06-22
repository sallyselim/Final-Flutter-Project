import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:async';
import 'file:///D:/Dart%20Programming%20-%20Data%20Types%20-%20Tutorialspoint_files/p1/flutter_appfinal/lib/Acategories/ModelAllCategories.dart';

class Wellcome extends StatefulWidget {
  @override
  _WellcomeState createState() => _WellcomeState();
}

class _WellcomeState extends State<Wellcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Amit Shop...Stay Safe",style: TextStyle(fontSize: 20,color: Colors.blue[900])),
        actions: [
          IconButton(icon: Icon(Icons.search_rounded), onPressed: () {}),
          IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {print("Add to cart");}),

        ],
      ),
      body: SafeArea(
        child: Center(
          child: FutureBuilder<ModelCategories>(
            future: dioFetchAllCat(),
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done)
                return CircularProgressIndicator();
              else if (snapshot.hasData) {
                ModelCategories modelCategories = snapshot.data;
                return Container(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        CarouselSlider(
                          items: List.generate(
                              modelCategories.categories.length,
                              (index) => Column(
                                    children: [
                                      Image(
                                          image: NetworkImage(
                                              modelCategories
                                                  .categories[index]
                                                  .avatar),
                                          fit: BoxFit.cover),
                                      Container(
                                        child: Text(
                                          "${modelCategories.categories[index].name}",
                                          style: TextStyle(
                                              color: Colors.blue[700],
                                              fontSize: 20),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  )),
                          options: CarouselOptions(
                            height: 470,
                            // aspectRatio: 16 / 9,
                            viewportFraction: 1.0,
                            initialPage: 0,
                            enableInfiniteScroll: true,
                            reverse: false,
                            autoPlay: true,
                            autoPlayInterval: Duration(seconds: 3),
                            autoPlayAnimationDuration:
                                Duration(seconds: 1),
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enlargeCenterPage: true,
                            scrollDirection: Axis.horizontal,
                          ),
                        ),
                        Container(
                          height: 170,
                          width: double.infinity,
                          child: Image(
                            image: AssetImage(
                                "assets/images/goshopping1.jpg"),
                          ),
                        ),
                      ],
                    ),
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

  void initState() {
    super.initState();
    dioFetchAllCat();
  }
}

Future<ModelCategories> dioFetchAllCat() async {
  Response response;
  var dio = Dio();
  response = await dio.get('https://retail.amit-learning.com/api/categories');

  print(response.data);
  print(response.statusCode);

  ModelCategories data = ModelCategories.fromJson(response.data);

  return data;
}
