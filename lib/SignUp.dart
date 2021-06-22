import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appfinal/BottomNbar.dart';
import 'package:flutter_appfinal/Login.dart';
import 'package:dio/dio.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var _emailController = TextEditingController();
  var _passwordController = TextEditingController();
  var _nameController = TextEditingController();
  bool passVisible = false;

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
                  Text("SignUp",
                      style: TextStyle(
                          fontSize: 35,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: "UserName",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28),
                        borderSide: BorderSide(color: Colors.cyan[900]),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(28),
                          borderSide: BorderSide(color: Colors.cyan[900])),
                      prefixIcon: Icon(Icons.person),
                    ),
                    keyboardType: TextInputType.text,
                    onChanged: (value) {},
                  ),
                  SizedBox(height: 20),
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
                          borderSide: BorderSide(color: Colors.cyan[900])),
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
                            borderSide: BorderSide(color: Colors.cyan[900])),
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: InkWell(
                            onTap: _togglePassword,
                            child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    passVisible = !passVisible;
                                  });
                                },
                                icon: Icon(passVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off)))),
                  ),
                  SizedBox(height: 20),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: MaterialButton(
                      height: 45,
                      color: Colors.blue[700],
                      onPressed: () {
                        signup();
                        print(_emailController.text);
                        print(_passwordController.text);
                        print(_nameController.text);
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => BottomNav()));
                      },
                      child: Text("SignUp",
                          style: TextStyle(fontSize: 25, color: Colors.white)),
                    ),
                  ),
                  SizedBox(height: 25),
                  Text("Have an account !",
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
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Login()));
                    },
                    child: Text(" Login ",
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.red,
                        )),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void signup() async {
    Response response;
    var dio = Dio();

    response =
        await dio.post('https://retail.amit-learning.com/api/register', data: {
      "name": _nameController.text,
      "email": _emailController.text,
      "password": _passwordController.text
    });
    print(response.data.toString());
  }

  void _togglePassword() {
    setState(() {
      passVisible = !passVisible;
    });
  }
}
