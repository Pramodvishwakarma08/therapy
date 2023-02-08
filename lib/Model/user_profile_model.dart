/// status : true
/// message : "User profile"
/// user : {"id":1,"name":"Sawan Shakya 1","username":"Sawan_Shakya_1","email":"sawan@mailinator.com","mobile":7896546544,"password":"$2y$10$p5PkGjFdLirayT/gQA.4LezgSxR1vdD6PQFDWj3eXa6sZF4lSU1Aq","otp":"7446","points":0,"about":"Hello World, Please visit my profile testtest","user_code":"M000012312398877","gender":"Male","address":"Vijay nagar, Indore, Madhya Pradesh, India, 452003","profile":"1669360687.png","certificate":"1668408068.jpg","education":"MBBS","hourly_rate":"15.00","dob":"2022-01-01","status":1,"created_at":"2022-11-12T12:06:43.000000Z","updated_at":"2022-11-26T04:55:48.000000Z"}

class UserProfileModel {
  UserProfileModel({
      bool? status, 
      String? message, 
      User? user,}){
    _status = status;
    _message = message;
    _user = user;
}

  UserProfileModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  bool? _status;
  String? _message;
  User? _user;
UserProfileModel copyWith({  bool? status,
  String? message,
  User? user,
}) => UserProfileModel(  status: status ?? _status,
  message: message ?? _message,
  user: user ?? _user,
);
  bool? get status => _status;
  String? get message => _message;
  User? get user => _user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    return map;
  }

}

/// id : 1
/// name : "Sawan Shakya 1"
/// username : "Sawan_Shakya_1"
/// email : "sawan@mailinator.com"
/// mobile : 7896546544
/// password : "$2y$10$p5PkGjFdLirayT/gQA.4LezgSxR1vdD6PQFDWj3eXa6sZF4lSU1Aq"
/// otp : "7446"
/// points : 0
/// about : "Hello World, Please visit my profile testtest"
/// user_code : "M000012312398877"
/// gender : "Male"
/// address : "Vijay nagar, Indore, Madhya Pradesh, India, 452003"
/// profile : "1669360687.png"
/// certificate : "1668408068.jpg"
/// education : "MBBS"
/// hourly_rate : "15.00"
/// dob : "2022-01-01"
/// status : 1
/// created_at : "2022-11-12T12:06:43.000000Z"
/// updated_at : "2022-11-26T04:55:48.000000Z"

class User {
  User({
      num? id, 
      String? name, 
      String? username, 
      String? email, 
      num? mobile, 
      String? password, 
      String? otp, 
      num? points, 
      String? about, 
      String? userCode, 
      String? gender, 
      String? address, 
      String? profile, 
      String? certificate, 
      String? education, 
      String? hourlyRate, 
      String? dob, 
      num? status, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _name = name;
    _username = username;
    _email = email;
    _mobile = mobile;
    _password = password;
    _otp = otp;
    _points = points;
    _about = about;
    _userCode = userCode;
    _gender = gender;
    _address = address;
    _profile = profile;
    _certificate = certificate;
    _education = education;
    _hourlyRate = hourlyRate;
    _dob = dob;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  User.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _username = json['username'];
    _email = json['email'];
    _mobile = json['mobile'];
    _password = json['password'];
    _otp = json['otp'];
    _points = json['points'];
    _about = json['about'];
    _userCode = json['user_code'];
    _gender = json['gender'];
    _address = json['address'];
    _profile = json['profile'];
    _certificate = json['certificate'];
    _education = json['education'];
    _hourlyRate = json['hourly_rate'];
    _dob = json['dob'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  String? _name;
  String? _username;
  String? _email;
  num? _mobile;
  String? _password;
  String? _otp;
  num? _points;
  String? _about;
  String? _userCode;
  String? _gender;
  String? _address;
  String? _profile;
  String? _certificate;
  String? _education;
  String? _hourlyRate;
  String? _dob;
  num? _status;
  String? _createdAt;
  String? _updatedAt;
User copyWith({  num? id,
  String? name,
  String? username,
  String? email,
  num? mobile,
  String? password,
  String? otp,
  num? points,
  String? about,
  String? userCode,
  String? gender,
  String? address,
  String? profile,
  String? certificate,
  String? education,
  String? hourlyRate,
  String? dob,
  num? status,
  String? createdAt,
  String? updatedAt,
}) => User(  id: id ?? _id,
  name: name ?? _name,
  username: username ?? _username,
  email: email ?? _email,
  mobile: mobile ?? _mobile,
  password: password ?? _password,
  otp: otp ?? _otp,
  points: points ?? _points,
  about: about ?? _about,
  userCode: userCode ?? _userCode,
  gender: gender ?? _gender,
  address: address ?? _address,
  profile: profile ?? _profile,
  certificate: certificate ?? _certificate,
  education: education ?? _education,
  hourlyRate: hourlyRate ?? _hourlyRate,
  dob: dob ?? _dob,
  status: status ?? _status,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  String? get name => _name;
  String? get username => _username;
  String? get email => _email;
  num? get mobile => _mobile;
  String? get password => _password;
  String? get otp => _otp;
  num? get points => _points;
  String? get about => _about;
  String? get userCode => _userCode;
  String? get gender => _gender;
  String? get address => _address;
  String? get profile => _profile;
  String? get certificate => _certificate;
  String? get education => _education;
  String? get hourlyRate => _hourlyRate;
  String? get dob => _dob;
  num? get status => _status;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['username'] = _username;
    map['email'] = _email;
    map['mobile'] = _mobile;
    map['password'] = _password;
    map['otp'] = _otp;
    map['points'] = _points;
    map['about'] = _about;
    map['user_code'] = _userCode;
    map['gender'] = _gender;
    map['address'] = _address;
    map['profile'] = _profile;
    map['certificate'] = _certificate;
    map['education'] = _education;
    map['hourly_rate'] = _hourlyRate;
    map['dob'] = _dob;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}