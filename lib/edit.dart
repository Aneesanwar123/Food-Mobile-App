import 'dart:convert';
import 'package:food_intern/cart.dart';
import 'cartpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class edit extends StatefulWidget {
  final String cartName;
  final String cartPhone;
  final String cartemail;
  final String cartLocation;
  final String cartCategory;
  final String cartAmount;
  const edit({super.key, required this.cartName, required this.cartPhone, required this.cartemail, required this.cartLocation, required this.cartCategory, required this.cartAmount});

  @override
  State<edit> createState() => _editState();
}

class _editState extends State<edit> {

  // Initialize TextEditingController for cart details
  TextEditingController cartname = TextEditingController();
  TextEditingController cartphone = TextEditingController();
  TextEditingController cartemail = TextEditingController();
  TextEditingController cartlocation = TextEditingController();
  TextEditingController cartcategory = TextEditingController();
  TextEditingController cartAmount = TextEditingController();

  // Function to handle updaterecord request
  Future<void> updaterecord() async {
    // Check if all input fields are not empty
    if (cartname.text.isNotEmpty &&
        cartphone.text.isNotEmpty &&
        cartemail.text.isNotEmpty &&
        cartlocation.text.isNotEmpty &&
        cartcategory.text.isNotEmpty &&
        cartAmount.text.isNotEmpty) {
      try {
        // API endpoint URL food_api appName and php api file name edit.php
        String uri = "http://10.0.2.2/food_api/edit.php";

        // Send POST request with email and password data
        var res = await http.post(Uri.parse(uri), body: {
          "cartname": cartname.text,
          "cartphone": cartphone.text,
          "cartemail": cartemail.text,
          "cartlocation": cartlocation.text,
          "cartcategory": cartcategory.text,
          "cartAmount": cartAmount.text
        });

        var response = jsonDecode(res.body);

        if (response["success"] == "true") {
          print("Record Updated");
          // Show a SnackBar to indicate that the record was inserted successfully
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Record inserted"),
            ),
          );
        } else {
          print("Record not inserted");
          // Show a SnackBar to indicate that the record insertion failed
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Record not inserted"),
            ),
          );
        }
      } catch (e) {
        print(e);
      }
    } else {
      print("Please fill all fields");
    }
  }

  bool _obscureText = true;
  int _currentIndex = 0;
  @override

  void initState() {
    cartname.text = widget.cartName;
    cartphone.text = widget.cartPhone;
    cartemail.text = widget.cartemail;
    cartlocation.text = widget.cartLocation;
    cartcategory.text = widget.cartCategory;
    cartAmount.text = widget.cartAmount;
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: null,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xff900e0e),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: MediaQuery.of(context).size.width * 0.1,
                    backgroundImage: AssetImage('images/hat.png'), // Provide the path to your image
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.02), // Adjust the width as needed
                  Expanded(
                    child: Text(
                      "profile",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.width * 0.06,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.edit,
                color: Colors.black,
                size:MediaQuery.of(context).size.width*0.070,
              ),
              title: Text('Profile Data',style: TextStyle(
                color: Colors.black,
                fontSize: MediaQuery.of(context).size.width * 0.045,
              ),
              ),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.push(context, MaterialPageRoute(builder: (context)=>cart()));
              },
            ),

          ],
        ),
      ),
      body: LayoutBuilder(
          builder: (BuildContext context,BoxConstraints constraints){
            double screenWidth = MediaQuery.of(context).size.width;
            double screenHeight = MediaQuery.of(context).size.height;
            return  SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: screenHeight * 0.25,
                        decoration: BoxDecoration(
                          color: Color(0xff900e0e),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.05,
                          left: MediaQuery.of(context).size.width * 0.05,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: screenWidth * 0.12,
                              width: screenWidth * 0.12,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white
                              ),
                              child: IconButton(
                                onPressed: () {
                                },
                                icon: Center(
                                  child: Padding(
                                    padding: EdgeInsets.only(left: screenWidth * 0.015),
                                    child: Icon(Icons.arrow_back_ios, color: Colors.black, size: screenWidth * 0.05), // Adjust the size to make the icon visible
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: MediaQuery.of(context).size.width * 0.05,
                              ),
                              child: Builder(
                                builder: (context) => IconButton(
                                  onPressed: () {
                                    Scaffold.of(context).openDrawer();
                                  },
                                  icon: Icon(Icons.menu, color: Colors.white, size: screenWidth * 0.09),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: screenHeight * 0.15),
                        child: Center(
                          child: Stack(
                            children: [
                              CircleAvatar(
                                radius: screenWidth * 0.20, // Adjust the radius according to your design
                                backgroundColor: Colors.white,
                                child: ClipOval(
                                  child: Image.asset(
                                    "images/hat.png",
                                    fit: BoxFit.contain,
                                    height: screenHeight * 0.3,
                                    width: screenWidth * 0.8, // Set the width to a suitable value
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Padding(
                    padding: EdgeInsets.all(
                        MediaQuery.of(context).size.width * 0.05),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            width: screenWidth * 0.9,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Color(0xff900e0)),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: TextFormField(
                              controller: cartname,
                              decoration: InputDecoration(
                                hintText: "Name",
                                hintStyle: TextStyle(color: Colors.black54),
                                prefixIcon: Icon(Icons.perm_identity,
                                    color: Colors.black54),
                              ),
                            ),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                          Container(
                            width: screenWidth * 0.9,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Color(0xff900e0)),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: TextFormField(
                              inputFormatters: [PhoneNumberFormatter()],
                              controller: cartphone,
                              style: TextStyle(color: Colors.black),
                              obscureText: _obscureText,
                              decoration: InputDecoration(
                                hintText: "Phone Number",
                                hintStyle: TextStyle(color: Colors.black54),
                                prefixIcon: Icon(Icons.phone, color: Colors.black54),
                              ),
                            ),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                          Container(
                            width: screenWidth * 0.9,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Color(0xff900e0)),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: TextFormField(
                              controller: cartemail,
                              style: TextStyle(color: Colors.black),
                              obscureText: _obscureText,
                              decoration: InputDecoration(
                                hintText: "Email",
                                hintStyle: TextStyle(color: Colors.black54),
                                prefixIcon: Icon(Icons.alternate_email,
                                    color: Colors.black54),
                                errorText: !_isValidEmail(cartemail.text)
                                    ? 'Invalid Email'
                                    : null,
                              ),
                            ),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                          Container(
                            width: screenWidth * 0.9,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Color(0xff900e0)),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: TextFormField(
                              controller: cartlocation,
                              style: TextStyle(color: Colors.black),
                              obscureText: _obscureText,
                              decoration: InputDecoration(
                                hintText: "Location",
                                hintStyle: TextStyle(color: Colors.black54),
                                prefixIcon: Icon(Icons.location_on_outlined,
                                    color: Colors.black54),
                              ),
                            ),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                          Container(
                            width: screenWidth * 0.9,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Color(0xff900e0)),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: TextFormField(
                              controller: cartcategory,
                              style: TextStyle(color: Colors.black),
                              obscureText: _obscureText,
                              decoration: InputDecoration(
                                hintText: "Category",
                                hintStyle: TextStyle(color: Colors.black54),
                                prefixIcon: Icon(Icons.category, color: Colors.black54),
                              ),
                            ),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                          Container(
                            width: screenWidth * 0.9,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Color(0xff900e0)),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: TextFormField(
                              controller: cartAmount,
                              style: TextStyle(color: Colors.black),
                              obscureText: _obscureText,
                              decoration: InputDecoration(
                                hintText: "Amount",
                                hintStyle: TextStyle(color: Colors.black54),
                                prefixIcon: Icon(Icons.attach_money,
                                    color: Colors.black54),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),
                          Container(
                            width: screenWidth * 0.9,
                            height: screenHeight * 0.07,
                            decoration: BoxDecoration(
                              color: Color(0xff900e0e),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                updaterecord();
                                if (_isValidEmail(cartemail.text)) {
                                  // If all fields are valid, navigate to the next page// Save data if needed
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => CartPage(
                                        cartName: cartname.text,
                                        cartPhone: cartphone.text,
                                        cartemail: cartemail.text,
                                        cartLocation: cartlocation.text,
                                        cartCategory: cartcategory.text,
                                        cartAmount: cartAmount.text,
                                      ),
                                    ),
                                  );
                                } else {
                                  // If any field is invalid, show an error message
                                  String errorMessage = '';

                                  if (cartname.text.isEmpty) {
                                    errorMessage += 'Name field is required.\n';
                                  }
                                  if (cartphone.text.isEmpty) {
                                    errorMessage +=
                                    'Phone Number field is required.\n';
                                  }
                                  if (!_isValidEmail(cartemail.text)) {
                                    errorMessage += 'Please enter a valid email.\n';
                                  }
                                  if (cartlocation.text.isEmpty) {
                                    errorMessage += 'Location field is required.\n';
                                  }
                                  if (cartcategory.text.isEmpty) {
                                    errorMessage += 'Category field is required.\n';
                                  }
                                  if (cartAmount.text.isEmpty) {
                                    errorMessage += 'Amount field is required.\n';
                                  }

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(errorMessage),
                                    ),
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              child: Text(
                                "Update Data",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: MediaQuery.of(context).size.width * 0.04,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                ],
              ),
            );
          }
      ),
    );
  }
}



bool _isValidEmail(String email) {
  // Regular expression for validating email addresses
  RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  return emailRegex.hasMatch(email);
}

class PhoneNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Keep only digits
    String newText = newValue.text.replaceAll(RegExp(r'\D'), '');

    // Ensure newText has at least 10 characters
    if (newText.length >= 10) {
      // Handle country code if needed
      newText = newText.substring(0, 10);

      // Format the phone number as (XXX) XXX-XXXX
      newText = _formatPhoneNumber(newText);
    }

    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }

  String _formatPhoneNumber(String phoneNumber) {
    // Format the phone number as (XXX) XXX-XXXX
    return '(${phoneNumber.substring(0, 3)}) ${phoneNumber.substring(3, 6)}-${phoneNumber.substring(6, 10)}';
  }
}
