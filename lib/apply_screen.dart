import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:job_internship/form_screen.dart';

class ApplyScreen extends StatefulWidget {
  const ApplyScreen({super.key});

  @override
  State<ApplyScreen> createState() => _ApplyScreenState();
}

class _ApplyScreenState extends State<ApplyScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            size: 19,
          ),
        ),
        actions: const [
          SizedBox(width: 15,),
          // Container(
          //   color: Colors.green,
          //   child:
            Row(
              children: [
                Icon(
                    FontAwesomeIcons.whatsapp,
                  size: 20,
                  color: Colors.green,
                ),
                
                // Text(" Share")
              ],
            ),
          // ),
          SizedBox(width: 10,),
          Icon(Icons.more_vert),
          SizedBox(width: 8,)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            Row(
              children: [
                SizedBox(width: 20,),
                Icon(
                  Icons.apartment_sharp,
                  color: Colors.grey[600],
                  size: 35,
                ),
                SizedBox(width: 5,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Flutter Developer",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                      ),
                    ),
                    Text(
                      "Eulogik",
                      style: TextStyle(
                        color: Colors.grey
                      ),
                    )
                  ],
                )
              ],
            ),

            SizedBox(height: 15,),

            Row(
              children: [
                SizedBox(width: 20,),
                Icon(
                  Icons.location_on_outlined,
                  size: 20,
                  color: Colors.grey[600],
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

            SizedBox(height: 8,),

              Row(
              children: [

                SizedBox(width: 20,),

                Icon(
                  Icons.currency_rupee_rounded,
                  size: 20,
                  color: Colors.grey[600],
                ),
                Text(
                  " ₹10,000 - ₹25,000 monthly",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15
                  ),
                )
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                // color: Colors.brown[50],
                decoration: BoxDecoration(
                  color: Color(0xFFebebeb),
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
                            "Fixed",
                            style: TextStyle(
                              color: Colors.grey[600]
                            ),
                          ),
                          Spacer(),
                          Text(
                            "₹10,000 - ₹25,000",
                            style: TextStyle(
                                color: Colors.grey[600]
                            ),
                          ),
                        ],
                      ),

                      Divider(),

                      Row(
                        children: [
                          Text(
                            "Earning Potential",
                            style: TextStyle(
                                color: Colors.grey[600]
                            ),
                          ),
                          Spacer(),
                          Text(
                            "₹25,000",
                            style: TextStyle(
                                color: Colors.grey[600]
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20.0,),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 90,
                    // color: Colors.brown[50],
                    decoration: BoxDecoration(
                      color: Color(0xFFebebeb),
                      borderRadius: BorderRadius.circular(7),
                      border: Border.all(
                        color: Color(0xFFebebeb), //color of border
                        width: 1, //width of border
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.facebook,
                          color: Colors.grey[600],
                            size: 15,
                          ),
                          SizedBox(width: 3,),

                          Text(
                            "Full-time",
                            style: TextStyle(
                              color: Colors.grey[600]
                            ),
                          )
                        ],
                      )
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height:7,),

            Container(
              color: Colors.grey[300],
              height:7,
            ),

            Container(

              width:  MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  SizedBox(height: 10,),

                  const Row(
                    children: [
                      SizedBox(width: 20,),
                      Text(
                        "Job details",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15
                        ),
                      ),
                    ],
                  ),

                  Divider(),
                  // SizedBox(height: 10,),

                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(

                      decoration: BoxDecoration(
                        color: Color(0xFF83CEF1FF),
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Color(0xFF29BEFFFF),
                          width: 2, //width of border
                        ),
                      ),

                      child: const Column(
                        children: [
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              SizedBox(width: 12,),
                              Text(
                                "Job highlights",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15
                                ),
                              )
                            ],
                          ),

                          SizedBox(height: 10,),

                          Row(
                            children: [
                              SizedBox(width: 12,),
                              Icon(
                                Icons.energy_savings_leaf_outlined,
                                size: 18,
                                color: Colors.purple,
                              ),

                              SizedBox(width: 5,),

                              Text("Fast HR reply")
                            ],
                          ),

                          Row(
                            children: [

                              SizedBox(width: 35,),

                              Text(
                                "HR responded to 88% candidates in last 7 days",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 13
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 10,),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),

            Container(
              color: Colors.grey[300],
              height:7,
            ),

            Container(

              width:  MediaQuery.of(context).size.width,
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  SizedBox(height: 10,),

                  const Row(
                    children: [
                      SizedBox(width: 20,),
                      Text(
                        "Job Description",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15
                        ),
                      ),
                    ],
                  ),

                   // SizedBox(height: 10,),

                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child:Text(
                      " Develop and maintain Flutter application , ensuring high performance and responsive ",
                      style: TextStyle(
                        color: Colors.grey[600]
                      ),
                    )
                  )
                ],
              ),
            ),

            Container(
              color: Colors.grey[300],
              height:7,
            ),

            Container(

              width:  MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  SizedBox(height: 10,),

                  const Row(
                    children: [
                      SizedBox(width: 20,),
                      Text(
                        "Job Role",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15
                        ),
                      ),
                    ],
                  ),

                  // SizedBox(height: 10,),

                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child:Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.text_snippet,
                            size:18,
                            color: Colors.grey[600],
                            ),

                            SizedBox(width: 10,),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Department",
                                style: TextStyle(
                                  color: Colors.grey[600]
                                ),
                                ),
                                Text("Software Engineering")
                              ],
                            )
                          ],
                        ),

                        SizedBox(height: 10,),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.schema_rounded,
                              size:18,
                              color: Colors.grey[600],
                            ),

                            SizedBox(width: 10,),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Role / Category",
                                  style: TextStyle(
                                      color: Colors.grey[600]
                                  ),
                                ),
                                Text("Software Development")
                              ],
                            )
                          ],
                        ),

                        SizedBox(height: 10,),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.access_time_filled,
                              size:18,
                              color: Colors.grey[600],
                            ),

                            SizedBox(width: 10,),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Employee type",
                                  style: TextStyle(
                                      color: Colors.grey[600]
                                  ),
                                ),
                                Text("Full Time")
                              ],
                            )
                          ],
                        )
                      ],
                    )
                  )
                ],
              ),
            ),

            Container(
              color: Colors.grey[300],
              height:7,
            ),

            Container(

              width:  MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  SizedBox(height: 10,),

                  const Row(
                    children: [
                      SizedBox(width: 20,),
                      Text(
                        "Job requirement",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15
                        ),
                      ),
                    ],
                  ),

                  // SizedBox(height: 10,),

                  Padding(
                      padding: const EdgeInsets.all(10.0),
                      child:Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.local_post_office,
                                size:18,
                                color: Colors.grey[600],
                              ),

                              SizedBox(width: 10,),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Experience",
                                    style: TextStyle(
                                        color: Colors.grey[600]
                                    ),
                                  ),
                                  const Text("Freshers")
                                ],
                              )
                            ],
                          ),

                          SizedBox(height: 10,),

                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.library_books_outlined,
                                size:18,
                                color: Colors.grey[600],
                              ),

                              SizedBox(width: 10,),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Education",
                                    style: TextStyle(
                                        color: Colors.grey[600]
                                    ),
                                  ),
                                  Text("Diploma")
                                ],
                              )
                            ],
                          ),

                          SizedBox(height: 10,),

                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.access_time_filled,
                                size:18,
                                color: Colors.grey[600],
                              ),

                              SizedBox(width: 10,),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Skills",
                                    style: TextStyle(
                                        color: Colors.grey[600]
                                    ),
                                  ),
                                  const Text("Flutter, RestAPI, Android Studio")
                                ],
                              ),

                            ],
                          ),

                          SizedBox(height: 10,),

                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.messenger,
                                size:18,
                                color: Colors.grey[600],
                              ),

                              SizedBox(width: 10,),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("English level",
                                    style: TextStyle(
                                        color: Colors.grey[600]
                                    ),
                                  ),
                                  const Text("Basic English")
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                  )
                ],
              ),
            ),

            Container(
              color: Colors.grey[300],
              height:7,
            ),

            Container(

              width:  MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  SizedBox(height: 10,),

                  const Row(
                    children: [
                      SizedBox(width: 20,),
                      Text(
                        "Interview & address details",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15
                        ),
                      ),
                    ],
                  ),

                  // SizedBox(height: 10,),

                  Padding(
                      padding: const EdgeInsets.all(10.0),
                      child:Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.question_answer_rounded,
                                size:18,
                                color: Colors.grey[600],
                              ),

                              SizedBox(width: 10,),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Interview mode",
                                    style: TextStyle(
                                        color: Colors.grey[600]
                                    ),
                                  ),
                                  const Text("In Person")
                                ],
                              )
                            ],
                          ),

                          SizedBox(height: 10,),

                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.location_on,
                                size:18,
                                color: Colors.grey[600],
                              ),

                              SizedBox(width: 10,),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Interview address",
                                    style: TextStyle(
                                        color: Colors.grey[600]
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width-50,
                                      child: const Text(
                                          "Eulogik, Zone-2, Anna Nagar, Zone-2, Maharana Pratap Nagar Bhopal, MP, india"
                                      )
                                  )
                                ],
                              )
                            ],
                          ),

                          SizedBox(height: 10,),

                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.apartment_outlined,
                                size:18,
                                color: Colors.grey[600],
                              ),

                              SizedBox(width: 10,),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Work location",
                                    style: TextStyle(
                                        color: Colors.grey[600]
                                    ),
                                  ),
                                  const Text("Same as interview location")
                                ],
                              ),

                            ],
                          ),

                          SizedBox(height: 10,),

                        ],
                      )
                  ),
                ],
              ),
            ),

            Container(
              color: Colors.grey[300],
              height:7,
            ),

            Container(

              width:  MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  SizedBox(height: 10,),

                  Row(
                    children: [
                      SizedBox(width: 20,),
                      Text(
                        "Job posted by ",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[600]
                        ),
                      ),

                      const Text(
                        "Eulogik",
                        style: TextStyle(
                            fontSize: 15
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 10,),
                ],
              ),
            ),

            SizedBox(height: 10,),

            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>FormScreen()));
              },
              child: Container(
                height: 50,
                width: 310,
                // color: Colors.green[700],
                decoration: BoxDecoration(
                  color: Colors.green[700],
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.grey, //color of border
                    width: 1, //width of border
                  ),
                ),
                child: const Center(
                  child: Text(
                      "Apply for job",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 17
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
