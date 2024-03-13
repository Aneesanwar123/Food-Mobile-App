import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:food_intern/login.dart';
import 'package:http/http.dart' as http;

class signUp extends StatefulWidget {
  const signUp({Key? key}) : super(key: key);

  @override
  State<signUp> createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  // Initialize TextEditingController for name,email and password fields
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

// Function to handle insertRecord a record
  Future<void> insertRecord() async {
    // Check if any of the input fields are empty
    if (name.text.isNotEmpty || email.text.isNotEmpty || password.text.isNotEmpty) {
      try {
        // API endpoint URL for inserting a record food_api appName and php api file name insert_record.php
        String uri = "http://10.0.2.2/food_api/insert_record.php";

        // Send a POST request with name, email, and password data
        var res = await http.post(Uri.parse(uri), body: {
          "name": name.text,
          "email": email.text,
          "password": password.text,
        });

        var response = jsonDecode(res.body);

        // Check if the record insertion was successful
        if (response["success"] == "true") {
          print("Record inserted");
        } else {
          print("Record insertion failed");
        }
      } catch (e) {
        print(e);
      }
    } else {
      print("Please fill all fields");
    }
  }
// Flag to determine whether the password text is obscured or not
  bool _obscureText = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final double screenWidth = constraints.maxWidth;
          final double screenHeight = constraints.maxHeight;

          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
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
                        ),
                      ],
                    ),
                    child: Image.asset(
                      "images/deliver.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Padding(
                  padding: EdgeInsets.only(right: screenWidth * 0.0),
                  child: Text(
                    "Create your account",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.025),
                buildTextField("Username", Icons.person, name, screenWidth),
                SizedBox(height: screenHeight * 0.025),
                buildTextField("Email", Icons.email, email, screenWidth),
                SizedBox(height: screenHeight * 0.025),
                buildTextField("Password", Icons.lock, password, screenWidth, isPassword: true),
                SizedBox(height: screenHeight * 0.025),
                buildTextField("Confirm Password", Icons.lock, password, screenWidth, isPassword: true),
                SizedBox(height: screenHeight * 0.045),
                Container(
                  width: screenWidth * 0.5,
                  height: screenHeight * 0.07,
                  decoration: BoxDecoration(
                    color: Color(0xff900e0e),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      insertRecord();
                      Navigator.push(context, MaterialPageRoute(builder: (context) => login()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: Text(
                      "SignUp",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.045,
                        fontWeight: FontWeight.bold,
                      ),
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

  Widget buildTextField(String hintText, IconData prefixIcon, TextEditingController controller, double screenWidth, {bool isPassword = false}) {
    return Container(
      width: screenWidth * 0.9,
      decoration: BoxDecoration(
        color: Colors.red[50],
        border: Border.all(color: Color(0xff900e0)),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword ? _obscureText : false,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.black54),
          prefixIcon: Icon(prefixIcon, color: Colors.black54),
          suffixIcon: isPassword
              ? GestureDetector(
            onTap: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
            child: Icon(
              _obscureText ? Icons.visibility_off : Icons.visibility,
              color: Colors.black54,
            ),
          )
              : null,
        ),
      ),
    );
  }
}
