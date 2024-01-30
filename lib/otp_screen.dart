import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'bottom_navigation_bar_screen.dart';
import 'model/number_model.dart';
import 'model/otp_model.dart';



class OtpScreen extends StatefulWidget {
  var contact;
  OtpScreen(this.contact,{super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final Color customColor = const Color(0xFF0790e9);

  final TextEditingController otpController = TextEditingController();

  late VerifiedOtpModel verifiedOtpModel;

  late GetOtpModel getOptModel;

  Future<void> verifiedOTP(String otp) async {

    const String apiUrl = 'https://www.thehrindia.com/api/Api/verify_otp';
    final Map<String, dynamic> formData = {
      'contact': widget.contact,
      'otp': otp,
    };
    http.Response response= await http.post(Uri.parse(apiUrl), body: formData,);

    var jsonResponse=json.decode(response.body);
    verifiedOtpModel=VerifiedOtpModel.fromMap(jsonResponse);

    print("1: ${verifiedOtpModel.status}");
    print("2: ${response.body}");
    print("3: ${response.statusCode}");


    if (verifiedOtpModel.status == 200) {
      print('OTP Verified Successfully.');
      print('Response: ${verifiedOtpModel.status}');
      final SharedPreferences s= await SharedPreferences.getInstance();
      s.setBool(
        'flutterkey', true,
      );
      Navigator.pushReplacement(context,  MaterialPageRoute(builder:  (context) =>  const BottomNavigationBarScreen(),));
    } else {
      print('Failed to Verified OTP. Status Code: ${verifiedOtpModel.status}');
      Fluttertoast.showToast(
        msg: "Failed to Verified OTP",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("assets/theme_image.jpg"),
            // Padding(
            //   padding: const EdgeInsets.only(bottom: 26),
            //   child: Container(
            //     width:  screenWidth/1.2,
            //     decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(15)),
            //     child: Container(
            //       decoration: BoxDecoration(
            //           color:  Colors.blue[800],
            //           borderRadius: BorderRadius.circular( 15)),
            //       width: screenWidth/1.2,
            //       child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.center,
            //         children: [
            //           const Row(
            //             mainAxisAlignment: MainAxisAlignment.center,
            //             children: [
            //               Padding(
            //                 padding: EdgeInsets.only(top: 14),
            //                 child: Text("WE HAVE SEND AN OTP\n     ON YOUR NUMBER",
            //                   style: TextStyle(fontSize: 20,
            //                       color: Colors.white,
            //                       fontWeight: FontWeight.bold
            //                   ),
            //                 ),
            //               ),
            //             ],
            //           ),
            //
            //           Padding(
            //             padding: const EdgeInsets.only(left: 10,right: 10,top: 14,),
            //             child: Container(
            //               height: 48,
            //               decoration: BoxDecoration(
            //                   color: Colors.white,
            //                   borderRadius: BorderRadius.circular(6)
            //               ),
            //               width: screenWidth/1.3,
            //               child: TextField(
            //                 keyboardType: TextInputType.number,
            //                 controller: otpController,
            //                 decoration: const InputDecoration(
            //                   labelStyle: TextStyle(
            //                       fontSize:18,
            //                       color: Colors.grey
            //                   ),
            //                   labelText: "ENTER WHATSAPP OTP",
            //                   border: OutlineInputBorder(
            //                       borderRadius: BorderRadius.all(Radius.circular(6)
            //                       )
            //                   ),
            //                 ),
            //               ),
            //             ),
            //           ),
            //
            //           Padding(
            //             padding: const EdgeInsets.only( top: 10,left: 10,right: 10),
            //             child: SizedBox(
            //               height: 45,
            //               width: screenWidth/1.3,
            //               child: ElevatedButton(
            //                   style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.white),),
            //                   onPressed:  (){
            //                     verifiedOTP(otpController.text);
            //                   },
            //                   child: const Text("LOGIN",
            //                     style: TextStyle(fontSize:22,
            //                         color: Colors. blue,
            //                         fontWeight: FontWeight.bold
            //                     )
            //                     ,)
            //               ),
            //             ),
            //           ),
            //           Padding(
            //             padding: const EdgeInsets.only(top:10,bottom: 10),
            //             child: InkWell(
            //               child: const Text("Resend OTP",
            //                   style: TextStyle(color: Colors.white,fontSize: 18)
            //               ),
            //
            //               onTap: () async {
            //
            //                 const String apiUrl = 'https://www.thehrindia.com/api/Api/get_otp';
            //                 final Map<String, dynamic> formData = {
            //                   'contact': widget.contact,
            //                 };
            //                 http.Response response= await http.post(Uri.parse(apiUrl), body: formData,);
            //
            //                 var jsonResponse=json.decode(response.body);
            //                 getOptModel=GetOtpModel.fromMap(jsonResponse);
            //
            //                 print("1: ${getOptModel.status}");
            //                 print("2: ${response.body}");
            //                 print("3: ${response.statusCode}");
            //
            //
            //                 if (getOptModel.status == 200) {
            //                   Fluttertoast.showToast(
            //                     msg: "OTP has been sent successfully",
            //                     toastLength: Toast.LENGTH_SHORT,
            //                     gravity: ToastGravity.BOTTOM,
            //                     timeInSecForIosWeb: 1,
            //                     backgroundColor: Colors.green,
            //                     textColor: Colors.white,
            //                     fontSize: 16.0,
            //                   );
            //                   print('OTP Resent Successfully.');
            //                   print('Response: ${getOptModel.status}');
            //                 } else {
            //                   Fluttertoast.showToast(
            //                     msg: "Failed to send OTP",
            //                     toastLength: Toast.LENGTH_SHORT,
            //                     gravity: ToastGravity.BOTTOM,
            //                     timeInSecForIosWeb: 1,
            //                     backgroundColor: Colors.green,
            //                     textColor: Colors.white,
            //                     fontSize: 16.0,
            //                   );
            //                   print('Failed to send OTP. Status Code: ${getOptModel.status}');
            //                 }
            //               },
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),

            Container(
              color: Colors.white,
              height: 30,
            ),

            Container(
              color: Colors.white,
              child: Row(
                children: [
                  SizedBox(width: screenWidth /20,),
                  const Text("Enter OTP",
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
              width: screenWidth/1.1,
              child: TextField(
                keyboardType: TextInputType.number,
                controller: otpController,
                decoration: const InputDecoration(
                  hintStyle: TextStyle(
                      // fontSize:18,
                      color: Colors.grey
                  ),
                  hintText: "ENTER WHATSAPP OTP",
                ),
              ),
            ),

            const SizedBox(height: 25,),

            SizedBox(
              height: 45,
              width: screenWidth/1.3,
              child: ElevatedButton(
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),),
                  onPressed:  (){
                    verifiedOTP(otpController.text);
                  },
                  child: const Text("LOGIN",
                    style: TextStyle(fontSize:20,
                        color: Colors. white,
                        fontWeight: FontWeight.bold
                    )
                    ,)
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top:10,bottom: 10),
              child: InkWell(
                child: const Text("Resend OTP",
                    style: TextStyle(color: Colors.grey,fontSize: 18)
                ),

                onTap: () async {

                  const String apiUrl = 'https://www.thehrindia.com/api/Api/get_otp';
                  final Map<String, dynamic> formData = {
                    'contact': widget.contact,
                  };
                  http.Response response= await http.post(Uri.parse(apiUrl), body: formData,);

                  var jsonResponse=json.decode(response.body);
                  getOptModel=GetOtpModel.fromMap(jsonResponse);

                  print("1: ${getOptModel.status}");
                  print("2: ${response.body}");
                  print("3: ${response.statusCode}");


                  if (getOptModel.status == 200) {
                    Fluttertoast.showToast(
                      msg: "OTP has been sent successfully",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.green,
                      textColor: Colors.white,
                      fontSize: 16.0,
                    );
                    print('OTP Resent Successfully.');
                    print('Response: ${getOptModel.status}');
                  } else {
                    Fluttertoast.showToast(
                      msg: "Failed to send OTP",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.green,
                      textColor: Colors.white,
                      fontSize: 16.0,
                    );
                    print('Failed to send OTP. Status Code: ${getOptModel.status}');
                  }
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}