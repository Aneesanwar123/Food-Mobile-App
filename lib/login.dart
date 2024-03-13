import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:food_intern/forgot.dart';
import 'package:food_intern/home.dart';
import 'signup.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';


class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  // Initialize TextEditingController for email and password fields
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

// Variable to toggle password visibility
  bool _obscureText = true;

// Function to handle login request
  Future<void> loginRecord() async {
    try {
      // API endpoint URL food_api appName and php api file name login.php
      String uri = "http://10.0.2.2/food_api/login.php";

      // Send POST request with email and password data
      var response = await http.post(Uri.parse(uri), body: {
        "email": email.text,
        "password": password.text,
      });

      // Check if response status code is OK (200)
      if (response.statusCode == 200) {
        // Decode response body
        var responseData = jsonDecode(response.body);

        // Check if login was successful
        if (responseData["success"]) {
          // Navigate to home screen upon successful login
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => home()),
          );
          print("Login successful");
        } else {
          // Print error message if login fails
          print("Please Login Exist Account: ${responseData["message"]}");
        }
      } else {
        // Print error status code if request fails
        print("Error: ${response.statusCode}");
      }
    } catch (e) {
      // Print exception if an error occurs
      print("Exception: $e");
    }
  }

  // var _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {

          final double screenWidth = constraints.maxWidth;
          final double screenHeight = constraints.maxHeight;

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: screenHeight * 0.02),
                Center(
                  child: Container(
                    height: screenHeight * 0.32,
                    width: screenWidth * 0.82,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xff900e0e).withOpacity(0.1),
                          spreadRadius: 0.1,
                          blurRadius: 1000,
                          offset: Offset(0, 3),
                        )
                      ],
                    ),
                    child: Image.asset(
                      "images/deliver.png",
                      fit: BoxFit.contain
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Text(
                  "Welcome back!",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: screenWidth *0.045,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Padding(
                  padding: EdgeInsets.only(right: screenWidth * 0.0),
                  child: Text(
                    "Login in to your account",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: screenWidth *0.045,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.05),
                Container(
                  width: screenWidth * 0.9,
                  decoration: BoxDecoration(
                    color: Colors.red[50],
                    border: Border.all(color: Color(0xff900e0)),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: TextFormField(
                    controller: email,
                    decoration: InputDecoration(
                      hintText: "Email",
                      hintStyle: TextStyle(color: Colors.black54),
                      prefixIcon: Icon(Icons.alternate_email, color: Colors.black54),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                Container(
                  width: screenWidth * 0.9,
                  decoration: BoxDecoration(
                    color: Colors.red[50],
                    border: Border.all(color: Color(0xff900e0)),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: TextFormField(
                    controller: password,
                    style: TextStyle(color: Colors.black),
                    obscureText: _obscureText,
                    decoration: InputDecoration(
                      hintText: "Password",
                      hintStyle: TextStyle(color: Colors.black54),
                      prefixIcon: Icon(Icons.lock_open_rounded, color: Colors.black54),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        child: Icon(
                          _obscureText ? Icons.visibility_off : Icons.visibility,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: screenWidth * 0.67),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => forgot()));
                    },
                    child: Text(
                      "forgot password?",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: screenWidth * 0.045,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                Container(
                  width: screenWidth * 0.5,
                  height: screenHeight * 0.08,
                  decoration: BoxDecoration(
                    color: Color(0xff900e0e),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      loginRecord();
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>home()));
                      // Call the loginRecord function when the button is pressed
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 10), // Add vertical padding
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.045, // Adjust text size
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.07),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't Have an Account?",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: screenWidth *0.045,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => signUp()));
                          },
                          child: Text(
                            "SignUp",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: screenWidth *0.045,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
