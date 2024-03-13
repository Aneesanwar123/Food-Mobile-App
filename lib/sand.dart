import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_intern/burger.dart';
import 'package:food_intern/pizza.dart';

import 'cart.dart';
import 'fries.dart';
import 'home.dart';
class sand extends StatefulWidget {
  const sand({super.key});

  @override
  State<sand> createState() => _sandState();
}

class _sandState extends State<sand> {
// initial quantity
  int sandamount = 200;

  // Price of one Fries
  int quantity = 1;

  // Compute total amount dynamically
  int get totalamount => quantity * sandamount;

  // create an function name incrementquantity for increament the the quantity
  void increamentquantity(){
    setState(() {

      // Increment quantity
      quantity++;
    });
  }
  // create an function name decreamentquantity for decrease the quantity
  void decreamentquantity(){
    setState(() {
      // if the quantity is greater then 1 then allow to decreament value/amount
      if(quantity > 1){
        quantity--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                "Choose",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: MediaQuery.of(context).size.width * 0.045, // Adjust font size dynamically
                  fontWeight: FontWeight.bold,
                ),
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
      backgroundColor: Color(0xffe6e6e5),
      appBar: null,
      body: LayoutBuilder(
          builder: (BuildContext context,BoxConstraints constraints) {
            double screenWidth = MediaQuery.of(context).size.width;
            double screenHeight = MediaQuery.of(context).size.height;
            return Scaffold(
              backgroundColor: Color(0xffe6e6e5),
              appBar: null,
              body: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  final double screenWidth = constraints.maxWidth;
                  final double screenHeight = constraints.maxHeight;

                  return SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: constraints.minHeight,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
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
                                padding: EdgeInsets.only(top: screenHeight * 0.05, left: screenWidth * 0.05),
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
                                      padding: EdgeInsets.only(right: screenWidth * 0.08),
                                      child: Icon(Icons.menu, color: Colors.white,size:screenWidth*0.09,),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: screenHeight * 0.10),                                child: Center(
                                  child: Container(
                                    height: screenHeight * 0.35,
                                    width: screenWidth * 0.75,
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.3),
                                          spreadRadius: 0.1,
                                          blurRadius: 1000,
                                          offset: Offset(0, 3),
                                        )
                                      ],
                                    ),
                                    child: Image.asset("images/sandwich.png"),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.all(screenWidth * 0.02),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: screenWidth * 0.05),
                                  child: Text(
                                    "Club Sandwich",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: screenWidth * 0.05,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: screenWidth * 0.09),
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: Text(
                                      // Display the total amount
                                      "Rs: $totalamount",
                                      style: TextStyle(
                                        color: Color(0xff900e0e),
                                        fontWeight: FontWeight.bold,
                                        fontSize: screenWidth * 0.05,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.01),
                          Padding(
                            padding: EdgeInsets.only(left: screenWidth * 0.06),
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                "Sandwich",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: screenWidth * 0.045,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.02),
                          Padding(
                            padding: EdgeInsets.only(left: screenWidth * 0.06),
                            child: Row(
                              children: [
                                Container(
                                  width: screenWidth * 0.35,
                                  height: screenHeight * 0.07,
                                  decoration: BoxDecoration(
                                    color: Color(0xff900e0e),
                                    borderRadius: BorderRadius.circular(screenHeight * 0.1),
                                  ),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>burgtext()));
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                      Colors.transparent, // Make button transparent to show container color
                                      elevation: 0, // Remove button elevation
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(screenHeight * 0.04), // Match container border radius// Add border color
                                      ),
                                    ),
                                    child: Text(
                                      "Details",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: screenWidth * 0.04,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                SizedBox(width: screenWidth * 0.03),
                                Container(
                                  width: screenWidth * 0.35,
                                  height: screenHeight * 0.07,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(screenHeight * 0.1),
                                  ),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>login()));
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                      Colors.transparent, // Make button transparent to show container color
                                      elevation: 0, // Remove button elevation
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(screenHeight * 0.04), // Match container border radius// Add border color
                                      ),
                                    ),
                                    child: Text(
                                      "Reviews",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: screenWidth * 0.045,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.02),
                          Padding(
                            padding: EdgeInsets.only(left: screenWidth * 0.06),
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text:
                                    "A hamburger, a quintessential American classic, is a savory delight consisting of a grilled or fried beef patty nestled between two soft buns, typically accompanied by various toppings",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: screenWidth * 0.045,
                                    ),
                                  ),
                                  TextSpan(
                                    text: " See More",
                                    style: TextStyle(
                                      color: Color(0xff900e0e),
                                      fontWeight: FontWeight.bold,
                                      fontSize: screenWidth * 0.045,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        // Handle "See More" action
                                      },
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.02),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
                            child: Row(
                              children: [
                                Flexible(
                                  flex: 1,
                                  child: Center(
                                    child: Container(
                                      width: screenWidth * 0.8, // Set the width to match the screen width or any desired value
                                      height: screenHeight * 0.1,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(screenHeight * 0.2),
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: screenHeight * 0.05,
                                            width: screenHeight * 0.05,
                                            decoration: BoxDecoration(
                                              color: Color(0xff900e0e),
                                              borderRadius: BorderRadius.circular(50),
                                            ),
                                            alignment: Alignment.center,
                                            child: IconButton(
                                              onPressed: () {
                                                // call a fucntion which we create for a updating amount according to the user cart tapping
                                                increamentquantity();
                                              },
                                              icon: Icon(
                                                CupertinoIcons.add,
                                                color: Colors.white,
                                                size: screenWidth * 0.05,
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: screenWidth * 0.03),
                                          Text(

                                            // Update the quantity dynamically
                                            "$quantity",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: screenWidth * 0.045,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(width: screenWidth * 0.03),
                                          Container(
                                            height: screenHeight * 0.05,
                                            width: screenHeight * 0.05,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color(0xff900e0e),
                                            ),
                                            child: Stack(
                                              children: [
                                                Center(
                                                  child: IconButton(
                                                    onPressed: () {
                                                      // call a fucntion which we create for a Decreament quantity to allow a user when the quantity exceed 1
                                                      decreamentquantity();
                                                    },
                                                    icon: Icon(
                                                      CupertinoIcons.minus,
                                                      color: Colors.white,
                                                      size: screenWidth * 0.05,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: screenWidth * 0.03),
                                Flexible(
                                  flex: 1,
                                  child: Center(
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>cart()));
                                      },
                                      child: Container(
                                        width: screenWidth * 0.8, // Set the width to match the screen width or any desired value
                                        height: screenHeight * 0.1,
                                        decoration: BoxDecoration(
                                          color: Color(0xff900e0e),
                                          borderRadius: BorderRadius.circular(screenHeight * 0.2),
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                                Icons.shopping_cart,
                                                color: Colors.white,
                                                size: screenWidth*0.09
                                            ),
                                            Text(
                                              "Add to Cart",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: screenWidth * 0.045,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
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
      ),
    );
  }
}
