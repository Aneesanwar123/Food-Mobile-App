import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class forgot extends StatefulWidget {
  const forgot({Key? key});

  @override
  State<forgot> createState() => _forgotState();
}

class _forgotState extends State<forgot> {
  TextEditingController email = TextEditingController();

  Future<void> resetPassword() async {
    try {
      final response = await http.post(
        Uri.parse('http://10.0.2.2/food_api/forgot.php'),
        body: {
          'email': email.text,
        },
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        print(responseData); // Check the response data

        // Handle the response data accordingly
      } else {
        print('Failed to reset password. Please try again later.');
      }
    } catch (e) {
      print('Exception: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final double screenWidth = constraints.maxWidth;
          final double screenHeight = constraints.maxHeight;
          return Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
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
                  SizedBox(height: screenHeight * 0.04),
                  Text(
                    "Forgot Your Password!",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: screenWidth * 0.045,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.04),
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
                    width: screenWidth * 0.5,
                    height: screenHeight * 0.07,
                    decoration: BoxDecoration(
                      color: Color(0xff900e0e),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        resetPassword();
                        // Navigator.push(context, MaterialPageRoute(builder: (context)=>login()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: Text(
                        "Forgot",
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
            ),
          );
        },
      ),
    );
  }
}
