import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appfinal/BottomNbar.dart';
import 'package:flutter_appfinal/SignUp.dart';
import 'package:dio/dio.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var _emailController = TextEditingController();
  var _passwordController = TextEditingController();
  bool passVisible=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  Image(
                    image: AssetImage("assets/images/cart1.jpg"),
                  ),
                  SizedBox(height: 30),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: "Email Address",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28),
                        borderSide: BorderSide(color: Colors.cyan[900]),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28),
                        borderSide: BorderSide(color: Colors.cyan[900])
                      ),
                      prefixIcon: Icon(Icons.email),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {},
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: !passVisible,
                    // controller: TextEditingController(""),
                    decoration: InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28),
                        borderSide: BorderSide(color: Colors.cyan[900]),
                      ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(28),
                            borderSide: BorderSide(color: Colors.cyan[900])
                        ),
                      prefixIcon: Icon(Icons.lock),
                        suffixIcon: InkWell(
                            onTap: _togglePassword,
                            child: IconButton(
                                onPressed: (){
                                  setState(() {
                                    passVisible=!passVisible;
                                  });
                                },
                                icon: Icon(passVisible? Icons.visibility:Icons.visibility_off
                                )))
                    ),
                  ),
                  SizedBox(height: 40),
                  Container(
                    height: 55,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: MaterialButton(
                        height: 55,
                        color: Colors.blue[700],
                        onPressed: () {
                          print(_emailController.text);
                          print(_passwordController.text);
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>BottomNav()));

                        },
                        child: Text("Login",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold,color: Colors.white)),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Text("Don't have an account !",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                      )),
                  Text("Go",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.green,
                      )),
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => SignUp()));
                      },
                      child: Text(
                        "SignUp",
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.red,
                        ),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  void _togglePassword(){


    setState(() {
      passVisible=!passVisible;
    });
  }



  void login() async {
    Response response;
    var dio = Dio();


    response = await dio.post('https://retail.amit-learning.com/api/register',
        data: {

          "email": _emailController.text,
          "password": _passwordController.text
        });
    print(response.data.toString());


  }


    }


