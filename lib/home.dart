import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_intern/burger.dart';
import 'package:food_intern/cart.dart';
import 'package:food_intern/category.dart';
import 'package:food_intern/fries.dart';
import 'package:food_intern/pizza.dart';
import 'package:food_intern/sand.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {

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
  // create an varibale of name searchquerry for seraching
  String _searchQuery = '';


// varibale of indexing the current tab
  int _currentIndex= 0 ;

// Variable to store the position along the x-axis
  double _positionX = 0.0;
  @override
  Widget build(BuildContext context) {
// Filter the list of categories based on the search query
    List<Category> filteredCategories = categoryData.where((category) =>

    // Check if the lowercase name of the category contains the lowercase search query
    category.name.toLowerCase().contains(_searchQuery.toLowerCase())
    ).toList();
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Color(0xff900e0e),
          borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height * 0.05), // Adjust border radius dynamically
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05, // Adjust horizontal padding dynamically
            vertical: MediaQuery.of(context).size.height * 0.015, // Adjust vertical padding dynamically
          ),
          child: GNav(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04), // Adjust padding dynamically
              backgroundColor: Color(0xff900e0e),
              color: Colors.white,
              activeColor: Colors.white,
              tabBackgroundColor: Colors.white24,
              gap: MediaQuery.of(context).size.width * 0.01, // Adjust gap dynamically

              // Callback function to handle tab changes
              onTabChange: (index) {
                setState(() {

                  // Update the current index with the index of the tapped tab
                  _currentIndex = index;
                });

                // switch statement navigate according to the index in bottomnavbar accorind to the user tapping icon
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
                    fontSize: MediaQuery.of(context).size.width*0.045,
                    color: Colors.white
                  ),
                  iconColor: Colors.white,
                  iconSize: MediaQuery.of(context).size.width*0.070,
                ),
                GButton(
                  icon: CupertinoIcons.heart,
                  text: "Likes",
                  textStyle: TextStyle(
                    fontSize: MediaQuery.of(context).size.width*0.045,
                      color: Colors.white
                  ),
                  iconColor: Colors.white,
                  backgroundColor: Colors.white24,
                  iconSize: MediaQuery.of(context).size.width*0.070,
                ),
                GButton(
                  icon: CupertinoIcons.cart,
                  text: "Cart",
                  textStyle: TextStyle(
                    fontSize: MediaQuery.of(context).size.width*0.045,
                  ),
                  iconColor: Colors.white,
                  backgroundColor: Colors.white24,
                  iconSize: MediaQuery.of(context).size.width*0.070,
                ),
                GButton(
                  icon: CupertinoIcons.person,
                  text: "Profile",
                  textStyle: TextStyle(
                    fontSize: MediaQuery.of(context).size.width*0.045,
                    color: Colors.white
                  ),
                  iconColor: Colors.white,
                  iconSize: MediaQuery.of(context).size.width*0.070,
                )
              ]
          ),
        ),
      ),
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
          // media querry for app make it responsive for all devices it adujust the content according to he device height and width
          final double screenWidth = constraints.maxWidth;
          final double screenHeight = constraints.maxHeight;
          return  SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
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
                SizedBox(height: 10,),
                Padding(
                  padding: EdgeInsets.only(right: screenWidth * 0.70), // Adjust right padding dynamically
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Choose",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: screenWidth * 0.045, // Adjust font size dynamically
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: screenWidth * 0.07), // Adjust left padding dynamically
                  child: Row(
                    children: [
                      Text(
                        "Your Favourite ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: screenWidth * 0.045, // Adjust font size dynamically
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Food",
                        style: TextStyle(
                          color: Color(0xff900e0e),
                          fontSize: screenWidth * 0.045, // Adjust font size dynamically
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
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(screenWidth * 0.1), // Adjust border radius dynamically
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.08, // Adjust height dynamically
                          width: MediaQuery.of(context).size.width * 0.7, // Adjust width dynamically
                          color: Colors.white,
                          child: CupertinoSearchTextField(
                            placeholder: "Search",
                            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1), // Adjust padding dynamically
                            placeholderStyle: TextStyle(
                              color: Colors.black54,
                              fontSize: MediaQuery.of(context).size.width * 0.045, // Adjust font size dynamically
                              letterSpacing: 1.0,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.025), // Adjust width dynamically
                      ClipRRect(
                        borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.1), // Adjust border radius dynamically
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.08, // Adjust height dynamically
                          width: MediaQuery.of(context).size.width * 0.15, // Adjust width dynamically
                          color: Color(0xff900e0e),
                          child: Center(
                            child: Icon(
                              CupertinoIcons.slider_horizontal_3,
                              color: Colors.white,
                              size: MediaQuery.of(context).size.width * 0.09, // Adjust icon size dynamically
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
              padding: EdgeInsets.symmetric(vertical: screenHeight * 0.03),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.07),
                    child: Text(
                      "Popular food",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: screenWidth * 0.045, // Adjust font size dynamically
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.07),
                    child: GestureDetector(
                      onTap: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (context)=>popular()));
                      },
                      child: Text(
                        "See all",
                        style: TextStyle(
                          color: Color(0xff900e0e),
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth * 0.045, // Adjust font size dynamically
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 21.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap:(){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>burger()));
                          },
                          child: Material(
                            borderRadius: BorderRadius.circular(10),
                            elevation: 3,
                            child: Container(
                              height: 200,
                              width: 140,
                              decoration: BoxDecoration(),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 90, top: 4),
                                      child: Icon(
                                        CupertinoIcons.heart,
                                        color: Color(0xff900e0e),
                                      ),
                                    ),
                                    Container(
                                      height: 95,
                                      width: 95,
                                      decoration: BoxDecoration(),
                                      child: Image.asset(
                                        "images/burger.png",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 44),
                                      child: Text(
                                        "Hamburger",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 80),
                                      child: Text(
                                        "Burger",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 12),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.symmetric(horizontal: 8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Rs: $amount",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              // fontSize: 15
                                            ),
                                          ),
                                          Container(
                                            height: 32,
                                            width: 32,
                                            decoration: BoxDecoration(
                                                color: Color(0xff900e0e),
                                                borderRadius:
                                                BorderRadius.circular(10)),
                                            alignment: Alignment.center,
                                            child: IconButton(
                                              onPressed: () {
                                                // call a fucntion which we create for a updating amount according to the user cart tapping

                                                _incrementBurgerAmount();
                                                // Navigator.push(context, MaterialPageRoute(builder: (context)=>fries()));
                                              },
                                              icon: Icon(
                                                Icons.add,
                                                color: Colors.white,
                                                size: 17,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>pizza()));
                          },
                          child: Material(
                            borderRadius: BorderRadius.circular(10),
                            elevation: 5,
                            child: Container(
                              height: 200,
                              width: 140,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 90, top: 4),
                                      child: Icon(
                                        CupertinoIcons.heart,
                                        color: Color(0xff900e0e),
                                      ),
                                    ),
                                    Container(
                                      height: 95,
                                      width: 95,
                                      decoration: BoxDecoration(),
                                      child: Image.asset(
                                        "images/pep.png",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 15),
                                      child: Text(
                                        "Pepperoni Pizza",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 92),
                                      child: Text(
                                        "pizza",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 12),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.symmetric(horizontal: 8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Rs: $amount2",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              // fontSize: 15
                                            ),
                                          ),
                                          Container(
                                            height: 32,
                                            width: 32,
                                            decoration: BoxDecoration(
                                                color: Color(0xff900e0e),
                                                borderRadius:
                                                BorderRadius.circular(10)),
                                            alignment: Alignment.center,
                                            child: IconButton(
                                              onPressed: () {

                                                // call a fucntion which we create for a updating amount according to the user cart tapping
                                                _incrementPizzaAmount();
                                                // Navigator.push(context, MaterialPageRoute(builder: (context)=>fries()));
                                              },
                                              icon: Icon(
                                                Icons.add,
                                                color: Colors.white,
                                                size: 17,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>sand()));
                          },
                          child: Material(
                            borderRadius: BorderRadius.circular(10),
                            elevation: 5,
                            child: Container(
                              height: 200,
                              width: 140,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 90, top: 4),
                                      child: Icon(
                                        CupertinoIcons.heart,
                                        color: Color(0xff900e0e),
                                      ),
                                    ),
                                    Container(
                                      height: 95,
                                      width: 95,
                                      decoration: BoxDecoration(),
                                      child: Image.asset(
                                        "images/sandwich.png",
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 23),
                                      child: Text(
                                        "Club Sandwich",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 64),
                                      child: Text(
                                        "Sandwich",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 12),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.symmetric(horizontal: 8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Rs: $amount3",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              // fontSize: 15
                                            ),
                                          ),
                                          Container(
                                            height: 32,
                                            width: 32,
                                            decoration: BoxDecoration(
                                                color: Color(0xff900e0e),
                                                borderRadius:
                                                BorderRadius.circular(10)),
                                            alignment: Alignment.center,
                                            child: IconButton(
                                              onPressed: () {
                                                // call a fucntion which we create for a updating amount according to the user cart tapping

                                                _incrementSandwichAmount();
                                                // Navigator.push(context, MaterialPageRoute(builder: (context)=>fries()));
                                              },
                                              icon: Icon(
                                                Icons.add,
                                                color: Colors.white,
                                                size: 17,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        GestureDetector(
                          onTap:(){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>fries()));
                          },
                          child: Material(
                            borderRadius: BorderRadius.circular(10),
                            elevation: 5,
                            child: Container(
                              height: 200,
                              width: 140,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 90, top: 4),
                                      child: Icon(
                                        CupertinoIcons.heart,
                                        color: Color(0xff900e0e),
                                      ),
                                    ),
                                    Container(
                                      height: 85,
                                      width: 85,
                                      decoration: BoxDecoration(),
                                      child: Image.asset(
                                        "images/fri.png",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(height: 8,),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 40),
                                      child: Text(
                                        "French Fries",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 93),
                                      child: Text(
                                        "Fries",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 12),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.symmetric(horizontal: 8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Rs: $amount4",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              // fontSize: 15
                                            ),
                                          ),
                                          Container(
                                            height: 32,
                                            width: 32,
                                            decoration: BoxDecoration(
                                                color: Color(0xff900e0e),
                                                borderRadius:
                                                BorderRadius.circular(10)),
                                            alignment: Alignment.center,
                                            child: IconButton(
                                              onPressed: () {

                                                // call a fucntion which we create for a updating amount according to the user cart tapping
                                                _incrementFriesAmount();
                                                // Navigator.push(context, MaterialPageRoute(builder: (context)=>fries()));

                                              },
                                              icon: Icon(
                                                Icons.add,
                                                color: Colors.white,
                                                size: 17,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: screenHeight * 0.03),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.07),
                        child: Text(
                          "Nearest",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: screenWidth * 0.045, // Adjust font size dynamically
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.07),
                        child: GestureDetector(
                          onTap: () {},
                          child: Text(
                            "See all",
                            style: TextStyle(
                              color: Color(0xff900e0e),
                              fontWeight: FontWeight.bold,
                              fontSize: screenWidth * 0.045, // Adjust font size dynamically
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 21.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap : () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>burger()));
                          },
                          child: Material(
                            borderRadius: BorderRadius.circular(10),
                            elevation: 3,
                            child: Container(
                              height: 200,
                              width: 140,
                              decoration: BoxDecoration(),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 90, top: 4),
                                      child: Icon(
                                        CupertinoIcons.heart,
                                        color: Color(0xff900e0e),
                                      ),
                                    ),
                                    Container(
                                      height: 95,
                                      width: 95,
                                      decoration: BoxDecoration(),
                                      child: Image.asset(
                                        "images/burger.png",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 47),
                                      child: Text(
                                        "Hamburger",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 83),
                                      child: Text(
                                        "Burger",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 12),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.symmetric(horizontal: 8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Rs: $amount",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              // fontSize: 15
                                            ),
                                          ),
                                          Container(
                                            height: 32,
                                            width: 32,
                                            decoration: BoxDecoration(
                                                color: Color(0xff900e0e),
                                                borderRadius:
                                                BorderRadius.circular(10)),
                                            alignment: Alignment.center,
                                            child: IconButton(
                                              onPressed: () {
                                                _incrementBurgerAmount();
                                                // Navigator.push(context, MaterialPageRoute(builder: (context)=>fries()));

                                              },
                                              icon: Icon(
                                                Icons.add,
                                                color: Colors.white,
                                                size: 17,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>pizza()));
                          },
                          child: Material(
                            borderRadius: BorderRadius.circular(10),
                            elevation: 5,
                            child: Container(
                              height: 200,
                              width: 140,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 90, top: 4),
                                      child: Icon(
                                        CupertinoIcons.heart,
                                        color: Color(0xff900e0e),
                                      ),
                                    ),
                                    Container(
                                      height: 95,
                                      width: 95,
                                      decoration: BoxDecoration(),
                                      child: Image.asset(
                                        "images/pep.png",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 16),
                                      child: Text(
                                        "Pepperoni Pizza",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 92),
                                      child: Text(
                                        "pizza",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 12),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.symmetric(horizontal: 8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Rs: $amount2",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              // fontSize: 15
                                            ),
                                          ),
                                          Container(
                                            height: 32,
                                            width: 32,
                                            decoration: BoxDecoration(
                                                color: Color(0xff900e0e),
                                                borderRadius:
                                                BorderRadius.circular(10)),
                                            alignment: Alignment.center,
                                            child: IconButton(
                                              onPressed: () {
                                                _incrementPizzaAmount();
                                                // Navigator.push(context, MaterialPageRoute(builder: (context)=>fries()));
                                              },
                                              icon: Icon(
                                                Icons.add,
                                                color: Colors.white,
                                                size: 17,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),

                        SizedBox(
                          width: 15,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>sand()));
                          },
                          child: Material(
                            borderRadius: BorderRadius.circular(10),
                            elevation: 5,
                            child: Container(
                              height: 200,
                              width: 140,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 90, top: 4),
                                      child: Icon(
                                        CupertinoIcons.heart,
                                        color: Color(0xff900e0e),
                                      ),
                                    ),
                                    Container(
                                      height: 95,
                                      width: 95,
                                      decoration: BoxDecoration(),
                                      child: Image.asset(
                                        "images/sandwich.png",
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 23),
                                      child: Text(
                                        "Club Sandwich",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 62),
                                      child: Text(
                                        "Sandwich",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 12),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.symmetric(horizontal: 8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Rs:$amount3",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              // fontSize: 15
                                            ),
                                          ),
                                          Container(
                                            height: 32,
                                            width: 32,
                                            decoration: BoxDecoration(
                                                color: Color(0xff900e0e),
                                                borderRadius:
                                                BorderRadius.circular(10)),
                                            alignment: Alignment.center,
                                            child: IconButton(
                                              onPressed: () {
                                                _incrementSandwichAmount();
                                              },
                                              icon: Icon(
                                                Icons.add,
                                                color: Colors.white,
                                                size: 17,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        GestureDetector(
                          onTap:(){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>fries()));
                          },
                          child: Material(
                            borderRadius: BorderRadius.circular(10),
                            elevation: 5,
                            child: Container(
                              height: 200,
                              width: 140,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 90, top: 4),
                                      child: Icon(
                                        CupertinoIcons.heart,
                                        color: Color(0xff900e0e),
                                      ),
                                    ),
                                    Container(
                                      height: 85,
                                      width: 85,
                                      decoration: BoxDecoration(),
                                      child: Image.asset(
                                        "images/fri.png",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(height: 8,),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 40),
                                      child: Text(
                                        "French Fries",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 94),
                                      child: Text(
                                        "Fries",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 12),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.symmetric(horizontal: 8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Rs:$amount4",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              // fontSize: 15
                                            ),
                                          ),
                                          Container(
                                            height: 32,
                                            width: 32,
                                            decoration: BoxDecoration(
                                                color: Color(0xff900e0e),
                                                borderRadius:
                                                BorderRadius.circular(10)),
                                            alignment: Alignment.center,
                                            child: IconButton(
                                              onPressed: () {
                                                _incrementFriesAmount();
                                              },
                                              icon: Icon(
                                                Icons.add,
                                                color: Colors.white,
                                                size: 17,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
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
        }
      ),
    );
  }
}

