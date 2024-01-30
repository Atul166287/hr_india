import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:job_internship/home_screen.dart';

class AskForReferral extends StatefulWidget {
  const AskForReferral({super.key});

  @override
  State<AskForReferral> createState() => _AskForReferralState();
}

class _AskForReferralState extends State<AskForReferral> {
  String? selectedGender;

  TextEditingController dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    // print(screenHeight);
    // print(screenWidth);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Ask For Referral",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset("assets/referral_image.jpg"),
            Gap(10),

            Padding(
              padding: const EdgeInsets.only(left: 15.0,right: 15,),
              child: Card(
                elevation: 6,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gap(10),

                    Padding(
                      padding: const EdgeInsets.only(left: 30.0,right: 30,),
                      child: TextFormField(
                        // controller: _locationController,
                        style: TextStyle(
                            fontSize: 18
                        ),
                        decoration: InputDecoration(
                          // filled: true,
                          contentPadding: const EdgeInsets.all(10),
                          hintText: 'Enter Your Full Name',
                          hintStyle: TextStyle(
                            fontSize: 18,
                          ),
                          // border: const OutlineInputBorder(
                          //
                          //   borderRadius: BorderRadius.all(Radius.circular(7)),
                          // ),

                          // contentPadding: EdgeInsets.symmetric(vertical: 13),
                          disabledBorder: InputBorder.none,
                        ),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your Location';
                          }
                          return null;
                        },
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 30.0,right: 30,top: 30),
                      child: TextFormField(
                        // controller: _locationController,
                        style: TextStyle(
                            fontSize: 18
                        ),
                        decoration: InputDecoration(
                          // filled: true,
                          contentPadding: const EdgeInsets.all(10),
                          hintText: 'Enter Your Mobile Number',
                          hintStyle: TextStyle(
                            fontSize: 18,
                          ),
                          // border: const OutlineInputBorder(
                          //
                          //   borderRadius: BorderRadius.all(Radius.circular(7)),
                          // ),

                          // contentPadding: EdgeInsets.symmetric(vertical: 13),
                          disabledBorder: InputBorder.none,
                        ),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your Location';
                          }
                          return null;
                        },
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 30.0,right: 30,top: 30),
                      child: TextFormField(
                        // controller: _locationController,
                        style: TextStyle(
                            fontSize: 18
                        ),
                        decoration: InputDecoration(
                          // filled: true,
                          contentPadding: const EdgeInsets.all(10),
                          hintText: 'Enter Your E-mail Address',
                          hintStyle: TextStyle(
                            fontSize: 18,
                          ),
                          // border: const OutlineInputBorder(
                          //
                          //   borderRadius: BorderRadius.all(Radius.circular(7)),
                          // ),

                          // contentPadding: EdgeInsets.symmetric(vertical: 13),
                          disabledBorder: InputBorder.none,
                        ),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your Location';
                          }
                          return null;
                        },
                      ),
                    ),


                    Padding(
                      padding: const EdgeInsets.only(left: 30,right: 30,top: 30),
                      child: Row(
                        children: [
                          Expanded(
                            child: InputDecorator(

                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(10),
                                fillColor: Colors.white, // Yahan aap jis color ko chahte hain, wo daal sakte hain
                                // filled: true, // Isse field puri tarah se color se bhar jayegi
                              ),

                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: selectedGender,
                                  hint: Text(
                                    "Gender",
                                    style: TextStyle(
                                        fontSize: 18
                                    ),
                                  ),

                                  // focusColor: Colors.white,

                                  onChanged: (String? newValue) {
                                    setState(() {
                                      selectedGender = newValue;
                                    });
                                  },
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                  ),
                                  items: <String>['Male', 'Female', 'Other']
                                      .map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 30.0,right: 30,top: 30),
                      child: Image.network(
                        "https://user-images.githubusercontent.com/25476729/63087231-3dc35f80-bf6f-11e9-9409-35ab8cd5ba97.png",
                        // height: screenHeight / 17,
                        // width: screenWidth / 2.3,
                        height: 49,
                        width: 170,
                      ),
                    ),


                    Padding(
                      padding: const EdgeInsets.only(left: 30.0,right: 30),
                      child: TextFormField(
                        // controller: _locationController,
                        style: TextStyle(
                            fontSize: 18
                        ),
                        decoration: InputDecoration(
                          // filled: true,
                          contentPadding: const EdgeInsets.all(10),
                          hintText: 'Enter Captcha',
                          hintStyle: TextStyle(
                            fontSize: 18,
                          ),
                          // border: const OutlineInputBorder(
                          //
                          //   borderRadius: BorderRadius.all(Radius.circular(7)),
                          // ),

                          // contentPadding: EdgeInsets.symmetric(vertical: 13),
                          disabledBorder: InputBorder.none,
                        ),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your Location';
                          }
                          return null;
                        },
                      ),
                    ),


                    Padding(
                      padding: const EdgeInsets.only(left: 30.0,right: 30,top:40),
                      child: Card(
                        // color: Colors.deepOrange[600],
                        elevation: 7,
                        shadowColor: Colors.grey[900], // Elevation value (you can adjust this)
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0), // Rounded corners
                        ),
                        child: InkWell(
                          onTap: ()=>Navigator.pop(context, MaterialPageRoute(builder: (context)=>HomePage())),
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                // color: Colors.black,
                                  style: BorderStyle.none
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "Apply",
                                style: TextStyle(
                                  fontSize:19,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    Gap(30),
                  ],
                ),
              ),
            ),

            Gap(40),

            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Text(
                "Application",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0,right: 30,top: 10),
              child: Text(
                "Application Register yourself by completing your online application form on this site. Please note, your application will be considered for further processing only when it is completed, including the payment of application fee of ₹199. This application fee is for the purpose of the assessments and does not guarantee selection for the program or employment with Axis Bank.",
                style: TextStyle(
                    fontSize: 16
                ),
              ),
            ),

            Gap(25),

            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Text(
                "Campus Onboarding",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0,right: 30,top: 10),
              child: Text(
                "The selected candidates will be issued an admission letter and will be asked to report to the Manipal Academy of BFSI campus in Bengaluru to complete their admission formalities. On completion of the admission formalities, the selected candidates shall be enrolled in the program and the forty-five days campus training will begin.",
                style: TextStyle(
                  fontSize: 16
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
