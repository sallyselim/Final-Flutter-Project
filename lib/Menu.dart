import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_appfinal/Products/BabyProducts.dart';
import 'package:flutter_appfinal/Products/Electronics.dart';
import 'dart:async';
import 'file:///D:/Dart%20Programming%20-%20Data%20Types%20-%20Tutorialspoint_files/p1/flutter_appfinal/lib/Acategories/ModelAllCategories.dart';
import 'package:flutter_appfinal/Products/Fashion.dart';
import 'package:flutter_appfinal/Products/Health&Beauty.dart';
import 'package:flutter_appfinal/Products/Supermarket.dart';
import 'package:flutter_appfinal/Products/phones.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Stack(
                        alignment: AlignmentDirectional.bottomCenter,
                        children: [
                          Container(
                            width: 200,
                            height: 200,
                            child: Image(
                                image: NetworkImage(
                                    modelCategories.categories[0].avatar)),
                          ),
                          Container(
                            width: 200,
                            height: 40,
                            color: Colors.grey.withOpacity(.5),
                            child: TextButton(child: Text("Fashion",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 20,fontWeight: FontWeight.bold),),
                              onPressed: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Fashion()));}


                                ),
                          )],
                      ),
                      Divider(),
                      Stack(
                        alignment: AlignmentDirectional.bottomCenter,
                        children: [
                          Container(
                            width: 200,
                            height: 200,
                            child: Image(
                                image: NetworkImage(
                                    modelCategories.categories[1].avatar)),
                          ),
                          Container(
                            width: 200,
                            height: 40,
                            color: Colors.grey.withOpacity(.5),
                            child: TextButton(child: Text("Electronics",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 20,fontWeight: FontWeight.bold),),
                                onPressed: (){
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Electronics()));}


                            ),
                          )],
                      ),
                      Divider(),
                      Stack(
                        alignment: AlignmentDirectional.bottomCenter,
                        children: [
                          Container(
                            width: 200,
                            height: 200,
                            child: Image(
                                image: NetworkImage(
                                    modelCategories.categories[2].avatar)),
                          ),
                          Container(
                            width: 200,
                            height: 40,
                            color: Colors.grey.withOpacity(.5),
                            child: TextButton(child: Text("Baby Products",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 20,fontWeight: FontWeight.bold),),
                                onPressed: (){
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>BabyProducts()));}


                            ),
                          )],
                      ),
                      Divider(),
                      Stack(
                        alignment: AlignmentDirectional.bottomCenter,
                        children: [
                          Container(
                            width: 200,
                            height: 200,
                            child: Image(
                                image: NetworkImage(
                                    modelCategories.categories[3].avatar)),
                          ),
                          Container(
                            width: 200,
                            height: 40,
                            color: Colors.grey.withOpacity(.5),
                            child: TextButton(child: Text("Health & Bueaty",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 20,fontWeight: FontWeight.bold),),
                                onPressed: (){
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Health()));}


                            ),
                          )],
                      ),
                      Divider(),
                      Stack(
                        alignment: AlignmentDirectional.bottomCenter,
                        children: [
                          Container(
                            width: 200,
                            height: 200,
                            child: Image(
                                image: NetworkImage(
                                    modelCategories.categories[4].avatar)),
                          ),
                          Container(
                            width: 200,
                            height: 40,
                            color: Colors.grey.withOpacity(.5),
                            child: TextButton(child: Text("Fashion",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 20,fontWeight: FontWeight.bold),),
                                onPressed: (){
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Phones()));}


                            ),
                          )],
                      ),
                      Divider(),
                      Stack(
                        alignment: AlignmentDirectional.bottomCenter,
                        children: [
                          Container(
                            width: 200,
                            height: 200,
                            child: Image(
                                image: NetworkImage(
                                    modelCategories.categories[5].avatar)),
                          ),
                          Container(
                            width: 200,
                            height: 40,
                            color: Colors.grey.withOpacity(.5),
                            child: TextButton(child: Text("SuperMarket",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 20,fontWeight: FontWeight.bold),),
                                onPressed: (){
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SuperMarket()));}


                            ),
                          )],
                      ),
                    ],

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
