import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:async';
import 'file:///D:/Dart%20Programming%20-%20Data%20Types%20-%20Tutorialspoint_files/p1/flutter_appfinal/lib/Acategories/ModelAllCategories.dart';

class AllCategories extends StatefulWidget {
  @override
  _AllCategoriesState createState() => _AllCategoriesState();
}

class _AllCategoriesState extends State<AllCategories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[200],
        title: Text("Amit Shop...Stay Safe",
            style: TextStyle(fontSize: 20, color: Colors.blue[900])),
        actions: [
          IconButton(icon: Icon(Icons.search_rounded), onPressed: () {}),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Container(
              child: FutureBuilder<ModelCategories>(
            future: dioFetchAllCat(),
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done)
                return CircularProgressIndicator();
              else if (snapshot.hasData) {
                ModelCategories modelCategories = snapshot.data;
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    color: Colors.green[50],
                    child: Expanded(
                      child: GridView.count(
                        mainAxisSpacing: 1.0,
                        crossAxisSpacing: 3.0,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        children: List.generate(
                            modelCategories.categories.length,
                            (index) => Stack(
                                  alignment: AlignmentDirectional.center,
                                  children: [
                                    Image(
                                      image: NetworkImage(modelCategories
                                          .categories[index].avatar),
                                      fit: BoxFit.cover,
                                    ),
                                    Container(
                                      width: double.infinity,
                                      color: Colors.black38,
                                      child: Text(
                                        "${modelCategories.categories[index].name}",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                )),
                      ),
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

  Future<ModelCategories> dioFetchAllCat() async {
    Response response;
    var dio = Dio();
    response = await dio.get('https://retail.amit-learning.com/api/categories');

    print(response.data);
    print(response.statusCode);

    ModelCategories data = ModelCategories.fromJson(response.data);

    return data;
  }

  @override
  void initState() {
    super.initState();
    dioFetchAllCat();
  }
}
