import 'package:flutter/material.dart';
class burgtext extends StatefulWidget {
  const burgtext({super.key});

  @override
  State<burgtext> createState() => _burgtextState();
}

class _burgtextState extends State<burgtext> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe6e6e5),
      appBar: null,
      body: Column(
        children: [
          SizedBox(height: 100,),
          Padding(
            padding: const EdgeInsets.only(right: 233),
            child: Text(
              "Hamburger",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 40,),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              "The hamburger, a quintessential staple of fast food culture, has transcended its humble origins to become an iconic culinary delight enjoyed worldwide. Consisting of a grilled or fried patty made from ground beef or alternatives such as chicken, turkey, or plant-based ingredients, the hamburger is typically sandwiched between two halves of a soft, fluffy bun. Its versatility allows for endless customization with a myriad of toppings, condiments, and accompaniments, catering to a wide range of tastes and preferences. Originally conceived in the United States, the exact origins of the hamburger are shrouded in lore and debate. However, it is widely believed to have gained popularity during the late 19th and early 20th centuries, coinciding with the rise of fast-food restaurants and street vendors. The portability, affordability, and satisfying flavor profile of the hamburger quickly endeared it to the masses, cementing its status as a beloved comfort food",
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                // fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
