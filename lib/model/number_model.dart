
class GetOtpModel {
  GetOtpModel({required this.status, required this.message});

  factory GetOtpModel.fromMap(Map<String, dynamic> map) => GetOtpModel(
    status: map['status'],
    message: map['message'],
  );

  int status;
  String message;

  Map<String, dynamic> toMap() => {
    'status': status,
    'message': message,
  };

}

