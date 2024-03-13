import 'dart:convert';
import 'package:food_intern/cart.dart';

import 'cartpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import 'cartpage.dart';
import 'delete.dart';
import 'home.dart';
class delete extends StatefulWidget {
  final String cartName;
  final String cartPhone;
  final String cartemail;
  final String cartLocation;
  final String cartCategory;
  final String cartAmount;
  const delete({super.key, required this.cartName, required this.cartPhone, required this.cartemail, required this.cartLocation, required this.cartCategory, required this.cartAmount});

  @override
  State<delete> createState() => _deleteState();
}

class _deleteState extends State<delete> {
  // TextEditingController cartname = TextEditingController();
  // TextEditingController cartphone = TextEditingController();
  // TextEditingController cartemail = TextEditingController();
  // TextEditingController cartlocation = TextEditingController();
  // TextEditingController cartcategory = TextEditingController();
  // TextEditingController cartAmount = TextEditingController();
  //
  // Future<void> updaterecord() async {
  //   if (cartname.text.isNotEmpty &&
  //       cartphone.text.isNotEmpty &&
  //       cartemail.text.isNotEmpty &&
  //       cartlocation.text.isNotEmpty &&
  //       cartcategory.text.isNotEmpty &&
  //       cartAmount.text.isNotEmpty) {
  //     try {
  //       String uri = "http://10.0.2.2/food_api/edit.php";
  //       var res = await http.post(Uri.parse(uri), body: {
  //         "cartname": cartname.text,
  //         "cartphone": cartphone.text,
  //         "cartemail": cartemail.text,
  //         "cartlocation": cartlocation.text,
  //         "cartcategory": cartcategory.text,
  //         "cartAmount": cartAmount.text
  //       });
  //
  //       var response = jsonDecode(res.body);
  //
  //       if (response["success"] == "true") {
  //         print("Record Updated");
  //         // Show a SnackBar to indicate that the record was inserted successfully
  //         ScaffoldMessenger.of(context).showSnackBar(
  //           SnackBar(
  //             content: Text("Record inserted"),
  //           ),
  //         );
  //       } else {
  //         print("Record not inserted");
  //         // Show a SnackBar to indicate that the record insertion failed
  //         ScaffoldMessenger.of(context).showSnackBar(
  //           SnackBar(
  //             content: Text("Record not inserted"),
  //           ),
  //         );
  //       }
  //     } catch (e) {
  //       print(e);
  //     }
  //   } else {
  //     print("Please fill all fields");
  //   }
  // }
  //
  // bool _obscureText = true;
  // int _currentIndex = 0;
  // @override
  //
  // void initState() {
  //   cartname.text = widget.cartName;
  //   cartphone.text = widget.cartPhone;
  //   cartemail.text = widget.cartemail;
  //   cartlocation.text = widget.cartLocation;
  //   cartcategory.text = widget.cartCategory;
  //   cartAmount.text = widget.cartAmount;
  //   super.initState();
  // }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: null,
    );
  }
}


//
// bool _isValidEmail(String email) {
//   // Regular expression for validating email addresses
//   RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
//   return emailRegex.hasMatch(email);
// }
//
// class PhoneNumberFormatter extends TextInputFormatter {
//   @override
//   TextEditingValue formatEditUpdate(
//       TextEditingValue oldValue, TextEditingValue newValue) {
//     // Keep only digits
//     String newText = newValue.text.replaceAll(RegExp(r'\D'), '');
//
//     // Ensure newText has at least 10 characters
//     if (newText.length >= 10) {
//       // Handle country code if needed
//       newText = newText.substring(0, 10);
//
//       // Format the phone number as (XXX) XXX-XXXX
//       newText = _formatPhoneNumber(newText);
//     }
//
//     return newValue.copyWith(
//       text: newText,
//       selection: TextSelection.collapsed(offset: newText.length),
//     );
//   }
//
//   String _formatPhoneNumber(String phoneNumber) {
//     // Format the phone number as (XXX) XXX-XXXX
//     return '(${phoneNumber.substring(0, 3)}) ${phoneNumber.substring(3, 6)}-${phoneNumber.substring(6, 10)}';
//   }
// }
