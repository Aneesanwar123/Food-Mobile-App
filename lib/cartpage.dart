import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'cart.dart';
import 'edit.dart';
class CartPage extends StatefulWidget {
  final String cartName;
  final String cartPhone;
  final String cartemail;
  final String cartLocation;
  final String cartCategory;
  final String cartAmount;

  const CartPage({
    required this.cartName,
    required this.cartPhone,
    required this.cartemail,
    required this.cartLocation,
    required this.cartCategory,
    required this.cartAmount,
  });

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  // Initialize TextEditingController for cart details
  TextEditingController cartname = TextEditingController();
  TextEditingController cartphone = TextEditingController();
  TextEditingController cartemail = TextEditingController();
  TextEditingController cartlocation = TextEditingController();
  TextEditingController cartcategory = TextEditingController();
  TextEditingController cartAmount = TextEditingController();

  @override
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
                      "Profile",
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
              title: Text('Edit Profile',style: TextStyle(
                color: Colors.black,
                fontSize: MediaQuery.of(context).size.width * 0.045,
              ),
              ),
              onTap: () {
                // Navigate/Parse All TextField Data to a edit.dart file For updating the Data
                Navigator.pop(context); // Close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => edit(
                      cartName: widget.cartName,
                      cartPhone: widget.cartPhone,
                      cartemail: widget.cartemail,
                      cartLocation: widget.cartLocation,
                      cartCategory: widget.cartCategory,
                      cartAmount: widget.cartAmount,
                    ),
                  ),
                );
              },
            ),

          ],
        ),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {

          // media querry for app make it responsive for all devices it adujust the content according to he device height and width
          final double screenWidth = constraints.maxWidth;
          final double screenHeight = constraints.maxHeight;
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
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
                      padding: EdgeInsets.only(top: screenHeight * 0.06, left: screenWidth * 0.05),
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
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => cart()));
                              },
                              icon: Center(
                                child: Padding(
                                  padding: EdgeInsets.only(left: screenWidth * 0.015),
                                  child: Icon(Icons.arrow_back_ios, color: Colors.black, size: screenWidth * 0.06), // Adjust the size to make the icon visible
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
                      padding: EdgeInsets.only(top: screenHeight * 0.14),
                      child: Center(
                        child: Column(
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
                            SizedBox(height: screenHeight * 0.04),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Container(
                                      height: screenHeight * 0.09,
                                      width: screenWidth * 0.9,
                                      child: Padding(
                                        padding: EdgeInsets.only(top: screenHeight * 0.005, left: screenWidth * 0.05, right: screenWidth * 0.05),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Name :   ${widget.cartName}",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: screenWidth * 0.045,
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 1,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: screenHeight * 0.01),
                                  Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Container(
                                      height: screenHeight * 0.09,
                                      width: screenWidth * 0.9,
                                      child: Padding(
                                        padding: EdgeInsets.only(top: screenHeight * 0.005, left: screenWidth * 0.05, right: screenWidth * 0.05),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Phone :   ${_formatPhoneNumber(widget.cartPhone)}",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: screenWidth * 0.045,
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 1,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: screenHeight * 0.01),
                                  Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Container(
                                      height: screenHeight * 0.09,
                                      width: screenWidth * 0.9,
                                      child: Padding(
                                        padding: EdgeInsets.only(top: screenHeight * 0.005, left: screenWidth * 0.05, right: screenWidth * 0.05),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Email :  ${_formatEmail(widget.cartemail)}",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: screenWidth * 0.045,
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 1,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: screenHeight * 0.01),
                                  Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Container(
                                      height: screenHeight * 0.09,
                                      width: screenWidth * 0.9,
                                      child: Padding(
                                        padding: EdgeInsets.only(top: screenHeight * 0.005, left: screenWidth * 0.05, right: screenWidth * 0.05),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Location :   ${widget.cartLocation}",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: screenWidth * 0.045,
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 1,
                                              ),
                                            ),

                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: screenHeight * 0.01),
                                  Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Container(
                                      height: screenHeight * 0.09,
                                      width: screenWidth * 0.9,
                                      child: Padding(
                                        padding: EdgeInsets.only(top: screenHeight * 0.005, left: screenWidth * 0.05, right: screenWidth * 0.05),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Category :   ${widget.cartCategory}",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: screenWidth * 0.045,
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 1,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: screenHeight * 0.01),
                                  Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Container(
                                      height: screenHeight * 0.09,
                                      width: screenWidth * 0.9,
                                      child: Padding(
                                        padding: EdgeInsets.only(top: screenHeight * 0.005, left: screenWidth * 0.05, right: screenWidth * 0.05),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Amount :   ${widget.cartAmount}",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: screenWidth * 0.045,
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 1,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: screenHeight * 0.01),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

String _formatPhoneNumber(String phoneNumber) {
  // Remove all non-numeric characters from the phone number
  String digitsOnly = phoneNumber.replaceAll(RegExp(r'[^\d]'), '');

  // Check if the phone number is empty or not
  if (digitsOnly.isEmpty) {
    return '';
  }

  // Format the phone number in the standard format "(XXX) XXX-XXXX"
  return '(${digitsOnly.substring(0, 3)}) ${digitsOnly.substring(3, 6)}-${digitsOnly.substring(6, 10)}';
}

bool _isValidEmail(String email) {
  // Regular expression for validating email addresses
  RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  return emailRegex.hasMatch(email);
}

// Function to format the email for display
String _formatEmail(String email) {
  // Check if the email is valid
  if (_isValidEmail(email)) {
    return email; // If valid, return the email as it is
  } else {
    return 'Invalid Email'; // If not valid, display "Invalid Email"
  }
}
