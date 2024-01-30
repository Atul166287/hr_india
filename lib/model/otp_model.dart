
class VerifiedOtpModel {
  VerifiedOtpModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory VerifiedOtpModel.fromMap(Map<String, dynamic> map) => VerifiedOtpModel(
    status: map['status'],
    message: map['message'],
    data: Data.fromMap(map['data']),
  );

  int status;
  String message;
  Data data;

  Map<String, dynamic> toMap() => {
    'status': status,
    'message': message,
    'data': data.toMap(),
  };

}

class Data {
  Data({
    required this.loginUserId,
    required this.loginUserName,
    required this.loginUserEmailid,
    required this.loginUserContact,
  });

  factory Data.fromMap(Map<String, dynamic> map) => Data(
    loginUserId: map['login_user_id'],
    loginUserName: map['login_user_name'],
    loginUserEmailid: map['login_user_emailid'],
    loginUserContact: map['login_user_contact'],
  );

  String loginUserId;
  String loginUserName;
  String loginUserEmailid;
  String loginUserContact;

  Map<String, dynamic> toMap() => {
    'login_user_id': loginUserId,
    'login_user_name': loginUserName,
    'login_user_emailid': loginUserEmailid,
    'login_user_contact': loginUserContact,
  };

}

