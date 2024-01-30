import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:job_internship/apply_screen.dart';
import 'package:http/http.dart' as http;
import 'package:job_internship/model/job_model.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  String jobUrl = "https://www.thehrindia.com/api/index.php/Api/getJobs";
  late JobModel jobModel;
  List<Data> filteredJobs = [];

  @override
  void initState() {
    super.initState();
    _getJobData().then((jobData) {
      setState(() {
        jobModel = jobData;
        filteredJobs = jobModel.data;
      });
    });
  }

  Future<JobModel> _getJobData() async {
    final uri = Uri.parse(jobUrl);
    final response = await http.get(uri);
    final data = json.decode(response.body);
    jobModel = JobModel.fromMap(data);
    return JobModel.fromMap(data);
  }

  Future<void> _refreshData() async {
    try {
      JobModel refreshedData = await _getJobData();
      setState(() {
        jobModel = refreshedData;
        filteredJobs = jobModel.data;
      });
    } catch (error) {
      print("Error refreshing data: $error");
      // Handle the error (e.g., show a snackbar or an error message)
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Error refreshing data"),
        ),
      );
    }
  }

  void filterJobs(String searchText) {
    setState(() {
      if (searchText.isEmpty) {
        filteredJobs = jobModel.data;
      } else {
        filteredJobs = jobModel.data
            .where((job) =>
        job.role.toLowerCase().contains(searchText.toLowerCase()) ||
            job.company.toLowerCase().contains(searchText.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Image.asset(
          "assets/logo.png",
          height: 49,
          width: 170,
        ),
        actions: [
          IconButton(
            onPressed: _refreshData,
            icon: const Icon(
              Icons.refresh,
              color: Colors.blueAccent,
              size: 27,
            ),
          ),
          IconButton(
            onPressed: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) => const DemoPage()));
            },
            icon: const Icon(
              Icons.notifications,
              color: Colors.blueAccent,
              size: 27,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: screenHeight / 41.52,),
            Padding(
              padding: EdgeInsets.only(top: screenHeight / 83, left: screenWidth / 19.63, right: screenWidth / 19.63),
              child: Container(
                height: 45,
                child: TextField(
                  controller: searchController,
                  onChanged: (text) {
                    filterJobs(text);
                  },
                  style: TextStyle(
                    fontSize: 19,
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    hintStyle: TextStyle(
                      fontSize: 18,
                    ),
                    hintText: "Search here",
                    suffixIcon: Icon(
                      Icons.search,
                      size: 30,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.all(13),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            FutureBuilder<JobModel>(
              future: _getJobData(),
              builder: (BuildContext context, AsyncSnapshot<JobModel> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                // else if (snapshot.hasError) {
                //   return Text('Error:Something went Wrong \n ${snapshot.error}');
                // }
                else if (snapshot.hasError) {
                  return Center(
                    child: IconButton(
                      onPressed: _refreshData,
                      icon: const Icon(
                        Icons.refresh,
                        color: Colors.blueAccent,
                        size: 50,
                      ),
                    ),
                  );
                } else {
                  jobModel = snapshot.data!;
                  return ListView.builder(
                    itemCount: filteredJobs.length,
                    shrinkWrap: true,
                    controller: ScrollController(
                      keepScrollOffset: false,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      Data job = filteredJobs[index];
                      return Padding(
                        padding: EdgeInsets.only(left: 12.0, right: 12, bottom: 12),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const ApplyScreen()));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Colors.grey,
                                width: 1,
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
                                      Container(
                                        width: screenWidth / 1.3,
                                        child: Text(
                                          job.role,
                                          maxLines: 1,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17,
                                          ),
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
                                      Container(
                                        width: screenWidth / 1.3,
                                        child: Text(
                                          " ${job.location}",
                                          maxLines: 1,
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 15,
                                          ),
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
                                        " ${job.salary}",
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 15,
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
                                                    fontSize: 16,
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
                                                  fontSize: 16,
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
                  );
                }
              },
            ),
            SizedBox(height: screenHeight / 69,),
          ],
        ),
      ),
    );
  }
}
