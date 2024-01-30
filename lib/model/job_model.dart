
class JobModel {
  JobModel({required this.status, required this.data});

  factory JobModel.fromMap(Map<String, dynamic> map) => JobModel(
    status: map['status'],
    data: List<Data>.from(map['data'].map((e) => Data.fromMap(e))),
  );

  int status;
  List<Data> data;

  Map<String, dynamic> toMap() => {
    'status': status,
    'data': data.map((e) => e.toMap()).toList(),
  };

}

class Data {
  Data({
    required this.id,
    required this.date,
    required this.company,
    required this.image,
    required this.role,
    required this.vacancy,
    required this.salary,
    required this.location,
    required this.category,
    required this.type,
    required this.experience,
    required this.gender,
    required this.qualification,
    required this.sector,
    required this.callHr,
    required this.discription,
    required this.status,
    required this.package,
  });

  factory Data.fromMap(Map<String, dynamic> map) => Data(
    id: map['id'],
    date: map['date'],
    company: map['company'],
    image: map['image'],
    role: map['role'],
    vacancy: map['vacancy'],
    salary: map['salary'],
    location: map['location'],
    category: map['category'],
    type: map['type'],
    experience: map['experience'],
    gender: map['gender'],
    qualification: map['qualification'],
    sector: map['sector'],
    callHr: map['call_hr'],
    discription: map['discription'],
    status: map['status'],
    package: map['package'],
  );

  String id;
  String date;
  String company;
  String image;
  String role;
  String vacancy;
  String salary;
  String location;
  String category;
  String type;
  String experience;
  String gender;
  String qualification;
  String sector;
  String callHr;
  String discription;
  String status;
  String package;

  Map<String, dynamic> toMap() => {
    'id': id,
    'date': date,
    'company': company,
    'image': image,
    'role': role,
    'vacancy': vacancy,
    'salary': salary,
    'location': location,
    'category': category,
    'type': type,
    'experience': experience,
    'gender': gender,
    'qualification': qualification,
    'sector': sector,
    'call_hr': callHr,
    'discription': discription,
    'status': status,
    'package': package,
  };

}

