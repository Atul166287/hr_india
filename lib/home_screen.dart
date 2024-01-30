import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:job_internship/explore.dart';

import 'apply_screen.dart';
import 'ask_for_referral.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final List<String> bannerList = [
    "https://images-eu.ssl-images-amazon.com/images/G/31/img21/Fashion/Event/N2GL_sep/Coupon-PC-SEP.jpg",
    "https://images-eu.ssl-images-amazon.com/images/G/31/img21/Fashion/Event/N2GL_sep/Ingress-SEP.jpg",
    "https://img.etimg.com/thumb/msid-101778071,width-300,height-225,imgsize-323182,,resizemode-75/amazon-prime-day-sale.jpg",
    "https://img.etimg.com/photo/msid-101610708/shop-by-category.jpg",
  ];

  late PageController _pageController;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);

    // Auto-scroll every 5 seconds
    _timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_pageController.page == bannerList.length - 1) {
        _pageController.animateToPage(
          0,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      } else {
        _pageController.nextPage(
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    // print(screenWidth);
    // print(screenHeight);

    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "assets/logo.png",
          // height: screenHeight / 17,
          // width: screenWidth / 2.3,
          height: 49,
          width: 170,
        ),
        actions: const [
          Icon(
              Icons.info,
            // color: Colors.black,
          ),
          SizedBox(width: 15,),
          Icon(Icons.message,
            // color: Colors.black,
          ),
          SizedBox(width: 15,),
          Icon(Icons.notifications,
            // color: Colors.black,
          ),
          SizedBox(width: 8,),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            Gap(15),

            Container(
              height: 150,
              width: double.infinity,
              child: PageView.builder(
                controller: _pageController,
                itemCount: bannerList.length,

                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    width: screenWidth * 0.8,
                    // margin: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                        child: Image.network(
                          bannerList[index],
                          fit: BoxFit.scaleDown,
                        )
                      // Text(
                      //   bannerList[index],
                      //   style: TextStyle(
                      //     fontSize: 20,
                      //     color: Colors.white,
                      //   ),
                      // ),
                    ),
                  );
                },
              ),
            ),

            Container(
              color: Color(0xFFddeaf4),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    SizedBox(height: 20,),

                    Row(
                      children: [
                        Text(
                          "Get a job referral",
                          style: TextStyle(
                              fontSize: 20,
                              color: Color(0xFF073583),
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        Spacer(),
                        InkWell(
                          onTap:(){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Explore()));
                          },
                          child: Text(
                            "Explore",
                            style: TextStyle(
                                color: Colors.indigo,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),

                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 12,
                          color: Colors.indigo,
                        )
                      ],
                    ),
                    Text(
                      "Massage and aks for a job referral",
                      style: TextStyle(
                          color: Color(0xFF073583),
                          fontSize: 14
                      ),
                    ),

                    SizedBox(height: 15,),


                    Container(
                      height: 250,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Container(
                              width: 182,
                              margin: EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal:10.0,vertical: 15),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [

                                    SizedBox(height: 8,),

                                    Center(
                                      child: CircleAvatar(
                                        child: Padding(
                                          padding: const EdgeInsets.all(3.0),
                                          child: Icon(
                                            Icons.person,
                                            size: 35,
                                          ),
                                        ),
                                      ),
                                    ),

                                    SizedBox(height: 10,),

                                    Text(
                                      "Soumya Sundar Mukesh",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          overflow: TextOverflow.ellipsis
                                      ),
                                    ),

                                    Text(
                                      "Software Developer",
                                      style: TextStyle(
                                          fontSize: 14
                                      ),
                                    ),

                                    Text(
                                      "Tata consultancy Service",
                                      style: TextStyle(
                                          fontSize: 14
                                      ),
                                    ),

                                    Text(
                                      "Kolkata",
                                      style: TextStyle(
                                          color: Colors.grey
                                      ),
                                    ),

                                    SizedBox(height: 3,),

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        // SizedBox(width: screenWidth/20),
                                        Icon(Icons.group_outlined),
                                        Text(" 35 connection")
                                      ],
                                    ),

                                    SizedBox(height: 10,),

                                    InkWell(
                                      onTap: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => AskForReferral(),));
                                      },
                                      child: Container(
                                        // color: Colors.green[700],
                                        decoration: BoxDecoration(
                                          color: Colors.green[800],
                                          borderRadius: BorderRadius.circular(6),
                                          border: Border.all(
                                            color: Colors.grey, //color of border
                                            width: 1, //width of border
                                          ),
                                        ),
                                        child: const Center(
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(vertical: 2.0,horizontal:26),
                                            child: Row(
                                              children: [

                                                Icon(
                                                  Icons.message,
                                                  color: Colors.white,
                                                  size: 14,
                                                ),

                                                SizedBox(width: 5,),

                                                Text(
                                                  "Ask for referral",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12
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
                            );

                          },
                      ),
                    ),


                    // SingleChildScrollView(
                    //   scrollDirection: Axis.horizontal,
                    //   child: Row(
                    //     children: [
                    //
                    //       SizedBox(width: 10,),
                    //
                    //       Container(
                    //         width: 182,
                    //         decoration: BoxDecoration(
                    //           color: Colors.white,
                    //           borderRadius: BorderRadius.circular(6),
                    //         ),
                    //         child: Padding(
                    //           padding: const EdgeInsets.symmetric(horizontal:10.0,vertical: 15),
                    //           child: Column(
                    //             mainAxisAlignment: MainAxisAlignment.center,
                    //             crossAxisAlignment: CrossAxisAlignment.center,
                    //             children: [
                    //
                    //               SizedBox(height: 8,),
                    //
                    //               Center(
                    //                 child: CircleAvatar(
                    //                   child: Padding(
                    //                     padding: const EdgeInsets.all(3.0),
                    //                     child: Icon(
                    //                       Icons.person,
                    //                       size: 35,
                    //                     ),
                    //                   ),
                    //                 ),
                    //               ),
                    //
                    //               SizedBox(height: 10,),
                    //
                    //               Text(
                    //                 "Soumya Sundar Mukesh",
                    //                 style: TextStyle(
                    //                     fontWeight: FontWeight.bold,
                    //                     fontSize: 16,
                    //                     overflow: TextOverflow.ellipsis
                    //                 ),
                    //               ),
                    //
                    //               Text(
                    //                 "Software Developer",
                    //                 style: TextStyle(
                    //                     fontSize: 14
                    //                 ),
                    //               ),
                    //
                    //               Text(
                    //                 "Tata consultancy Service",
                    //                 style: TextStyle(
                    //                     fontSize: 14
                    //                 ),
                    //               ),
                    //
                    //               Text(
                    //                 "Kolkata",
                    //                 style: TextStyle(
                    //                     color: Colors.grey
                    //                 ),
                    //               ),
                    //
                    //               SizedBox(height: 3,),
                    //
                    //               Row(
                    //                 children: [
                    //                   SizedBox(width: screenWidth/20),
                    //                   Icon(Icons.group_outlined),
                    //                   Text(" 35 connection")
                    //                 ],
                    //               ),
                    //
                    //               SizedBox(height: 10,),
                    //
                    //               Container(
                    //                 // color: Colors.green[700],
                    //                 decoration: BoxDecoration(
                    //                   color: Colors.green[800],
                    //                   borderRadius: BorderRadius.circular(6),
                    //                   border: Border.all(
                    //                     color: Colors.grey, //color of border
                    //                     width: 1, //width of border
                    //                   ),
                    //                 ),
                    //                 child: const Center(
                    //                   child: Padding(
                    //                     padding: EdgeInsets.symmetric(vertical: 2.0,horizontal:26),
                    //                     child: Row(
                    //                       children: [
                    //
                    //                         Icon(
                    //                           Icons.message,
                    //                           color: Colors.white,
                    //                           size: 14,
                    //                         ),
                    //
                    //                         SizedBox(width: 5,),
                    //
                    //                         Text(
                    //                           "Ask for referral",
                    //                           style: TextStyle(
                    //                               color: Colors.white,
                    //                               fontSize: 12
                    //                           ),
                    //                         ),
                    //                       ],
                    //                     ),
                    //                   ),
                    //                 ),
                    //               ),
                    //
                    //
                    //             ],
                    //           ),
                    //         ),
                    //       ),
                    //
                    //       SizedBox(width: 10,),
                    //
                    //       Container(
                    //         width: 182,
                    //         decoration: BoxDecoration(
                    //           color: Colors.white,
                    //           borderRadius: BorderRadius.circular(6),
                    //         ),
                    //         child: Padding(
                    //           padding: const EdgeInsets.symmetric(horizontal:10.0,vertical: 15),
                    //           child: Column(
                    //             mainAxisAlignment: MainAxisAlignment.center,
                    //             crossAxisAlignment: CrossAxisAlignment.center,
                    //             children: [
                    //
                    //               SizedBox(height: 8,),
                    //
                    //               Center(
                    //                 child: CircleAvatar(
                    //                   child: Padding(
                    //                     padding: const EdgeInsets.all(3.0),
                    //                     child: Icon(
                    //                       Icons.person,
                    //                       size: 35,
                    //                     ),
                    //                   ),
                    //                 ),
                    //               ),
                    //
                    //               SizedBox(height: 10,),
                    //
                    //               Text(
                    //                 "Soumya Sundar Mukesh",
                    //                 style: TextStyle(
                    //                     fontWeight: FontWeight.bold,
                    //                     fontSize: 16,
                    //                     overflow: TextOverflow.ellipsis
                    //                 ),
                    //               ),
                    //
                    //               Text(
                    //                 "Software Developer",
                    //                 style: TextStyle(
                    //                     fontSize: 14
                    //                 ),
                    //               ),
                    //
                    //               Text(
                    //                 "Tata consultancy Service",
                    //                 style: TextStyle(
                    //                     fontSize: 14
                    //                 ),
                    //               ),
                    //
                    //               Text(
                    //                 "Kolkata",
                    //                 style: TextStyle(
                    //                     color: Colors.grey
                    //                 ),
                    //               ),
                    //
                    //               SizedBox(height: 3,),
                    //
                    //               Row(
                    //                 children: [
                    //                   SizedBox(width: screenWidth/20),
                    //                   Icon(Icons.group_outlined),
                    //                   Text(" 35 connection")
                    //                 ],
                    //               ),
                    //
                    //               SizedBox(height: 10,),
                    //
                    //               Container(
                    //                 // color: Colors.green[700],
                    //                 decoration: BoxDecoration(
                    //                   color: Colors.green[800],
                    //                   borderRadius: BorderRadius.circular(6),
                    //                   border: Border.all(
                    //                     color: Colors.grey, //color of border
                    //                     width: 1, //width of border
                    //                   ),
                    //                 ),
                    //                 child: const Center(
                    //                   child: Padding(
                    //                     padding: EdgeInsets.symmetric(vertical: 2.0,horizontal:26),
                    //                     child: Row(
                    //                       children: [
                    //
                    //                         Icon(
                    //                           Icons.message,
                    //                           color: Colors.white,
                    //                           size: 14,
                    //                         ),
                    //
                    //                         SizedBox(width: 5,),
                    //
                    //                         Text(
                    //                           "Ask for referral",
                    //                           style: TextStyle(
                    //                               color: Colors.white,
                    //                               fontSize: 12
                    //                           ),
                    //                         ),
                    //                       ],
                    //                     ),
                    //                   ),
                    //                 ),
                    //               ),
                    //
                    //
                    //             ],
                    //           ),
                    //         ),
                    //       ),
                    //
                    //       SizedBox(width: 10,),
                    //
                    //       Container(
                    //         width: 182,
                    //         decoration: BoxDecoration(
                    //           color: Colors.white,
                    //           borderRadius: BorderRadius.circular(6),
                    //         ),
                    //         child: Padding(
                    //           padding: const EdgeInsets.symmetric(horizontal:10.0,vertical: 15),
                    //           child: Column(
                    //             mainAxisAlignment: MainAxisAlignment.center,
                    //             crossAxisAlignment: CrossAxisAlignment.center,
                    //             children: [
                    //
                    //               SizedBox(height: 8,),
                    //
                    //               Center(
                    //                 child: CircleAvatar(
                    //                   child: Padding(
                    //                     padding: const EdgeInsets.all(3.0),
                    //                     child: Icon(
                    //                       Icons.person,
                    //                       size: 35,
                    //                     ),
                    //                   ),
                    //                 ),
                    //               ),
                    //
                    //               SizedBox(height: 10,),
                    //
                    //               Text(
                    //                 "Soumya Sundar Mukesh",
                    //                 style: TextStyle(
                    //                     fontWeight: FontWeight.bold,
                    //                     fontSize: 16,
                    //                     overflow: TextOverflow.ellipsis
                    //                 ),
                    //               ),
                    //
                    //               Text(
                    //                 "Software Developer",
                    //                 style: TextStyle(
                    //                     fontSize: 14
                    //                 ),
                    //               ),
                    //
                    //               Text(
                    //                 "Tata consultancy Service",
                    //                 style: TextStyle(
                    //                     fontSize: 14
                    //                 ),
                    //               ),
                    //
                    //               Text(
                    //                 "Kolkata",
                    //                 style: TextStyle(
                    //                     color: Colors.grey
                    //                 ),
                    //               ),
                    //
                    //               SizedBox(height: 3,),
                    //
                    //               Row(
                    //                 children: [
                    //                   SizedBox(width: screenWidth/20),
                    //                   Icon(Icons.group_outlined),
                    //                   Text(" 35 connection")
                    //                 ],
                    //               ),
                    //
                    //               SizedBox(height: 10,),
                    //
                    //               Container(
                    //                 // color: Colors.green[700],
                    //                 decoration: BoxDecoration(
                    //                   color: Colors.green[800],
                    //                   borderRadius: BorderRadius.circular(6),
                    //                   border: Border.all(
                    //                     color: Colors.grey, //color of border
                    //                     width: 1, //width of border
                    //                   ),
                    //                 ),
                    //                 child: const Center(
                    //                   child: Padding(
                    //                     padding: EdgeInsets.symmetric(vertical: 2.0,horizontal:26),
                    //                     child: Row(
                    //                       children: [
                    //
                    //                         Icon(
                    //                           Icons.message,
                    //                           color: Colors.white,
                    //                           size: 14,
                    //                         ),
                    //
                    //                         SizedBox(width: 5,),
                    //
                    //                         Text(
                    //                           "Ask for referral",
                    //                           style: TextStyle(
                    //                               color: Colors.white,
                    //                               fontSize: 12
                    //                           ),
                    //                         ),
                    //                       ],
                    //                     ),
                    //                   ),
                    //                 ),
                    //               ),
                    //
                    //
                    //             ],
                    //           ),
                    //         ),
                    //       ),
                    //
                    //       SizedBox(width: 10,),
                    //
                    //       Container(
                    //         width: 182,
                    //         decoration: BoxDecoration(
                    //           color: Colors.white,
                    //           borderRadius: BorderRadius.circular(6),
                    //         ),
                    //         child: Padding(
                    //           padding: const EdgeInsets.symmetric(horizontal:10.0,vertical: 15),
                    //           child: Column(
                    //             mainAxisAlignment: MainAxisAlignment.center,
                    //             crossAxisAlignment: CrossAxisAlignment.center,
                    //             children: [
                    //
                    //               SizedBox(height: 8,),
                    //
                    //               Center(
                    //                 child: CircleAvatar(
                    //                   child: Padding(
                    //                     padding: const EdgeInsets.all(3.0),
                    //                     child: Icon(
                    //                       Icons.person,
                    //                       size: 35,
                    //                     ),
                    //                   ),
                    //                 ),
                    //               ),
                    //
                    //               SizedBox(height: 10,),
                    //
                    //               Text(
                    //                 "Soumya Sundar Mukesh",
                    //                 style: TextStyle(
                    //                     fontWeight: FontWeight.bold,
                    //                     fontSize: 16,
                    //                     overflow: TextOverflow.ellipsis
                    //                 ),
                    //               ),
                    //
                    //               Text(
                    //                 "Software Developer",
                    //                 style: TextStyle(
                    //                     fontSize: 14
                    //                 ),
                    //               ),
                    //
                    //               Text(
                    //                 "Tata consultancy Service",
                    //                 style: TextStyle(
                    //                     fontSize: 14
                    //                 ),
                    //               ),
                    //
                    //               Text(
                    //                 "Kolkata",
                    //                 style: TextStyle(
                    //                     color: Colors.grey
                    //                 ),
                    //               ),
                    //
                    //               SizedBox(height: 3,),
                    //
                    //               Row(
                    //                 children: [
                    //                   SizedBox(width: screenWidth/20),
                    //                   Icon(Icons.group_outlined),
                    //                   Text(" 35 connection")
                    //                 ],
                    //               ),
                    //
                    //               SizedBox(height: 10,),
                    //
                    //               Container(
                    //                 // color: Colors.green[700],
                    //                 decoration: BoxDecoration(
                    //                   color: Colors.green[800],
                    //                   borderRadius: BorderRadius.circular(6),
                    //                   border: Border.all(
                    //                     color: Colors.grey, //color of border
                    //                     width: 1, //width of border
                    //                   ),
                    //                 ),
                    //                 child: const Center(
                    //                   child: Padding(
                    //                     padding: EdgeInsets.symmetric(vertical: 2.0,horizontal:26),
                    //                     child: Row(
                    //                       children: [
                    //
                    //                         Icon(
                    //                           Icons.message,
                    //                           color: Colors.white,
                    //                           size: 14,
                    //                         ),
                    //
                    //                         SizedBox(width: 5,),
                    //
                    //                         Text(
                    //                           "Ask for referral",
                    //                           style: TextStyle(
                    //                               color: Colors.white,
                    //                               fontSize: 12
                    //                           ),
                    //                         ),
                    //                       ],
                    //                     ),
                    //                   ),
                    //                 ),
                    //               ),
                    //
                    //
                    //             ],
                    //           ),
                    //         ),
                    //       ),
                    //
                    //       SizedBox(width: 10,),
                    //
                    //       Container(
                    //         width: 182,
                    //         decoration: BoxDecoration(
                    //           color: Colors.white,
                    //           borderRadius: BorderRadius.circular(6),
                    //         ),
                    //         child: Padding(
                    //           padding: const EdgeInsets.symmetric(horizontal:10.0,vertical: 15),
                    //           child: Column(
                    //             mainAxisAlignment: MainAxisAlignment.center,
                    //             crossAxisAlignment: CrossAxisAlignment.center,
                    //             children: [
                    //
                    //               SizedBox(height: 8,),
                    //
                    //               Center(
                    //                 child: CircleAvatar(
                    //                   child: Padding(
                    //                     padding: const EdgeInsets.all(3.0),
                    //                     child: Icon(
                    //                       Icons.person,
                    //                       size: 35,
                    //                     ),
                    //                   ),
                    //                 ),
                    //               ),
                    //
                    //               SizedBox(height: 10,),
                    //
                    //               Text(
                    //                 "Soumya Sundar Mukesh",
                    //                 style: TextStyle(
                    //                     fontWeight: FontWeight.bold,
                    //                     fontSize: 16,
                    //                     overflow: TextOverflow.ellipsis
                    //                 ),
                    //               ),
                    //
                    //               Text(
                    //                 "Software Developer",
                    //                 style: TextStyle(
                    //                     fontSize: 14
                    //                 ),
                    //               ),
                    //
                    //               Text(
                    //                 "Tata consultancy Service",
                    //                 style: TextStyle(
                    //                     fontSize: 14
                    //                 ),
                    //               ),
                    //
                    //               Text(
                    //                 "Kolkata",
                    //                 style: TextStyle(
                    //                     color: Colors.grey
                    //                 ),
                    //               ),
                    //
                    //               SizedBox(height: 3,),
                    //
                    //               Row(
                    //                 children: [
                    //                   SizedBox(width: screenWidth/20),
                    //                   Icon(Icons.group_outlined),
                    //                   Text(" 35 connection")
                    //                 ],
                    //               ),
                    //
                    //               SizedBox(height: 10,),
                    //
                    //               Container(
                    //                 // color: Colors.green[700],
                    //                 decoration: BoxDecoration(
                    //                   color: Colors.green[800],
                    //                   borderRadius: BorderRadius.circular(6),
                    //                   border: Border.all(
                    //                     color: Colors.grey, //color of border
                    //                     width: 1, //width of border
                    //                   ),
                    //                 ),
                    //                 child: const Center(
                    //                   child: Padding(
                    //                     padding: EdgeInsets.symmetric(vertical: 2.0,horizontal:26),
                    //                     child: Row(
                    //                       children: [
                    //
                    //                         Icon(
                    //                           Icons.message,
                    //                           color: Colors.white,
                    //                           size: 14,
                    //                         ),
                    //
                    //                         SizedBox(width: 5,),
                    //
                    //                         Text(
                    //                           "Ask for referral",
                    //                           style: TextStyle(
                    //                               color: Colors.white,
                    //                               fontSize: 12
                    //                           ),
                    //                         ),
                    //                       ],
                    //                     ),
                    //                   ),
                    //                 ),
                    //               ),
                    //
                    //
                    //             ],
                    //           ),
                    //         ),
                    //       ),
                    //
                    //
                    //
                    //     ],
                    //   ),
                    // ),

                    SizedBox(height: 20,)
                  ],
                ),
              ),
            ),

            SizedBox(height: 25,),

            Padding(
              padding: EdgeInsets.only(top: screenHeight/83, left: screenWidth/19.63, right: screenWidth/19.63),
              child: Container(
                height: 45,
                child: const TextField(

                  style: TextStyle(

                    // color: Colors.grey,
                    fontSize: 19,
                  ),
                  // controller: searchController,
                  // onChanged: (text) {
                  //   filterJobs(text);
                  // },
                  decoration: InputDecoration(
                    filled: true,
                    // fillColor: Colors.lightBlue,
                    hintStyle: TextStyle(
                      fontSize: 18,
                      // color: Colors.white,
                    ),
                    hintText: "Search here", //Job by Role or Company",
                    suffixIcon: Icon(
                      Icons.search,
                      size: 30,
                      // color: Colors.white,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide.none
                    ),
                    contentPadding: EdgeInsets.all(13),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 15,),

            Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Row(
                children: [
                  Text("Jobs near",
                    style:TextStyle(
                        color: Colors.grey
                    ),
                  ),
                  Text(" MP Nagar, Bhopal",
                    style:TextStyle(
                        color: Colors.green
                    ),
                  )
                ],
              ),
            ),

            SizedBox(height: 15,),

            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.grey, //color of border
                          width: 1, //width of border
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Row(
                          children: [
                            SizedBox(width: 2,),

                            Text(
                              " Department",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16
                              ),
                            ),

                            Icon(
                              Icons.keyboard_arrow_down,
                              size: 19,
                              color: Colors.grey,
                            ),
                            SizedBox(width: 2,)
                          ],
                        ),
                      ),
                    ),

                    SizedBox(width: 10,),

                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.grey, //color of border
                          width: 1, //width of border
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Row(
                          children: [
                            SizedBox(width: 2,),

                            Text(
                              " Salary",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16
                              ),
                            ),

                            Icon(
                              Icons.keyboard_arrow_down,
                              size: 19,
                              color: Colors.grey,
                            ),
                            SizedBox(width: 2,)
                          ],
                        ),
                      ),
                    ),

                    SizedBox(width: 10,),

                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.grey, //color of border
                          width: 1, //width of border
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Row(
                          children: [
                            SizedBox(width: 2,),

                            Text(
                              " Distance",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16
                              ),
                            ),

                            Icon(
                              Icons.keyboard_arrow_down,
                              size: 19,
                              color: Colors.grey,
                            ),
                            SizedBox(width: 2,)
                          ],
                        ),
                      ),
                    ),

                    SizedBox(width: 10,),

                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.grey, //color of border
                          width: 1, //width of border
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Row(
                          children: [
                            SizedBox(width: 2,),

                            Text(
                              " Work Type",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16
                              ),
                            ),

                            Icon(
                              Icons.keyboard_arrow_down,
                              size: 19,
                              color: Colors.grey,
                            ),
                            SizedBox(width: 2,)
                          ],
                        ),
                      ),
                    ),

                    SizedBox(width: 10,),

                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.grey, //color of border
                          width: 2, //width of border
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Row(
                          children: [
                            SizedBox(width: 2,),

                            Text(
                              " Work Mode",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16
                              ),
                            ),

                            Icon(
                              Icons.keyboard_arrow_down,
                              size: 19,
                              color: Colors.grey,
                            ),
                            SizedBox(width: 2,)
                          ],
                        ),
                      ),
                    ),


                  ],
                ),
              ),
            ),


            ListView.builder(
              shrinkWrap: true,
              itemCount: 10,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding:  EdgeInsets.symmetric(vertical: 4.0, horizontal: 10),
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>  const ApplyScreen()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.grey, //color of border
                          width: 1, //width of border
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          children: [

                            SizedBox(height: 6,),

                            Row(
                              children: [
                                Icon(
                                  Icons.location_city,
                                  color: Colors.grey,
                                  size: 25,
                                ),
                                SizedBox(width: 5,),
                                Text(
                                  "Flutter Developer",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17
                                  ),
                                )
                              ],
                            ),

                            SizedBox(height: 8,),

                            Row(
                              children: [
                                Icon(
                                  Icons.location_on_outlined,
                                  size: 20,
                                  color: Colors.grey,
                                ),
                                Text(
                                  " MP Nagar (Work from Office)",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 15
                                  ),
                                )
                              ],
                            ),

                            SizedBox(height: 5,),

                            Row(
                              children: [
                                Icon(
                                  Icons.currency_rupee_rounded,
                                  size: 20,
                                  color: Colors.grey,
                                ),
                                Text(
                                  " ₹10,000 - ₹25,000",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 15
                                  ),
                                )
                              ],
                            ),

                            SizedBox(height: 5,),

                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  Card(
                                    color: Colors.white,
                                    child: Padding(
                                      padding: EdgeInsets.all(3.0),
                                      child: Row(
                                        children: [
                                          SizedBox(width: 2,),
                                          Icon(
                                            Icons.facebook,
                                            size: 19,
                                            color: Colors.grey,
                                          ),

                                          Text(
                                            " Full time",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 16
                                            ),
                                          ),

                                          SizedBox(width: 2,)
                                        ],
                                      ),
                                    ),
                                  ),

                                  Card(
                                    color: Colors.white,
                                    child: Row(
                                      children: [
                                        SizedBox(width: 2,),
                                        Icon(
                                          Icons.local_post_office_outlined,
                                          size: 19,
                                          color: Colors.grey,
                                        ),

                                        Text(
                                          " Any experience",
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 16,
                                          ),
                                        ),

                                        SizedBox(width: 2,)
                                      ],
                                    ),
                                  ),

                                  Card(
                                    color: Colors.white,
                                    child: Row(
                                      children: [
                                        SizedBox(width: 2,),
                                        Icon(
                                          Icons.message,
                                          size: 19,
                                          color: Colors.grey,
                                        ),

                                        Text(
                                          " Basic English",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 16
                                          ),
                                        ),

                                        SizedBox(width: 2,)
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(height: 5,),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),

            // Padding(
            //   padding:  EdgeInsets.all(12.0),
            //   child: InkWell(
            //     onTap: (){
            //       Navigator.push(context,MaterialPageRoute(builder: (context)=>  const ApplyScreen()));
            //     },
            //     child: Container(
            //        decoration: BoxDecoration(
            //          borderRadius: BorderRadius.circular(10),
            //          border: Border.all(
            //            color: Colors.grey, //color of border
            //            width: 1, //width of border
            //          ),
            //        ),
            //       child: Padding(
            //         padding: EdgeInsets.all(10.0),
            //         child: Column(
            //           children: [
            //
            //             SizedBox(height: 6,),
            //
            //             Row(
            //               children: [
            //                 Icon(
            //                   Icons.location_city,
            //                   color: Colors.grey,
            //                   size: 25,
            //                 ),
            //                 SizedBox(width: 5,),
            //                 Text(
            //                     "Flutter Developer",
            //                   style: TextStyle(
            //                     fontWeight: FontWeight.bold,
            //                     fontSize: 17
            //                   ),
            //                 )
            //               ],
            //             ),
            //
            //             SizedBox(height: 8,),
            //
            //             Row(
            //               children: [
            //                 Icon(
            //                     Icons.location_on_outlined,
            //                   size: 20,
            //                   color: Colors.grey,
            //                 ),
            //                 Text(
            //                   " MP Nagar (Work from Office)",
            //                   style: TextStyle(
            //                     color: Colors.grey,
            //                     fontSize: 15
            //                   ),
            //                 )
            //               ],
            //             ),
            //
            //             SizedBox(height: 5,),
            //
            //             Row(
            //               children: [
            //                 Icon(
            //                   Icons.currency_rupee_rounded,
            //                   size: 20,
            //                   color: Colors.grey,
            //                 ),
            //                 Text(
            //                   " ₹10,000 - ₹25,000",
            //                   style: TextStyle(
            //                       color: Colors.grey,
            //                       fontSize: 15
            //                   ),
            //                 )
            //               ],
            //             ),
            //
            //             SizedBox(height: 5,),
            //
            //             SingleChildScrollView(
            //               scrollDirection: Axis.horizontal,
            //               child: Row(
            //                 children: [
            //                   Card(
            //                     color: Colors.white,
            //                     child: Padding(
            //                       padding: EdgeInsets.all(3.0),
            //                       child: Row(
            //                         children: [
            //                           SizedBox(width: 2,),
            //                           Icon(
            //                             Icons.facebook,
            //                           size: 19,
            //                           color: Colors.grey,
            //                           ),
            //
            //                           Text(
            //                             " Full time",
            //                             style: TextStyle(
            //                               color: Colors.grey,
            //                               fontSize: 16
            //                             ),
            //                           ),
            //
            //                           SizedBox(width: 2,)
            //                         ],
            //                       ),
            //                     ),
            //                   ),
            //
            //                   Card(
            //                     color: Colors.white,
            //                     child: Row(
            //                       children: [
            //                         SizedBox(width: 2,),
            //                         Icon(
            //                           Icons.local_post_office_outlined,
            //                           size: 19,
            //                           color: Colors.grey,
            //                         ),
            //
            //                         Text(
            //                           " Any experience",
            //                           style: TextStyle(
            //                               color: Colors.grey,
            //                               fontSize: 16,
            //                           ),
            //                         ),
            //
            //                         SizedBox(width: 2,)
            //                       ],
            //                     ),
            //                   ),
            //
            //                   Card(
            //                     color: Colors.white,
            //                     child: Row(
            //                       children: [
            //                         SizedBox(width: 2,),
            //                         Icon(
            //                           Icons.message,
            //                           size: 19,
            //                           color: Colors.grey,
            //                         ),
            //
            //                         Text(
            //                           " Basic English",
            //                           style: TextStyle(
            //                               color: Colors.grey,
            //                             fontSize: 16
            //                           ),
            //                         ),
            //
            //                         SizedBox(width: 2,)
            //                       ],
            //                     ),
            //                   ),
            //                 ],
            //               ),
            //             ),
            //
            //             SizedBox(height: 5,),
            //           ],
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            //
            // Padding(
            //   padding:  EdgeInsets.only(left: 12.0, right: 12, bottom: 12),
            //   child: InkWell(
            //     onTap: (){
            //       Navigator.push(context,MaterialPageRoute(builder: (context)=>  const ApplyScreen()));
            //     },
            //     child: Container(
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(10),
            //         border: Border.all(
            //           color: Colors.grey, //color of border
            //           width: 1, //width of border
            //         ),
            //       ),
            //       child: Padding(
            //         padding: EdgeInsets.all(10.0),
            //         child: Column(
            //           children: [
            //
            //             SizedBox(height: 6,),
            //
            //             Row(
            //               children: [
            //                 Icon(
            //                   Icons.location_city,
            //                   color: Colors.grey,
            //                   size: 25,
            //                 ),
            //                 SizedBox(width: 5,),
            //                 Text(
            //                   "Flutter Developer",
            //                   style: TextStyle(
            //                       fontWeight: FontWeight.bold,
            //                       fontSize: 17
            //                   ),
            //                 )
            //               ],
            //             ),
            //
            //             SizedBox(height: 8,),
            //
            //             Row(
            //               children: [
            //                 Icon(
            //                   Icons.location_on_outlined,
            //                   size: 20,
            //                   color: Colors.grey,
            //                 ),
            //                 Text(
            //                   " MP Nagar (Work from Office)",
            //                   style: TextStyle(
            //                       color: Colors.grey,
            //                       fontSize: 15
            //                   ),
            //                 )
            //               ],
            //             ),
            //
            //             SizedBox(height: 5,),
            //
            //             Row(
            //               children: [
            //                 Icon(
            //                   Icons.currency_rupee_rounded,
            //                   size: 20,
            //                   color: Colors.grey,
            //                 ),
            //                 Text(
            //                   " ₹10,000 - ₹25,000",
            //                   style: TextStyle(
            //                       color: Colors.grey,
            //                       fontSize: 15
            //                   ),
            //                 )
            //               ],
            //             ),
            //
            //             SizedBox(height: 5,),
            //
            //             SingleChildScrollView(
            //               scrollDirection: Axis.horizontal,
            //               child: Row(
            //                 children: [
            //                   Card(
            //                     color: Colors.white,
            //                     child: Padding(
            //                       padding: EdgeInsets.all(3.0),
            //                       child: Row(
            //                         children: [
            //                           SizedBox(width: 2,),
            //                           Icon(
            //                             Icons.facebook,
            //                             size: 19,
            //                             color: Colors.grey,
            //                           ),
            //
            //                           Text(
            //                             " Full time",
            //                             style: TextStyle(
            //                                 color: Colors.grey,
            //                                 fontSize: 16
            //                             ),
            //                           ),
            //
            //                           SizedBox(width: 2,)
            //                         ],
            //                       ),
            //                     ),
            //                   ),
            //
            //                   Card(
            //                     color: Colors.white,
            //                     child: Row(
            //                       children: [
            //                         SizedBox(width: 2,),
            //                         Icon(
            //                           Icons.local_post_office_outlined,
            //                           size: 19,
            //                           color: Colors.grey,
            //                         ),
            //
            //                         Text(
            //                           " Any experience",
            //                           style: TextStyle(
            //                             color: Colors.grey,
            //                             fontSize: 16,
            //                           ),
            //                         ),
            //
            //                         SizedBox(width: 2,)
            //                       ],
            //                     ),
            //                   ),
            //
            //                   Card(
            //                     color: Colors.white,
            //                     child: Row(
            //                       children: [
            //                         SizedBox(width: 2,),
            //                         Icon(
            //                           Icons.message,
            //                           size: 19,
            //                           color: Colors.grey,
            //                         ),
            //
            //                         Text(
            //                           " Basic English",
            //                           style: TextStyle(
            //                               color: Colors.grey,
            //                               fontSize: 16
            //                           ),
            //                         ),
            //
            //                         SizedBox(width: 2,)
            //                       ],
            //                     ),
            //                   ),
            //                 ],
            //               ),
            //             ),
            //
            //             SizedBox(height: 5,),
            //           ],
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            //
            // Padding(
            //   padding:  EdgeInsets.only(left: 12.0, right: 12, bottom: 12),
            //   child: InkWell(
            //     onTap: (){
            //       Navigator.push(context,MaterialPageRoute(builder: (context)=>  const ApplyScreen()));
            //     },
            //     child: Container(
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(10),
            //         border: Border.all(
            //           color: Colors.grey, //color of border
            //           width: 1, //width of border
            //         ),
            //       ),
            //       child: Padding(
            //         padding: EdgeInsets.all(10.0),
            //         child: Column(
            //           children: [
            //
            //             SizedBox(height: 6,),
            //
            //             Row(
            //               children: [
            //                 Icon(
            //                   Icons.location_city,
            //                   color: Colors.grey,
            //                   size: 25,
            //                 ),
            //                 SizedBox(width: 5,),
            //                 Text(
            //                   "Flutter Developer",
            //                   style: TextStyle(
            //                       fontWeight: FontWeight.bold,
            //                       fontSize: 17
            //                   ),
            //                 )
            //               ],
            //             ),
            //
            //             SizedBox(height: 8,),
            //
            //             Row(
            //               children: [
            //                 Icon(
            //                   Icons.location_on_outlined,
            //                   size: 20,
            //                   color: Colors.grey,
            //                 ),
            //                 Text(
            //                   " MP Nagar (Work from Office)",
            //                   style: TextStyle(
            //                       color: Colors.grey,
            //                       fontSize: 15
            //                   ),
            //                 )
            //               ],
            //             ),
            //
            //             SizedBox(height: 5,),
            //
            //             Row(
            //               children: [
            //                 Icon(
            //                   Icons.currency_rupee_rounded,
            //                   size: 20,
            //                   color: Colors.grey,
            //                 ),
            //                 Text(
            //                   " ₹10,000 - ₹25,000",
            //                   style: TextStyle(
            //                       color: Colors.grey,
            //                       fontSize: 15
            //                   ),
            //                 )
            //               ],
            //             ),
            //
            //             SizedBox(height: 5,),
            //
            //             SingleChildScrollView(
            //               scrollDirection: Axis.horizontal,
            //               child: Row(
            //                 children: [
            //                   Card(
            //                     color: Colors.white,
            //                     child: Padding(
            //                       padding: EdgeInsets.all(3.0),
            //                       child: Row(
            //                         children: [
            //                           SizedBox(width: 2,),
            //                           Icon(
            //                             Icons.facebook,
            //                             size: 19,
            //                             color: Colors.grey,
            //                           ),
            //
            //                           Text(
            //                             " Full time",
            //                             style: TextStyle(
            //                                 color: Colors.grey,
            //                                 fontSize: 16
            //                             ),
            //                           ),
            //
            //                           SizedBox(width: 2,)
            //                         ],
            //                       ),
            //                     ),
            //                   ),
            //
            //                   Card(
            //                     color: Colors.white,
            //                     child: Row(
            //                       children: [
            //                         SizedBox(width: 2,),
            //                         Icon(
            //                           Icons.local_post_office_outlined,
            //                           size: 19,
            //                           color: Colors.grey,
            //                         ),
            //
            //                         Text(
            //                           " Any experience",
            //                           style: TextStyle(
            //                             color: Colors.grey,
            //                             fontSize: 16,
            //                           ),
            //                         ),
            //
            //                         SizedBox(width: 2,)
            //                       ],
            //                     ),
            //                   ),
            //
            //                   Card(
            //                     color: Colors.white,
            //                     child: Row(
            //                       children: [
            //                         SizedBox(width: 2,),
            //                         Icon(
            //                           Icons.message,
            //                           size: 19,
            //                           color: Colors.grey,
            //                         ),
            //
            //                         Text(
            //                           " Basic English",
            //                           style: TextStyle(
            //                               color: Colors.grey,
            //                               fontSize: 16
            //                           ),
            //                         ),
            //
            //                         SizedBox(width: 2,)
            //                       ],
            //                     ),
            //                   ),
            //                 ],
            //               ),
            //             ),
            //
            //             SizedBox(height: 5,),
            //           ],
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            //
            // Padding(
            //   padding:  EdgeInsets.only(left: 12.0, right: 12, bottom: 12),
            //   child: InkWell(
            //     onTap: (){
            //       Navigator.push(context,MaterialPageRoute(builder: (context)=>  const ApplyScreen()));
            //     },
            //     child: Container(
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(10),
            //         border: Border.all(
            //           color: Colors.grey, //color of border
            //           width: 1, //width of border
            //         ),
            //       ),
            //       child: Padding(
            //         padding: EdgeInsets.all(10.0),
            //         child: Column(
            //           children: [
            //
            //             SizedBox(height: 6,),
            //
            //             Row(
            //               children: [
            //                 Icon(
            //                   Icons.location_city,
            //                   color: Colors.grey,
            //                   size: 25,
            //                 ),
            //                 SizedBox(width: 5,),
            //                 Text(
            //                   "Flutter Developer",
            //                   style: TextStyle(
            //                       fontWeight: FontWeight.bold,
            //                       fontSize: 17
            //                   ),
            //                 )
            //               ],
            //             ),
            //
            //             SizedBox(height: 8,),
            //
            //             Row(
            //               children: [
            //                 Icon(
            //                   Icons.location_on_outlined,
            //                   size: 20,
            //                   color: Colors.grey,
            //                 ),
            //                 Text(
            //                   " MP Nagar (Work from Office)",
            //                   style: TextStyle(
            //                       color: Colors.grey,
            //                       fontSize: 15
            //                   ),
            //                 )
            //               ],
            //             ),
            //
            //             SizedBox(height: 5,),
            //
            //             Row(
            //               children: [
            //                 Icon(
            //                   Icons.currency_rupee_rounded,
            //                   size: 20,
            //                   color: Colors.grey,
            //                 ),
            //                 Text(
            //                   " ₹10,000 - ₹25,000",
            //                   style: TextStyle(
            //                       color: Colors.grey,
            //                       fontSize: 15
            //                   ),
            //                 )
            //               ],
            //             ),
            //
            //             SizedBox(height: 5,),
            //
            //             SingleChildScrollView(
            //               scrollDirection: Axis.horizontal,
            //               child: Row(
            //                 children: [
            //                   Card(
            //                     color: Colors.white,
            //                     child: Padding(
            //                       padding: EdgeInsets.all(3.0),
            //                       child: Row(
            //                         children: [
            //                           SizedBox(width: 2,),
            //                           Icon(
            //                             Icons.facebook,
            //                             size: 19,
            //                             color: Colors.grey,
            //                           ),
            //
            //                           Text(
            //                             " Full time",
            //                             style: TextStyle(
            //                                 color: Colors.grey,
            //                                 fontSize: 16
            //                             ),
            //                           ),
            //
            //                           SizedBox(width: 2,)
            //                         ],
            //                       ),
            //                     ),
            //                   ),
            //
            //                   Card(
            //                     color: Colors.white,
            //                     child: Row(
            //                       children: [
            //                         SizedBox(width: 2,),
            //                         Icon(
            //                           Icons.local_post_office_outlined,
            //                           size: 19,
            //                           color: Colors.grey,
            //                         ),
            //
            //                         Text(
            //                           " Any experience",
            //                           style: TextStyle(
            //                             color: Colors.grey,
            //                             fontSize: 16,
            //                           ),
            //                         ),
            //
            //                         SizedBox(width: 2,)
            //                       ],
            //                     ),
            //                   ),
            //
            //                   Card(
            //                     color: Colors.white,
            //                     child: Row(
            //                       children: [
            //                         SizedBox(width: 2,),
            //                         Icon(
            //                           Icons.message,
            //                           size: 19,
            //                           color: Colors.grey,
            //                         ),
            //
            //                         Text(
            //                           " Basic English",
            //                           style: TextStyle(
            //                               color: Colors.grey,
            //                               fontSize: 16
            //                           ),
            //                         ),
            //
            //                         SizedBox(width: 2,)
            //                       ],
            //                     ),
            //                   ),
            //                 ],
            //               ),
            //             ),
            //
            //             SizedBox(height: 5,),
            //           ],
            //         ),
            //       ),
            //     ),
            //   ),
            // ),

            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
