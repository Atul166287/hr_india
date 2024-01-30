import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class BasicDetails extends StatefulWidget{
  const BasicDetails({super.key});


  @override
  State<BasicDetails> createState() => _BasicDetailsState();
}

class _BasicDetailsState extends State<BasicDetails> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController(text: "Atul Sharma");

  final TextEditingController _emailController = TextEditingController(text: "atul76345@gmail.com");
  var savedEmail = "";

  final TextEditingController _mobileController = TextEditingController(text: "9584166287");
  var savedMobil = "";

  final TextEditingController _genderController = TextEditingController(text: "Male");
  var savedGender="";
  String _gender = 'Male';

  final TextEditingController _locationController = TextEditingController(text: "Bhopal");
  DateTime? _birthDate=DateTime(2003, 9, 2);

  final TextEditingController _dateController = TextEditingController();
  var savedLocation = "";
  String savedDOB = "";

  final TextEditingController _feedbackController = TextEditingController();

  bool isEditing = false;

  @override
  void initState() {
    super.initState();
    _dateController.text = _birthDate != null
        ? "${_birthDate!.day}/${_birthDate!.month}/${_birthDate!.year}"
        : '';
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _birthDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() {
        _birthDate = picked;
      });
    }

    _dateController.text = _birthDate != null
        ? "${_birthDate!.day}/${_birthDate!.month}/${_birthDate!.year}"
        : '';

  }


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      // appBar: AppBar(
      //     elevation: 0,
      //     backgroundColor: Colors.blue
      // ),
        body:SingleChildScrollView(
          child:Column(
            children: [
              SizedBox(height: screenHeight/7,),

              Container(
                width: MediaQuery.of(context).size.width / 3,
                height: MediaQuery.of(context).size.width / 3,
                padding: const EdgeInsets.all(10.0),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  image: DecorationImage(
                    image: NetworkImage("https://thumbs.dreamstime.com/z/young-man-sitting-computer-desk-office-working-documents-charming-young-man-working-bright-office-131289383.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              InkWell(
                child: Text(
                  _nameController.text,
                  style: const TextStyle(
                      fontSize:20,
                      color:Colors.black,
                      fontWeight: FontWeight.bold
                  ),
                ),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Update Name'),
                        content: TextFormField(
                          controller: _nameController,
                          decoration: InputDecoration(
                            filled: true,
                            contentPadding: const EdgeInsets.all(10),
                            hintText: 'Enter Your Name',
                            hintStyle: TextStyle(
                              fontSize: screenHeight / 44.5,
                            ),
                            border: const OutlineInputBorder(

                              borderRadius: BorderRadius.all(Radius.circular(10)),
                            ),
                            // contentPadding: EdgeInsets.symmetric(vertical: 13),
                            disabledBorder: InputBorder.none,
                          ),
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                        ),
                        actions: [
                          ElevatedButton(
                            onPressed: () {

                              Navigator.of(context).pop();
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),

              Padding(
                padding: EdgeInsets.only(top:50, left: screenWidth / 19, right: screenWidth / 19.63),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    // SizedBox(height: 130,),


                    Container(
                      height:45,
                      child: TextField(
                        controller: _mobileController,
                        readOnly: !isEditing,
                        onTap: () {
                          if (!isEditing) {
                            // Allow editing only when isEditing is true
                            return;
                          }
                        },
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          labelText: 'Mobile Number',
                          labelStyle: TextStyle(
                            color: Colors.black,
                          ),
                          suffixIcon: isEditing
                              ? IconButton(
                            icon: Icon(Icons.check),
                            onPressed: () {
                              print(_mobileController);
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text("Save Text"),
                                    content: Text("Do you want to save changes?"),
                                    actions: [
                                      ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            savedMobil = _mobileController.text;
                                            isEditing = false;
                                          });
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('Yes'),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('No'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          )
                              : null,
                        ),
                      ),
                    ),

                    // Container(
                    // decoration: BoxDecoration(
                    //   borderRadius: BorderRadius.circular(10),
                    //   border: Border.all(
                    //       color: Colors.black,
                    //       style: BorderStyle.solid
                    //   ),
                    // ),
                    // child: ListTile(
                    //   leading: Text("Mobile Number",
                    //     style:TextStyle(
                    //         fontSize: 18,
                    //         fontWeight: FontWeight.bold
                    //     ),
                    //   ),
                    //   // title: Text(_mobileController.text,
                    //   //   style: TextStyle(
                    //   //       fontSize: 17,
                    //   //       fontWeight: FontWeight.bold
                    //   //   ),
                    //   // ),
                    //   trailing: InkWell(
                    //     child: Text(_mobileController.text,
                    //       style: TextStyle(
                    //           fontSize: 17,
                    //           fontWeight: FontWeight.bold
                    //       ),
                    //     ),
                    //     onTap: () {
                    //       showDialog(
                    //         context: context,
                    //         builder: (BuildContext context) {
                    //           return AlertDialog(
                    //             title: const Text('Update Detail'),
                    //             content: TextFormField(
                    //               keyboardType: TextInputType.phone,
                    //               controller: _mobileController,
                    //               decoration: InputDecoration(
                    //                 filled: true,
                    //                 contentPadding: const EdgeInsets.all(10),
                    //                 hintText: 'Enter Mobile Number',
                    //                 hintStyle: TextStyle(
                    //                   fontSize: screenHeight / 44.5,
                    //                 ),
                    //                 border: const OutlineInputBorder(
                    //
                    //                   borderRadius: BorderRadius.all(Radius.circular(10)),
                    //                 ),
                    //                 // contentPadding: EdgeInsets.symmetric(vertical: 13),
                    //                 disabledBorder: InputBorder.none,
                    //               ),
                    //               validator: (String? value) {
                    //                 if (value == null || value.isEmpty) {
                    //                   return 'Please enter your name';
                    //                 }
                    //                 return null;
                    //               },
                    //             ),
                    //             actions: [
                    //               ElevatedButton(
                    //                 onPressed: () {
                    //
                    //                   Navigator.of(context).pop();
                    //                 },
                    //                 child: const Text('OK'),
                    //               ),
                    //             ],
                    //           );
                    //         },
                    //       );
                    //     },
                    //   ),
                    // ),
                    //                     ),

                    SizedBox(height: 15,),

                    Container(
                      height:45,
                      child: TextField(
                        controller: _emailController,
                        readOnly: !isEditing,
                        onTap: () {
                          if (!isEditing) {
                            // Allow editing only when isEditing is true
                            return;
                          }
                        },
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          labelText: 'E-mail',
                          labelStyle: TextStyle(
                            color: Colors.black,
                          ),
                          suffixIcon: isEditing
                              ? IconButton(
                            icon: Icon(Icons.check),
                            onPressed: () {
                              print(_emailController);
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text("Save Text"),
                                    content: Text("Do you want to save changes?"),
                                    actions: [
                                      ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            savedEmail = _emailController.text;
                                            isEditing = false;
                                          });
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('Yes'),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('No'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          )
                              : null,
                        ),
                      ),
                    ),
                    // Container(
                    // decoration: BoxDecoration(
                    //   borderRadius: BorderRadius.circular(10),
                    //   border: Border.all(
                    //       color: Colors.black,
                    //       style: BorderStyle.solid
                    //
                    //   ),
                    // ),
                    // child: ListTile(
                    //   leading: Text("Email:-",
                    //     style:TextStyle(
                    //         fontSize: 18,
                    //         fontWeight: FontWeight.bold
                    //     ),
                    //   ),
                    //   // title: Text(_emailController.text,
                    //   //   style: TextStyle(
                    //   //       fontSize: 17,
                    //   //       fontWeight: FontWeight.bold
                    //   //   ),
                    //   // ),
                    //   trailing: InkWell(
                    //     // child: const Icon(Icons.edit),
                    //     child: Text(_emailController.text,
                    //       style: TextStyle(
                    //           fontSize: 17,
                    //           fontWeight: FontWeight.bold
                    //       ),
                    //     ),
                    //     onTap: () {
                    //       showDialog(
                    //         context: context,
                    //         builder: (BuildContext context) {
                    //           return AlertDialog(
                    //             title: const Text('Update Detail'),
                    //             content: TextFormField(
                    //               keyboardType: TextInputType.emailAddress,
                    //               controller: _emailController,
                    //               decoration: InputDecoration(
                    //                 filled: true,
                    //                 contentPadding: const EdgeInsets.all(10),
                    //                 hintText: 'Enter Email',
                    //                 hintStyle: TextStyle(
                    //                   fontSize: screenHeight / 44.5,
                    //                 ),
                    //                 border: const OutlineInputBorder(
                    //
                    //                   borderRadius: BorderRadius.all(Radius.circular(10)),
                    //                 ),
                    //                 // contentPadding: EdgeInsets.symmetric(vertical: 13),
                    //                 disabledBorder: InputBorder.none,
                    //               ),
                    //               validator: (String? value) {
                    //                 if (value == null || value.isEmpty) {
                    //                   return 'Please enter your Email';
                    //                 }
                    //                 return null;
                    //               },
                    //             ),
                    //             actions: [
                    //               ElevatedButton(
                    //                 onPressed: () {
                    //
                    //                   Navigator.of(context).pop();
                    //                 },
                    //                 child: const Text('OK'),
                    //               ),
                    //             ],
                    //           );
                    //         },
                    //       );
                    //     },
                    //   ),
                    // ),
                    //
                    //                     ),

                    SizedBox(height: 15,),

                    Container(
                      height:45,
                      child: TextField(
                        controller: _locationController,
                        readOnly: !isEditing,
                        onTap: () {
                          if (!isEditing) {
                            // Allow editing only when isEditing is true
                            return;
                          }
                        },
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          labelText: 'Location',
                          labelStyle: TextStyle(
                            color: Colors.black,
                          ),
                          suffixIcon: isEditing
                              ? IconButton(
                            icon: Icon(Icons.check),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text("Save Text"),
                                    content: Text("Do you want to save changes?"),
                                    actions: [
                                      ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            savedLocation = _locationController.text;
                                            isEditing = false;
                                          });
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('Yes'),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('No'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          )
                              : null,
                        ),
                      ),
                    ),

                    // Container(
                    // decoration: BoxDecoration(
                    //   borderRadius: BorderRadius.circular(10),
                    //   border: Border.all(
                    //       color: Colors.black,
                    //       style: BorderStyle.solid
                    //
                    //   ),
                    // ),
                    // child: ListTile(
                    //   leading: Text("Location:-",
                    //     style:TextStyle(
                    //         fontSize: 18,
                    //         fontWeight: FontWeight.bold
                    //     ),
                    //   ),
                    //   // title: Text(_locationController.text,
                    //   //   style: TextStyle(
                    //   //       fontSize: 17,
                    //   //       fontWeight: FontWeight.bold
                    //   //   ),
                    //   // ),
                    //   trailing: InkWell(
                    //     child:Text(_locationController.text,
                    //       style: TextStyle(
                    //           fontSize: 17,
                    //           fontWeight: FontWeight.bold
                    //       ),
                    //     ),
                    //     onTap: () {
                    //       showDialog(
                    //         context: context,
                    //         builder: (BuildContext context) {
                    //           return AlertDialog(
                    //             title: const Text('Update Detail'),
                    //             content: TextFormField(
                    //               controller: _locationController,
                    //               decoration: InputDecoration(
                    //                 filled: true,
                    //                 contentPadding: const EdgeInsets.all(10),
                    //                 hintText: 'Enter Location',
                    //                 hintStyle: TextStyle(
                    //                   fontSize: screenHeight / 44.5,
                    //                 ),
                    //                 border: const OutlineInputBorder(
                    //
                    //                   borderRadius: BorderRadius.all(Radius.circular(10)),
                    //                 ),
                    //                 // contentPadding: EdgeInsets.symmetric(vertical: 13),
                    //                 disabledBorder: InputBorder.none,
                    //               ),
                    //               validator: (String? value) {
                    //                 if (value == null || value.isEmpty) {
                    //                   return 'Please enter your Location';
                    //                 }
                    //                 return null;
                    //               },
                    //             ),
                    //             actions: [
                    //               ElevatedButton(
                    //                 onPressed: () {
                    //
                    //                   Navigator.of(context).pop();
                    //                 },
                    //                 child: const Text('OK'),
                    //               ),
                    //             ],
                    //           );
                    //         },
                    //       );
                    //     },
                    //   ),
                    // ),
                    //
                    //                     ),

                    SizedBox(height: 15,),

                    Container(
                      height:45,
                      child: TextField(
                        controller: _genderController,
                        readOnly: true,
                        onTap: () {
                          if (!isEditing) {
                            // Allow editing only when isEditing is true
                            return;
                          }
                        },
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          labelText: 'Gender',
                          labelStyle: TextStyle(
                            color: Colors.black,
                          ),
                          suffix: IconButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text('Update Detail'),
                                      content: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          children: <Widget>[
                                            Radio<String>(
                                              value: 'Male',
                                              groupValue: _gender,

                                              onChanged: (String? value) {
                                                setState(() {
                                                  _gender = value!;
                                                });
                                              },
                                            ),
                                            const Text('Male'),
                                            Radio<String>(
                                              value: 'Female',
                                              groupValue: _gender,
                                              onChanged: (String? value) {
                                                setState(() {
                                                  _gender = value!;
                                                });
                                              },
                                            ),
                                            const Text('Female'),
                                            Radio<String>(
                                              value: 'Other',
                                              groupValue: _gender,
                                              onChanged: (String? value) {
                                                setState(() {
                                                  _gender = value!;
                                                });
                                              },
                                            ),
                                            const Text('Other'),
                                          ],
                                        ),
                                      ),

                                      actions: [
                                        ElevatedButton(
                                          onPressed: () {
                                            _genderController.text=_gender;
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text('OK'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }, icon: Icon(Icons.edit_note_outlined,size: 30,)),
                          // suffixIcon: isEditing
                          //     ? IconButton(
                          //   icon: Icon(Icons.check),
                          //   onPressed: () {
                          //     showDialog(
                          //       context: context,
                          //       builder: (BuildContext context) {
                          //         return AlertDialog(
                          //           title: Text("Save Text"),
                          //           content: Text("Do you want to save changes?"),
                          //           actions: [
                          //             ElevatedButton(
                          //               onPressed: () {
                          //                 setState(() {
                          //                   savedGender = _genderController.text;
                          //                   isEditing = false;
                          //                 });
                          //                 Navigator.of(context).pop();
                          //               },
                          //               child: Text('Yes'),
                          //             ),
                          //             ElevatedButton(
                          //               onPressed: () {
                          //                 Navigator.of(context).pop();
                          //               },
                          //               child: Text('No'),
                          //             ),
                          //           ],
                          //         );
                          //       },
                          //     );
                          //   },
                          // )
                          //     : null,
                        ),
                      ),
                    ),

                    // Container(
                    // decoration: BoxDecoration(
                    //   borderRadius: BorderRadius.circular(10),
                    //   border: Border.all(
                    //       color: Colors.black,
                    //       style: BorderStyle.solid
                    //
                    //   ),
                    // ),
                    // child:ListTile(
                    //   leading: Text("Gender:-",
                    //     style:TextStyle(
                    //         fontSize: 18,
                    //         fontWeight: FontWeight.bold
                    //     ),
                    //   ),
                    //   // title: Text(_gender,
                    //   //   style: TextStyle(
                    //   //       fontSize: 17,
                    //   //       fontWeight: FontWeight.bold
                    //   //   ),
                    //   // ),
                    //   trailing: InkWell(
                    //     child: Text(_gender,
                    //       style: TextStyle(
                    //           fontSize: 17,
                    //           fontWeight: FontWeight.bold
                    //       ),
                    //     ),
                    //     onTap: () {
                    //       showDialog(
                    //         context: context,
                    //         builder: (BuildContext context) {
                    //           return AlertDialog(
                    //             title: const Text('Update Detail'),
                    //             content: SingleChildScrollView(
                    //               scrollDirection: Axis.horizontal,
                    //               child: Row(
                    //                 children: <Widget>[
                    //                   Radio<String>(
                    //                     value: 'Male',
                    //                     groupValue: _gender,
                    //
                    //                     onChanged: (String? value) {
                    //                       setState(() {
                    //                         _gender = value!;
                    //                         _genderController.text=_gender;
                    //                       });
                    //                     },
                    //                   ),
                    //                   const Text('Male'),
                    //                   Radio<String>(
                    //                     value: 'Female',
                    //                     groupValue: _gender,
                    //                     onChanged: (String? value) {
                    //                       setState(() {
                    //                         _gender = value!;
                    //                         _genderController.text=_gender;
                    //                       });
                    //                     },
                    //                   ),
                    //                   const Text('Female'),
                    //                   Radio<String>(
                    //                     value: 'Other',
                    //                     groupValue: _gender,
                    //                     onChanged: (String? value) {
                    //                       setState(() {
                    //                         _gender = value!;
                    //                         _genderController.text=_gender;
                    //                       });
                    //                     },
                    //                   ),
                    //                   const Text('Other'),
                    //                 ],
                    //               ),
                    //             ),
                    //
                    //             actions: [
                    //               ElevatedButton(
                    //                 onPressed: () {
                    //
                    //                   Navigator.of(context).pop();
                    //                 },
                    //                 child: const Text('OK'),
                    //               ),
                    //             ],
                    //           );
                    //         },
                    //       );
                    //     },
                    //   ),
                    // ),
                    //                     ),

                    SizedBox(height: 15,),

                    Container(
                      height:45,
                      child: TextField(
                        controller: _dateController,
                        readOnly: true,
                        onTap: () {
                          if (!isEditing) {
                            // Allow editing only when isEditing is true
                            return;
                          }
                        },
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          labelText: 'DOB',
                          labelStyle: TextStyle(
                            color: Colors.black,
                          ),
                          
                          suffix: IconButton(
                            onPressed: () => _selectDate(context),
                            icon: Icon(Icons.calendar_month_outlined),
                          )
                        ),
                      ),
                    ),


                    // Container(
                    // decoration: BoxDecoration(
                    //   borderRadius: BorderRadius.circular(10),
                    //   border: Border.all(
                    //       color: Colors.black,
                    //       style: BorderStyle.solid
                    //
                    //   ),
                    // ),
                    // child:ListTile(
                    //   leading: Text("DOB:-",
                    //     style:TextStyle(
                    //         fontSize: 18,
                    //         fontWeight: FontWeight.bold
                    //     ),
                    //   ),
                    //   // title: _birthDate != null
                    //   //     ? Text(DateFormat('dd-MM-yyyy').format(_birthDate!),
                    //   //     style: TextStyle(
                    //   //             fontSize: 17,
                    //   //             fontWeight: FontWeight.bold
                    //   //         ),
                    //   // )
                    //   //     : const Text('Select your birthdate MM/dd/yyyy'),
                    //   trailing: InkWell(
                    //     child:  _birthDate != null
                    //         ? Text(DateFormat('dd-MM-yyyy').format(_birthDate!),
                    //       style: TextStyle(
                    //           fontSize: 17,
                    //           fontWeight: FontWeight.bold
                    //       ),
                    //     )
                    //         : const Text('Select your birthdate MM/dd/yyyy'),
                    //     onTap: () => _selectDate(context),
                    //   ),
                    // ),
                    //                     ),

                    SizedBox(height: 50,),


                    // InkWell(
                    //   onTap: (){
                    //     setState(() {
                    //       isEditing = true;
                    //     });
                    //     },
                    //   child: Container(
                    //     // margin: EdgeInsets.only(left: 15,right: 15,bottom: 15),
                    //     decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(50),
                    //       color: Colors.blueAccent,
                    //     ),
                    //     child: Padding(
                    //       padding: EdgeInsets.only(left: 10.0,right: 10, top: 12,bottom: 12),
                    //       child: Center(
                    //         child: Text(
                    //           "Edit",
                    //           style: TextStyle(
                    //             fontSize: 19,
                    //             color: Colors.white,
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),


                    TextButton(
                      onPressed: () {
                        setState(() {
                          isEditing = true;
                        });
                      },
                      child: Text(
                        'Edit',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.blueAccent
                        ),
                      ),
                    ),








                    // ListTile(
                    //   leading: Text("Mobile Number:-",
                    //     style:TextStyle(
                    //         fontSize: 18,
                    //         fontWeight: FontWeight.bold
                    //     ),
                    //   ),
                    //   title: Text(_mobileController.text,
                    //     style: TextStyle(
                    //     fontSize: 17,
                    //       fontWeight: FontWeight.bold
                    //     ),
                    //   ),
                    //   trailing: InkWell(
                    //     child: const Icon(Icons.edit),
                    //     onTap: () {
                    //       showDialog(
                    //         context: context,
                    //         builder: (BuildContext context) {
                    //           return AlertDialog(
                    //             title: const Text('Update Detail'),
                    //             content: TextFormField(
                    //               keyboardType: TextInputType.phone,
                    //               controller: _mobileController,
                    //               decoration: InputDecoration(
                    //                 filled: true,
                    //                 contentPadding: const EdgeInsets.all(10),
                    //                 hintText: 'Enter Mobile Number',
                    //                 hintStyle: TextStyle(
                    //                   fontSize: screenHeight / 44.5,
                    //                 ),
                    //                 border: const OutlineInputBorder(
                    //
                    //                   borderRadius: BorderRadius.all(Radius.circular(10)),
                    //                 ),
                    //                 // contentPadding: EdgeInsets.symmetric(vertical: 13),
                    //                 disabledBorder: InputBorder.none,
                    //               ),
                    //               validator: (String? value) {
                    //                 if (value == null || value.isEmpty) {
                    //                   return 'Please enter your name';
                    //                 }
                    //                 return null;
                    //               },
                    //             ),
                    //             actions: [
                    //               ElevatedButton(
                    //                 onPressed: () {
                    //
                    //                   Navigator.of(context).pop();
                    //                 },
                    //                 child: const Text('OK'),
                    //               ),
                    //             ],
                    //           );
                    //         },
                    //       );
                    //     },
                    //   ),
                    // ),
                    // // const SizedBox(height: 20,),
                    // Container(
                    //   height: 3,
                    //   color: Colors.grey,
                    // ),
                    //
                    // ListTile(
                    //   leading: Text("Email:-",
                    //     style:TextStyle(
                    //         fontSize: 18,
                    //         fontWeight: FontWeight.bold
                    //     ),
                    //   ),
                    //   title: Text(_emailController.text,
                    //     style: TextStyle(
                    //         fontSize: 17,
                    //         fontWeight: FontWeight.bold
                    //     ),
                    //   ),
                    //   trailing: InkWell(
                    //     child: const Icon(Icons.edit),
                    //     onTap: () {
                    //       showDialog(
                    //         context: context,
                    //         builder: (BuildContext context) {
                    //           return AlertDialog(
                    //             title: const Text('Update Detail'),
                    //             content: TextFormField(
                    //               keyboardType: TextInputType.emailAddress,
                    //               controller: _emailController,
                    //               decoration: InputDecoration(
                    //                 filled: true,
                    //                 contentPadding: const EdgeInsets.all(10),
                    //                 hintText: 'Enter Email',
                    //                 hintStyle: TextStyle(
                    //                   fontSize: screenHeight / 44.5,
                    //                 ),
                    //                 border: const OutlineInputBorder(
                    //
                    //                   borderRadius: BorderRadius.all(Radius.circular(10)),
                    //                 ),
                    //                 // contentPadding: EdgeInsets.symmetric(vertical: 13),
                    //                 disabledBorder: InputBorder.none,
                    //               ),
                    //               validator: (String? value) {
                    //                 if (value == null || value.isEmpty) {
                    //                   return 'Please enter your Email';
                    //                 }
                    //                 return null;
                    //               },
                    //             ),
                    //             actions: [
                    //               ElevatedButton(
                    //                 onPressed: () {
                    //
                    //                   Navigator.of(context).pop();
                    //                 },
                    //                 child: const Text('OK'),
                    //               ),
                    //             ],
                    //           );
                    //         },
                    //       );
                    //     },
                    //   ),
                    // ),
                    // // const SizedBox(height: 20,),
                    // Container(
                    //   height: 3,
                    //   color: Colors.grey,
                    // ),
                    //
                    // ListTile(
                    //   leading: Text("Location:-",
                    //     style:TextStyle(
                    //         fontSize: 18,
                    //         fontWeight: FontWeight.bold
                    //     ),
                    //   ),
                    //   title: Text(_locationController.text,
                    //     style: TextStyle(
                    //         fontSize: 17,
                    //         fontWeight: FontWeight.bold
                    //     ),
                    //   ),
                    //   trailing: InkWell(
                    //     child: const Icon(Icons.edit),
                    //     onTap: () {
                    //       showDialog(
                    //         context: context,
                    //         builder: (BuildContext context) {
                    //           return AlertDialog(
                    //             title: const Text('Update Detail'),
                    //             content: TextFormField(
                    //               keyboardType: TextInputType.text,
                    //               controller: _locationController,
                    //               decoration: InputDecoration(
                    //                 filled: true,
                    //                 contentPadding: const EdgeInsets.all(10),
                    //                 hintText: 'Enter Location',
                    //                 hintStyle: TextStyle(
                    //                   fontSize: screenHeight / 44.5,
                    //                 ),
                    //                 border: const OutlineInputBorder(
                    //
                    //                   borderRadius: BorderRadius.all(Radius.circular(10)),
                    //                 ),
                    //                 // contentPadding: EdgeInsets.symmetric(vertical: 13),
                    //                 disabledBorder: InputBorder.none,
                    //               ),
                    //               validator: (String? value) {
                    //                 if (value == null || value.isEmpty) {
                    //                   return 'Please enter your Location';
                    //                 }
                    //                 return null;
                    //               },
                    //             ),
                    //             actions: [
                    //               ElevatedButton(
                    //                 onPressed: () {
                    //
                    //                   Navigator.of(context).pop();
                    //                 },
                    //                 child: const Text('OK'),
                    //               ),
                    //             ],
                    //           );
                    //         },
                    //       );
                    //     },
                    //   ),
                    // ),
                    // // const SizedBox(height: 20,),
                    // Container(
                    //   height: 3,
                    //   color: Colors.grey,
                    // ),
                    //
                    // ListTile(
                    //   leading: Text("Gender:-",
                    //     style:TextStyle(
                    //         fontSize: 18,
                    //         fontWeight: FontWeight.bold
                    //     ),
                    //   ),
                    //   title: Text(_gender,
                    //     style: TextStyle(
                    //         fontSize: 17,
                    //         fontWeight: FontWeight.bold
                    //     ),
                    //   ),
                    //   trailing: InkWell(
                    //     child: const Icon(Icons.edit),
                    //     onTap: () {
                    //       showDialog(
                    //         context: context,
                    //         builder: (BuildContext context) {
                    //           return AlertDialog(
                    //             title: const Text('Update Detail'),
                    //             content:                             Row(
                    //               children: <Widget>[
                    //                 Radio<String>(
                    //                   value: 'Male',
                    //                   groupValue: _gender,
                    //                   onChanged: (String? value) {
                    //                     setState(() {
                    //                       _gender = value!;
                    //                     });
                    //                   },
                    //                 ),
                    //                 const Text('Male'),
                    //                 Radio<String>(
                    //                   value: 'Female',
                    //                   groupValue: _gender,
                    //                   onChanged: (String? value) {
                    //                     setState(() {
                    //                       _gender = value!;
                    //                     });
                    //                   },
                    //                 ),
                    //                 const Text('Female'),
                    //                 Radio<String>(
                    //                   value: 'Other',
                    //                   groupValue: _gender,
                    //                   onChanged: (String? value) {
                    //                     setState(() {
                    //                       _gender = value!;
                    //                     });
                    //                   },
                    //                 ),
                    //                 const Text('Other'),
                    //               ],
                    //             ),
                    //
                    //             actions: [
                    //               ElevatedButton(
                    //                 onPressed: () {
                    //
                    //                   Navigator.of(context).pop();
                    //                 },
                    //                 child: const Text('OK'),
                    //               ),
                    //             ],
                    //           );
                    //         },
                    //       );
                    //     },
                    //   ),
                    // ),
                    // // const SizedBox(height: 20,),
                    // Container(
                    //   height: 3,
                    //   color: Colors.grey,
                    // ),
                    //
                    // ListTile(
                    //   leading: Text("DOB:-",
                    //     style:TextStyle(
                    //         fontSize: 18,
                    //         fontWeight: FontWeight.bold
                    //     ),
                    //   ),
                    //   title: _birthDate != null
                    //       ? Text(DateFormat('dd-MM-yyyy').format(_birthDate!),
                    //     style: TextStyle(
                    //         fontSize: 17,
                    //         fontWeight: FontWeight.bold
                    //     ),
                    //   )
                    //       : const Text('Select your birthdate MM/dd/yyyy'),
                    //   trailing: InkWell(
                    //     child: const Icon(Icons.calendar_today),
                    //     onTap: () => _selectDate(context),
                    //   ),
                    // ),


                    SizedBox(height: 20,),


                    //
                    // Text(
                    //   "Number-",
                    //   style: TextStyle(
                    //     fontSize: 20
                    //   ),
                    // ),
                    // InkWell(
                    //   child: Text("   ${_mobileController.text}",
                    //     style: TextStyle(
                    //         fontSize: 19,
                    //         fontWeight: FontWeight.bold
                    //     ),
                    //   ),
                    //   onTap: () {
                    //     showDialog(
                    //       context: context,
                    //       builder: (BuildContext context) {
                    //         return AlertDialog(
                    //           title: const Text('Update Detail'),
                    //           content: TextFormField(
                    //             keyboardType: TextInputType.phone,
                    //             controller: _mobileController,
                    //             decoration: InputDecoration(
                    //               filled: true,
                    //               contentPadding: const EdgeInsets.all(10),
                    //               hintText: 'Enter Mobile Number',
                    //               hintStyle: TextStyle(
                    //                 fontSize: screenHeight / 44.5,
                    //               ),
                    //               border: const OutlineInputBorder(
                    //
                    //                 borderRadius: BorderRadius.all(Radius.circular(10)),
                    //               ),
                    //               // contentPadding: EdgeInsets.symmetric(vertical: 13),
                    //               disabledBorder: InputBorder.none,
                    //             ),
                    //             validator: (String? value) {
                    //               if (value == null || value.isEmpty) {
                    //                 return 'Please enter your name';
                    //               }
                    //               return null;
                    //             },
                    //           ),
                    //           actions: [
                    //             ElevatedButton(
                    //               onPressed: () {
                    //
                    //                 Navigator.of(context).pop();
                    //               },
                    //               child: const Text('OK'),
                    //             ),
                    //           ],
                    //         );
                    //       },
                    //     );
                    //   },
                    // ),
                    //
                    // SizedBox(height: 20,),
                    //
                    // Text(
                    //   "Email-",
                    //   style: TextStyle(
                    //       fontSize: 20
                    //   ),
                    // ),
                    // InkWell(
                    //   // child: const Icon(Icons.edit),
                    //   child: Text("   ${_emailController.text}",
                    //     style: TextStyle(
                    //         fontSize: 19,
                    //         fontWeight: FontWeight.bold
                    //     ),
                    //   ),
                    //   onTap: () {
                    //     showDialog(
                    //       context: context,
                    //       builder: (BuildContext context) {
                    //         return AlertDialog(
                    //           title: const Text('Update Detail'),
                    //           content: TextFormField(
                    //             keyboardType: TextInputType.emailAddress,
                    //             controller: _emailController,
                    //             decoration: InputDecoration(
                    //               filled: true,
                    //               contentPadding: const EdgeInsets.all(10),
                    //               hintText: 'Enter Email',
                    //               hintStyle: TextStyle(
                    //                 fontSize: screenHeight / 44.5,
                    //               ),
                    //               border: const OutlineInputBorder(
                    //
                    //                 borderRadius: BorderRadius.all(Radius.circular(10)),
                    //               ),
                    //               // contentPadding: EdgeInsets.symmetric(vertical: 13),
                    //               disabledBorder: InputBorder.none,
                    //             ),
                    //             validator: (String? value) {
                    //               if (value == null || value.isEmpty) {
                    //                 return 'Please enter your Email';
                    //               }
                    //               return null;
                    //             },
                    //           ),
                    //           actions: [
                    //             ElevatedButton(
                    //               onPressed: () {
                    //
                    //                 Navigator.of(context).pop();
                    //               },
                    //               child: const Text('OK'),
                    //             ),
                    //           ],
                    //         );
                    //       },
                    //     );
                    //   },
                    // ),
                    //
                    // SizedBox(height: 20,),
                    //
                    // Text(
                    //   "Location-",
                    //   style: TextStyle(
                    //       fontSize: 20
                    //   ),
                    // ),
                    // InkWell(
                    //   child:Text("    ${_locationController.text}",
                    //     style: TextStyle(
                    //         fontSize: 19,
                    //         fontWeight: FontWeight.bold
                    //     ),
                    //   ),
                    //   onTap: () {
                    //     showDialog(
                    //       context: context,
                    //       builder: (BuildContext context) {
                    //         return AlertDialog(
                    //           title: const Text('Update Detail'),
                    //           content: TextFormField(
                    //             controller: _locationController,
                    //             decoration: InputDecoration(
                    //               filled: true,
                    //               contentPadding: const EdgeInsets.all(10),
                    //               hintText: 'Enter Location',
                    //               hintStyle: TextStyle(
                    //                 fontSize: screenHeight / 44.5,
                    //               ),
                    //               border: const OutlineInputBorder(
                    //
                    //                 borderRadius: BorderRadius.all(Radius.circular(10)),
                    //               ),
                    //               // contentPadding: EdgeInsets.symmetric(vertical: 13),
                    //               disabledBorder: InputBorder.none,
                    //             ),
                    //             validator: (String? value) {
                    //               if (value == null || value.isEmpty) {
                    //                 return 'Please enter your Location';
                    //               }
                    //               return null;
                    //             },
                    //           ),
                    //           actions: [
                    //             ElevatedButton(
                    //               onPressed: () {
                    //
                    //                 Navigator.of(context).pop();
                    //               },
                    //               child: const Text('OK'),
                    //             ),
                    //           ],
                    //         );
                    //       },
                    //     );
                    //   },
                    // ),
                    //
                    //
                    //
                    //
                    SizedBox(height: 50,)
                  ],
                ),
              ),
            ],
          )
        )
    );
  }
}

//Costom CLipper class with Path
// class WaveClipper extends CustomClipper<Path>{
//   @override
//   Path getClip(Size size) {
//
//     var path = new Path();
//     path.lineTo(0, size.height); //start path with this if you are making at bottom
//
//     var firstStart = Offset(size.width / 5, size.height);
//     //fist point of quadratic bezier curve
//     var firstEnd = Offset(size.width / 2.25, size.height - 50.0);
//     //second point of quadratic bezier curve
//     path.quadraticBezierTo(firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);
//
//     var secondStart = Offset(size.width - (size.width / 3.24), size.height - 105);
//     //third point of quadratic bezier curve
//     var secondEnd = Offset(size.width, size.height - 10);
//     //fourth point of quadratic bezier curve
//     path.quadraticBezierTo(secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);
//
//     path.lineTo(size.width, 0); //end with this path if you are making wave at bottom
//     path.close();
//     return path;
//   }
//
//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) {
//     return false; //if new instance have different instance than old instance
//     //then you must return true;
//   }
// }