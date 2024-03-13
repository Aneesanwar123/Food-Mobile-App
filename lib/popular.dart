import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_intern/pizza.dart';
import 'package:food_intern/sand.dart';

import 'burger.dart';
import 'fries.dart';
class popular extends StatefulWidget {
  const popular({super.key});

  @override
  State<popular> createState() => _popularState();
}

class _popularState extends State<popular> {
  int amount = 250; // Price of burger
  int amount2 = 350; // Price of pizza
  int amount3 = 200; // Price of sandwich
  int amount4 = 250;
  int quantity = 0;
  int burgerPrice = 250; // Price of burger
  int pizzaPrice = 350; // Price of pizza
  int sandwichPrice = 200; // Price of sandwich
  int friesPrice = 250; // Price of Fries

  // create an function name _incrementBurgerAmount for increamnet the burer amount accorinding to the user cart tapping
  void _incrementBurgerAmount() {
    setState(() {
      // Increment quantity
      quantity++;

      // Increment amount by the price of one burger
      amount += burgerPrice;
    });
  }
  // create an function name _incrementPizzaAmount for increamnet the Pizza amount accorinding to the user cart tapping
  void _incrementPizzaAmount(){
    setState(() {
      quantity++; // Increment quantity
      amount2 += pizzaPrice; // Increment amount by the price of one burger
    });
  }
  // create an function name _incrementSandwichAmount for increamnet the sandwich amount accorinding to the user cart tapping

  void _incrementSandwichAmount(){
    setState(() {
      // Increment quantity
      quantity++;

      // Increment amount by the price of one burger
      amount3 += sandwichPrice;
    });
  }

  // create an function name _incrementFriesAmount for increamnet the Fries amount accorinding to the user cart tapping

  void _incrementFriesAmount(){
    setState(() {
      // Increment quantity
      quantity++;

      // Increment amount by the price of one burger
      amount4 += friesPrice;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe6e6e5),
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
            )
          ],
        ),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context,BoxConstraints constraints)
    {
      final double screenWidth = constraints.maxWidth;
      final double screenHeight = constraints.maxHeight;
      return SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: screenHeight*0.04,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage("images/pink.png"),
                    radius: 30,
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
                        icon: Icon(CupertinoIcons.line_horizontal_3_decrease, color: Colors.black, size: screenWidth * 0.09),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: screenWidth * 0.07), // Adjust left padding dynamically
              child: Row(
                children: [
                  SizedBox(height: screenHeight * 0.06),
                  Text(
                    "Popular",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: screenWidth * 0.060, // Adjust font size dynamically
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.02), // Adjust height dynamically
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05), // Adjust horizontal padding dynamically
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(screenWidth * 0.1), // Adjust border radius dynamically
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.08, // Adjust height dynamically
                      width: MediaQuery.of(context).size.width * 0.9, // Adjust width dynamically
                      color: Colors.white,
                      child: CupertinoSearchTextField(
                        placeholder: "Push The Crispy Food",
                        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1), // Adjust padding dynamically
                        placeholderStyle: TextStyle(
                          color: Colors.black54,
                          fontSize: MediaQuery.of(context).size.width * 0.045, // Adjust font size dynamically
                          letterSpacing: 1.0,
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: screenHeight * 0.04),
                  Center(
                    child: Container(
                      height: 90,
                      width: 250,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.4),
                            spreadRadius: 0.14,
                            blurRadius: 10,
                            offset: Offset(0, 3),
                          )
                        ],
                      ),
                      child: const Stack(
                        children: [
                          Column(
                            children: [
                              Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "Bacon Cheddar",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(width: 15,),
                                    Text(
                                      "Burger",
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),

                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
        }
    ),
    );
  }
}
