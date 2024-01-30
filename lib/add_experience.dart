import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AddExperience extends StatefulWidget {
  const AddExperience({super.key});

  @override
  State<AddExperience> createState() => _AddExperienceState();
}

class _AddExperienceState extends State<AddExperience> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title:const Text("Add Experience"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Job Details",
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
              ),

              Gap(10),

              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.grey, //color of border
                    width: 1,
                    style: BorderStyle.none//width of border
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 2.0,bottom: 2),
                        child: Text("Job title"),
                      ),
                      Container(
                        height: 40,
                        child: TextFormField(
                          // controller: _locationController,
                          decoration: InputDecoration(
                            // filled: true,
                            contentPadding: const EdgeInsets.all(10),
                            hintText: 'e.g. Teacher',
                            hintStyle: TextStyle(
                              fontSize: screenHeight / 44.5,
                            ),
                            border: const OutlineInputBorder(

                              borderRadius: BorderRadius.all(Radius.circular(7)),
                            ),

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

                      Gap(15),

                      const Padding(
                        padding: EdgeInsets.only(left: 2.0,bottom: 2),
                        child: Text("Department"),
                      ),
                      Container(
                        height: 40,
                        child: TextFormField(
                          // controller: _locationController,
                          decoration: InputDecoration(
                            // filled: true,
                            contentPadding: const EdgeInsets.all(10),
                            hintText: 'Enter Department',
                            hintStyle: TextStyle(
                              fontSize: screenHeight / 44.5,
                            ),
                            border: const OutlineInputBorder(

                              borderRadius: BorderRadius.all(Radius.circular(7)),
                            ),

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

                      Gap(15),

                      const Padding(
                        padding: EdgeInsets.only(left: 2.0,bottom: 2),
                        child: Text("Other Category/Role"),
                      ),
                      Container(
                        height: 40,
                        child: TextFormField(
                          // controller: _locationController,
                          decoration: InputDecoration(
                            // filled: true,
                            contentPadding: const EdgeInsets.all(10),
                            hintText: 'Enter Category/Role',
                            hintStyle: TextStyle(
                              fontSize: screenHeight / 44.5,
                            ),
                            border: const OutlineInputBorder(

                              borderRadius: BorderRadius.all(Radius.circular(7)),
                            ),

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

                      Gap(15),

                      const Padding(
                        padding: EdgeInsets.only(left: 2.0,bottom: 2),
                        child: Text("Description (optional)"),
                      ),
                      Container(
                        height: 40,
                        child: TextFormField(
                          // controller: _locationController,
                          decoration: InputDecoration(
                            // filled: true,
                            contentPadding: const EdgeInsets.all(10),
                            hintText: 'e.g. Improved retention by 15%',
                            hintStyle: TextStyle(
                              fontSize: screenHeight / 44.5,
                            ),
                            border: const OutlineInputBorder(

                              borderRadius: BorderRadius.all(Radius.circular(7)),
                            ),

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

                      Gap(15),

                      const Padding(
                        padding: EdgeInsets.only(left: 2.0,bottom: 2),
                        child: Text("Skills (up to 10)"),
                      ),
                      Container(
                        height: 40,
                        child: TextFormField(
                          // controller: _locationController,
                          decoration: InputDecoration(
                            // filled: true,
                            contentPadding: const EdgeInsets.all(10),
                            hintText: 'Enter the Skills you know',
                            hintStyle: TextStyle(
                              fontSize: screenHeight / 44.5,
                            ),
                            border: const OutlineInputBorder(

                              borderRadius: BorderRadius.all(Radius.circular(7)),
                            ),

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

                      Gap(15),
                    ],
                  ),
                ),
              ),

              Gap(30),

              const Text(
                "Company Details",
                style: TextStyle(
                    fontWeight: FontWeight.bold
                ),
              ),

              Gap(10),

              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: Colors.grey, //color of border
                      width: 1,
                      style: BorderStyle.none//width of border
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 2.0,bottom: 2),
                        child: Text("Company Name"),
                      ),
                      Container(
                        height: 40,
                        child: TextFormField(
                          // controller: _locationController,
                          decoration: InputDecoration(
                            // filled: true,
                            contentPadding: const EdgeInsets.all(10),
                            hintText: 'e.g. HR India',
                            hintStyle: TextStyle(
                              fontSize: screenHeight / 44.5,
                            ),
                            border: const OutlineInputBorder(

                              borderRadius: BorderRadius.all(Radius.circular(7)),
                            ),

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

                      Gap(15),

                      const Padding(
                        padding: EdgeInsets.only(left: 2.0,bottom: 2),
                        child: Text("Industry"),
                      ),
                      Container(
                        height: 40,
                        child: TextFormField(
                          // controller: _locationController,
                          decoration: InputDecoration(
                            // filled: true,
                            contentPadding: const EdgeInsets.all(10),
                            hintText: 'e.g. Business',
                            hintStyle: TextStyle(
                              fontSize: screenHeight / 44.5,
                            ),
                            border: const OutlineInputBorder(

                              borderRadius: BorderRadius.all(Radius.circular(7)),
                            ),

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



                    ],
                  ),
                ),
              ),

              Gap(30),

              const Text(
                "Employee Details",
                style: TextStyle(
                    fontWeight: FontWeight.bold
                ),
              ),

              Gap(10),

              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: Colors.grey, //color of border
                      width: 1,
                      style: BorderStyle.none//width of border
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 2.0,bottom: 2),
                        child: Text("Are you currently working in this company"),
                      ),

                      Row(
                        children: [
                          Container(
                            height: 40,
                            child: Text("Yes"),
                          ),

                          Gap(10),

                          Container(
                            height: 20,
                            width: 20,

                            child: Text("No"),
                          ),
                        ],
                      ),

                      Gap(15),

                      const Padding(
                        padding: EdgeInsets.only(left: 2.0,bottom: 2),
                        child: Text("Industry"),
                      ),
                      Container(
                        height: 40,
                        child: TextFormField(
                          // controller: _locationController,
                          decoration: InputDecoration(
                            // filled: true,
                            contentPadding: const EdgeInsets.all(10),
                            hintText: 'e.g. Business',
                            hintStyle: TextStyle(
                              fontSize: screenHeight / 44.5,
                            ),
                            border: const OutlineInputBorder(

                              borderRadius: BorderRadius.all(Radius.circular(7)),
                            ),

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



                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
