/// status : true
/// message : "OTP send successfully"
/// otp : "1306"

class SendOtpModel {
  SendOtpModel({
      bool? status, 
      String? message, 
      String? otp,}){
    _status = status;
    _message = message;
    _otp = otp;
}

  SendOtpModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _otp = json['otp'];
  }
  bool? _status;
  String? _message;
  String? _otp;
SendOtpModel copyWith({  bool? status,
  String? message,
  String? otp,
}) => SendOtpModel(  status: status ?? _status,
  message: message ?? _message,
  otp: otp ?? _otp,
);
  bool? get status => _status;
  String? get message => _message;
  String? get otp => _otp;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    map['otp'] = _otp;
    return map;
  }

}