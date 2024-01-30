import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:job_internship/add_experience.dart';
import 'package:job_internship/basic_details.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Image.asset(
          "assets/logo.png",
          // height: screenHeight / 17,
          // width: screenWidth / 2.3,
          height: 49,
          width: 170,
        ),

        actions: const [

          SizedBox(width: 15,),

          Icon(Icons.settings),

          SizedBox(width: 15,),

          Icon(Icons.forward_to_inbox),

          SizedBox(width: 15,),

          Icon(Icons.notifications),

          SizedBox(width: 15,),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SizedBox(height: 20,),

            Padding(
              padding: const EdgeInsets.only(left: 4.0,top: 12,bottom: 12,right: 4),
              child: Card(
                color: Colors.white,
                child:Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius: 50,
                        foregroundImage: NetworkImage(
                          "https://img.freepik.com/premium-photo/young-businessman-isolated-white_53419-207.jpg",
                        ),
                      ),
                    ),

                    SizedBox(width: 5,),

                    Column(

                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,

                      children: [
                        Text(
                          "ATUL",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17
                          ),
                        ),

                        SizedBox(height: 10,),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.local_post_office_outlined,
                              size:14,
                              color: Colors.grey[600],
                            ),

                            SizedBox(width:7,),

                            Container(
                              width: screenWidth/2,
                              child: Text(
                                "SAM College of Engineering and Technology, Bhopal",
                                style: TextStyle(
                                    fontSize: 12
                                ),
                              ),
                            ),

                          ],
                        ),

                        SizedBox(height: 6,),

                        Row(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          // mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.location_on,
                              size:14,
                              color: Colors.grey[600],
                            ),

                            SizedBox(width:7,),

                            Container(
                              width: 200,
                              child: Text(
                                "Mp Nagar, Bhopal",
                                style: TextStyle(
                                    fontSize: 12
                                ),
                              ),
                            ),

                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(width: 20,),
                  Container(
                    height: 50,
                    width: 110,
                    decoration: BoxDecoration(
                      color:Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Color(0xFFebebeb), //color of border
                        width: 1, //width of border
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left:8.0,right: 8,bottom: 5),
                      child: Column(
                        children: [
                          SizedBox(height: 4,),
                          const Text(
                            "0",
                            style: TextStyle(
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Text("Connection",
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[600],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),

                  SizedBox(width: 10,),

                  Container(
                    height: 50,
                    width: 110,
                    decoration: BoxDecoration(
                      color:Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Color(0xFFebebeb), //color of border
                        width: 1, //width of border
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left:8.0,right: 8,bottom: 5),
                      child: Column(
                        children: [

                          SizedBox(height: 4,),

                          Text(
                            "0",
                            style: TextStyle(
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Text("Profile Views",
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[600]
                            ),
                          )
                        ],
                      ),
                    ),
                  ),

                  SizedBox(width: 10,),

                  Container(
                    height: 50,
                    width: 110,
                    decoration: BoxDecoration(
                      color:Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Color(0xFFebebeb), //color of border
                        width: 1, //width of border
                      ),
                    ),
                    child: Column(
                      children: [

                        SizedBox(height: 4,),

                        Text(
                          "4",
                          style: TextStyle(
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        Text("Clap",
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600]
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),

            SizedBox(height: 20,),

            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text("About Me"),
            ),

            Divider(),

            Padding(
              padding: const EdgeInsets.only(left: 18.0,right: 12,top: 12,bottom: 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Resume",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14
                    ),
                  ),

                  Gap(2),

                  Text(
                    "Only visible to HRs",
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 11
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 12.0,right: 12,top: 6,bottom: 6),
              child: Container(
                decoration: BoxDecoration(
                  color:Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Color(0xFFebebeb), //color of border
                    width: 1, //width of border
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Upload Resume",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold
                            ),
                          ),

                          Spacer(),

                          Icon(Icons.upload,
                            size: 18,
                            color: Colors.green,
                          ),

                          Text(" Upload Resume",
                            style: TextStyle(
                              // color: Colors.green,
                                fontSize: 14
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 12.0,right: 12,top: 6,bottom: 6),
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const BasicDetails()));
                },
                child: Container(
                  decoration: BoxDecoration(
                    color:Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Color(0xFFebebeb), //color of border
                      width: 1, //width of border
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Basic details",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold
                              ),
                            ),

                            Spacer(),

                            Icon(Icons.arrow_forward_ios,
                              size: 10,
                              color: Colors.green,
                            ),

                            // Text(" Edit",
                            //   style: TextStyle(
                            //     // color: Colors.green,
                            //       fontSize: 13
                            //   ),
                            // )
                          ],
                        ),

                        Gap(3),

                        Row(
                          children: [
                            // Icon(
                            //   Icons.start,
                            //   color: Colors.grey[600],
                            //   size: 17,),

                            Text(
                              "Atul, Male, 18 Apr 2003, +919770764581",
                              style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.grey[600]
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),


            Gap(30),

          ],
        ),
      ),
    );
  }
}
