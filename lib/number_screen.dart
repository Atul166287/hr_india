import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import 'model/number_model.dart';
import 'otp_screen.dart';

class NumberScreen extends StatefulWidget {
  const NumberScreen({super.key});

  @override
  State<NumberScreen> createState() => _NumberScreenState();
}

class _NumberScreenState extends State<NumberScreen> {
  final Color customColor = const Color(0xFF0790e9);

  final TextEditingController contactController = TextEditingController();

  late GetOtpModel getOptModel;
  bool isApiCallInProgress = false; // Added to track API call progress

  Future<void> sendOTP(String contact) async {
    setState(() {
      isApiCallInProgress = true; // API call is starting
    });

    const String apiUrl = 'https://www.thehrindia.com/api/Api/get_otp';
    final Map<String, dynamic> formData = {
      'contact': contact,
    };
    http.Response response = await http.post(Uri.parse(apiUrl), body: formData);

    var jsonResponse = json.decode(response.body);
    getOptModel = GetOtpModel.fromMap(jsonResponse);

    print("1: ${getOptModel.status}");
    print("2: ${response.body}");
    print("3: ${response.statusCode}");

    if (getOptModel.status == 200) {
      print('OTP Sent Successfully.');
      print('Response: ${getOptModel.status}');
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => OtpScreen(contact),));
    } else {
      print('Failed to send OTP. Status Code: ${getOptModel.status}');
      Fluttertoast.showToast(
        msg: "Failed to send OTP",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }

    setState(() {
      isApiCallInProgress = false; // API call is complete
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("assets/theme_image.jpg"),

            Container(
              color: Colors.white,
              height: 30,
            ),

            Container(
              color: Colors.white,
              child: Row(
                children: [
                  SizedBox(width: screenWidth /20,),
                  const Text("Mobile Number",
                  style: TextStyle(
                    backgroundColor: Colors.white,
                    color: Colors.grey,
                    fontSize: 18
                  ),
                  ),
                ],
              ),
            ),

            Container(
              height: 48,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6)
              ),
              width: screenWidth / 1.1,
              child: TextField(
                keyboardType: TextInputType.number,
                controller: contactController,
                decoration: const InputDecoration(
                  hintStyle: TextStyle(
                      // fontSize: 18,
                      color: Colors.grey
                  ),
                  hintText: "Enter Your Mobile Number",
                  // border: OutlineInputBorder(
                  //     borderRadius: BorderRadius.all(Radius.circular(6))
                  // ),
                ),
              ),
            ),

            // Padding(
            //   padding: const EdgeInsets.only(bottom: 26),
            //   child: Container(
            //     width: screenWidth / 1.2,
            //     decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(15)),
            //     child: Container(
            //       decoration: BoxDecoration(
            //           color: Colors.blue[800],
            //           borderRadius: BorderRadius.circular(15)),
            //       width: screenWidth / 1.2,
            //       child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.center,
            //         children: [
            //           const Row(
            //             mainAxisAlignment: MainAxisAlignment.center,
            //             children: [
            //               Padding(
            //                 padding: EdgeInsets.only(top: 14),
            //                 child: Text("YOUR MOBILE NUMBER",
            //                   style: TextStyle(fontSize: 20,
            //                       color: Colors.white,
            //                       fontWeight: FontWeight.bold
            //                   ),
            //                 ),
            //               ),
            //             ],
            //           ),
            //           Padding(
            //             padding: const EdgeInsets.only(left: 10, right: 10, top: 14,),
            //             child: Container(
            //               height: 48,
            //               decoration: BoxDecoration(
            //                   color: Colors.white,
            //                   borderRadius: BorderRadius.circular(6)
            //               ),
            //               width: screenWidth / 1.3,
            //               child: TextField(
            //                 keyboardType: TextInputType.number,
            //                 controller: contactController,
            //                 decoration: const InputDecoration(
            //                   labelStyle: TextStyle(
            //                       fontSize: 18,
            //                       color: Colors.grey
            //                   ),
            //                   labelText: "Mobile Number",
            //                   border: OutlineInputBorder(
            //                       borderRadius: BorderRadius.all(Radius.circular(6))
            //                   ),
            //                 ),
            //               ),
            //             ),
            //           ),
            //           Padding(
            //             padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
            //             child: SizedBox(
            //               height: 45,
            //               width: screenWidth / 1.3,
            //               child: ElevatedButton(
            //                 style: ButtonStyle(
            //                   backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
            //                 ),
            //                 onPressed: isApiCallInProgress // Conditional onPressed based on API call progress
            //                     ? null
            //                     : () {
            //                   sendOTP(contactController.text);
            //                 },
            //                 child: isApiCallInProgress
            //                     ? CircularProgressIndicator(
            //                   valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            //                 )
            //                     : const Text("CONTINUE",
            //                   style: TextStyle(
            //                     fontSize: 22,
            //                     color: Colors.blue,
            //                     fontWeight: FontWeight.bold,
            //                   ),
            //                 ),
            //               ),
            //             ),
            //           ),
            //           const Padding(
            //             padding: EdgeInsets.only(top: 21),
            //             child: Text("By clicking 'Continue', you agree to the Terms",
            //                 style: TextStyle(color: Colors.white, fontSize: 15)
            //             ),
            //           ),
            //           const Padding(
            //             padding: EdgeInsets.only(top: 4, bottom: 22),
            //             child: Text("and conditions and privacy policy",
            //                 style: TextStyle(color: Colors.white, fontSize: 15)
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),


            const SizedBox(height: 25,),

            SizedBox(
              height: 45,
              width: screenWidth / 1.3,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                ),
                onPressed: isApiCallInProgress // Conditional onPressed based on API call progress
                    ? null
                    : () {
                  sendOTP(contactController.text);
                },
                child: isApiCallInProgress
                    ? const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                )
                    : const Text("CONTINUE",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10,),

            const Padding(
              padding: EdgeInsets.only(top: 21),
              child: Text("By clicking 'Continue', you agree to the Terms",
                  style: TextStyle(color: Colors.grey, fontSize: 15)
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 4, bottom: 22),
              child: Text("and conditions and privacy policy",
                  style: TextStyle(color: Colors.grey, fontSize: 15)
              ),
            ),

          ],
        ),
      ),
    );
  }

}
