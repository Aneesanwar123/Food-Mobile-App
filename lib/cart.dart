import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_intern/burger.dart';
import 'package:food_intern/cartpage.dart';
import 'package:food_intern/pizza.dart';
import 'package:food_intern/sand.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:http/http.dart' as http;
import 'fries.dart';
import 'home.dart';

class cart extends StatefulWidget {
  const cart({Key? key});

  @override
  State<cart> createState() => _cartState();
}

class _cartState extends State<cart> {

  // Initialize TextEditingController for name, phone, email, location, category, and Amount fields
  TextEditingController cartname = TextEditingController();
  TextEditingController cartphone = TextEditingController();
  TextEditingController cartemail = TextEditingController();
  TextEditingController cartlocation = TextEditingController();
  TextEditingController cartcategory = TextEditingController();
  TextEditingController cartAmount = TextEditingController();

// Function to handle cartrecord insert a record into the cart
  Future<void> cartrecord() async {
    // Check if all input fields are not empty
    if (cartname.text.isNotEmpty &&
        cartphone.text.isNotEmpty &&
        cartemail.text.isNotEmpty &&
        cartlocation.text.isNotEmpty &&
        cartcategory.text.isNotEmpty &&
        cartAmount.text.isNotEmpty) {
      try {
        // API endpoint URL for inserting a record into the cart food_api appName and php api file name cart_record.php
        String uri = "http://10.0.2.2/food_api/cart_record.php";

        // Send a POST request with cart data
        var res = await http.post(Uri.parse(uri), body: {
          "cartname": cartname.text,
          "cartphone": cartphone.text,
          "cartemail": cartemail.text,
          "cartlocation": cartlocation.text,
          "cartcategory": cartcategory.text,
          "cartAmount": cartAmount.text
        });

        var response = jsonDecode(res.body);

        // Check if the record insertion was successful
        if (response["success"] == "true") {
          print("Record inserted");
          // Show a SnackBar to indicate that the record was inserted successfully
         ScaffoldMessenger.of(context).showSnackBar(
             SnackBar(
               content: Text("Record Inserted"),
             )
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

// Index variable for bottom navigation bar
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      child: Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0xff900e0e),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'images/chief.png', // Provide the path to your image
                      height: MediaQuery.of(context).size.width * 0.5,
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.02), // Adjust the width as needed
                    Expanded(
                      child: Text(
                        "Menu",
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
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: ListTile(
                  leading: Icon(
                    Icons.arrow_right,
                    color: Colors.black,
                    size:MediaQuery.of(context).size.width*0.070,
                  ),
                  title: Text('burger',style: TextStyle(
                    color: Colors.black,
                    fontSize: MediaQuery.of(context).size.width * 0.045,
                  ),
                  ),
                  onTap: () {
                    Navigator.pop(context); // Close the drawer
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>burger()));
                  },
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.arrow_right,
                  color: Colors.black,
                  size:MediaQuery.of(context).size.width*0.070,
                ),
                title: Text('Pizza',style: TextStyle(
                  color:Colors.black,
                  fontSize: MediaQuery.of(context).size.width * 0.045,
                ),
                ),
                onTap: () {
                  Navigator.pop(context); // Close the drawer
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>pizza()));
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.arrow_right,
                  color: Colors.black,
                  size:MediaQuery.of(context).size.width*0.070,
                ),
                title: Text('Sandwich',style: TextStyle(
                  color: Colors.black,
                  fontSize: MediaQuery.of(context).size.width * 0.045,
                ),
                ),
                onTap: () {
                  Navigator.pop(context); // Close the drawer
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>sand()));
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.arrow_right,
                  color: Colors.black,
                  size:MediaQuery.of(context).size.width*0.070,
                ),
                title: Text('Fries',style: TextStyle(
                  color: Colors.black,
                  fontSize: MediaQuery.of(context).size.width * 0.045,
                ),
                ),
                onTap: () {
                  Navigator.pop(context); // Close the drawer
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>fries()));
                },
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.02,),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  "Details",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: MediaQuery.of(context).size.width * 0.045, // Adjust font size dynamically
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.shopping_cart,
                  color: Colors.black,
                  size:MediaQuery.of(context).size.width*0.070,
                ),
                title: Text('Cart',style: TextStyle(
                  color:Colors.black,
                  fontSize: MediaQuery.of(context).size.width * 0.045,
                ),
                ),
                onTap: () {
                  Navigator.pop(context); // Close the drawer
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>cart()));
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.home,
                  color: Colors.black,
                  size:MediaQuery.of(context).size.width*0.070,
                ),
                title: Text('home',style: TextStyle(
                  color: Colors.black,
                  fontSize: MediaQuery.of(context).size.width * 0.045,
                ),
                ),
                onTap: () {
                  Navigator.pop(context); // Close the drawer
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>home()));
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.people,
                  color: Colors.black,
                  size:MediaQuery.of(context).size.width*0.070,
                ),
                title: Text('Reveiws',style: TextStyle(
                  color: Colors.black,
                  fontSize: MediaQuery.of(context).size.width * 0.045,
                ),
                ),
                onTap: () {
                  Navigator.pop(context); // Close the drawer
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>fries()));
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Color(0xff900e0e),
            borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height * 0.05),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05,
              vertical: MediaQuery.of(context).size.height * 0.015,
            ),
            child: GNav(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
              backgroundColor: Color(0xff900e0e),
              color: Colors.white,
              activeColor: Colors.white,
              tabBackgroundColor: Colors.white24,
              gap: MediaQuery.of(context).size.width * 0.01,
              onTabChange: (index) {
                setState(() {
                  _currentIndex = index;
                });
                switch (index) {
                  case 0:
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => home()),
                    );
                    break;
                  case 1:
                  // Navigator.pushReplacement(
                  //   context,
                  //   // MaterialPageRoute(builder: (context) => LikesPage()),
                  // );
                    break;
                  case 2:
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => cart()),
                    );
                    break;
                  case 3:
                  // Navigator.pushReplacement(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => cartpage()),
                  // );
                    break;
                  default:
                    break;
                }
              },
              tabs: [
                GButton(
                  icon: Icons.home,
                  text: "Home",
                  textStyle: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.045,
                    color: Colors.white,
                  ),
                  iconColor: Colors.white,
                  iconSize: MediaQuery.of(context).size.width * 0.070,
                ),
                GButton(
                  icon: CupertinoIcons.heart,
                  text: "Likes",
                  textStyle: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.045,
                    color: Colors.white,
                  ),
                  iconColor: Colors.white,
                  iconSize: MediaQuery.of(context).size.width * 0.070,
                ),
                GButton(
                  icon: CupertinoIcons.cart,
                  text: "Cart",
                  textStyle: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.045,
                    color: Colors.white,
                  ),
                  iconColor: Colors.white,
                  iconSize: MediaQuery.of(context).size.width * 0.070,
                ),
                GButton(
                  icon: CupertinoIcons.person,
                  text: "Profile",
                  textStyle: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.045,
                    color: Colors.white,
                  ),
                  iconColor: Colors.white,
                  iconSize: MediaQuery.of(context).size.width * 0.070,
                )
              ],
            ),
          ),
        ),
        appBar: null,
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            double screenWidth = MediaQuery.of(context).size.width;
            double screenHeight = MediaQuery.of(context).size.height;
            return SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: screenHeight * 0.4,
                        decoration: BoxDecoration(
                          color: Color(0xff900e0e),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(screenWidth * 0.5),
                            bottomRight: Radius.circular(screenWidth * 0.5),
                          ),
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
                                color: Colors.white,
                              ),
                              child: IconButton(
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) => home()));
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
                                right: MediaQuery.of(context).size.width * 0.02,
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
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.15,
                        ),
                        child: Center(
                          child: Container(
                            height: screenHeight * 0.4,
                            width: screenWidth * 0.9,
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
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: screenWidth * 0.0),
                    child: Text(
                      "Please Fill Below Details",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: screenWidth * 0.045,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
                              color: Colors.red[50],
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
                              color: Colors.red[50],
                              border: Border.all(color: Color(0xff900e0)),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: TextFormField(
                              inputFormatters: [PhoneNumberFormatter()],
                              controller: cartphone,
                              style: TextStyle(color: Colors.black),
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
                              color: Colors.red[50],
                              border: Border.all(color: Color(0xff900e0)),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: TextFormField(
                              controller: cartemail,
                              style: TextStyle(color: Colors.black),
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
                              color: Colors.red[50],
                              border: Border.all(color: Color(0xff900e0)),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: TextFormField(
                              controller: cartlocation,
                              style: TextStyle(color: Colors.black),
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
                              color: Colors.red[50],
                              border: Border.all(color: Color(0xff900e0)),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: TextFormField(
                              controller: cartcategory,
                              style: TextStyle(color: Colors.black),
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
                              color: Colors.red[50],
                              border: Border.all(color: Color(0xff900e0)),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: TextFormField(
                              controller: cartAmount,
                              style: TextStyle(color: Colors.black),
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
                                // Check if all fields are valid
                                if (_isValidEmail(cartemail.text)) {
                                  // If all fields are valid, navigate to the next page
                                  cartrecord(); // Save data if needed

                                  // Navigate/Parse All TextField Data to a CartPage to Show a Data which The user input
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
                                "Confirm Order",
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
          },
        ),
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
    final effectiveText = newValue.text.length > 11
        ? oldValue.text
        : _formatPhoneNumber(newValue.text);
    return TextEditingValue(
      text: effectiveText,
      selection: TextSelection.collapsed(offset: effectiveText.length),
    );
  }
}

String _formatPhoneNumber(String phoneNumber) {
  if (phoneNumber.length == 11) {
    // For a 10-digit phone number
    return '(${phoneNumber.substring(0, 3)}) ${phoneNumber.substring(3, 6)}-${phoneNumber.substring(6, 11)}';
  } else if (phoneNumber.length == 11 && phoneNumber.startsWith('0')) {
    // For an 11-digit phone number starting with '0'
    return '(${phoneNumber.substring(1, 4)}) ${phoneNumber.substring(4, 7)}-${phoneNumber.substring(7, 11)}';
  } else {
    // If the length is not 10 or 11, return the original number
    return phoneNumber;
  }
}
