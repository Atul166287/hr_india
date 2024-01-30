import 'package:flutter/material.dart';

import 'ask_for_referral.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text(
          "Explore Job",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      body:  Container(
          padding: EdgeInsets.all(8.0),
          child: GridView.builder(
            itemCount: 10,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 240,
              // childAspectRatio:0.65,
              mainAxisSpacing: 10,
              crossAxisSpacing: 5
            ),
            itemBuilder: (BuildContext context, int index){
              return Container(
                width: 182,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left:10.0,right:10.0,top: 15),
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
                            fontSize: 14,
                            overflow: TextOverflow.ellipsis

                        ),
                      ),

                      Text(
                        "Tata consultancy Service",
                        style: TextStyle(
                            fontSize: 14,
                            overflow: TextOverflow.ellipsis
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
                          Icon(Icons.group_outlined),
                          Text(" 35 connection")
                        ],
                      ),

                      SizedBox(height: 10,),

                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>AskForReferral()));
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
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 2.0),
                            // padding: EdgeInsets.only(top: 2.0,bottom:2.0,left:screenWidth/15),
                            child:
                            // Row(
                            //   children: [

                                // Icon(
                                //   Icons.message,
                                //   color: Colors.white,
                                //   size: 14,
                                // ),
                                //
                                // SizedBox(width: 5,),

                                Center(
                                  child: Text(
                                    "Ask for referral",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12
                                    ),
                                  ),
                                ),
                            //   ],
                            // ),
                          ),
                        ),
                      ),


                    ],
                  ),
                ),
              );
            },
          )
      ),
    );
  }
}
