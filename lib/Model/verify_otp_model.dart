/// status : true
/// message : "OTP verified successfully"
/// access_token : "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI5N2IzOTM1NS0zMzA1LTQ5NGEtODhjZC04MTBiMTRhNGY4ZTgiLCJqdGkiOiIyM2FiZTkxMmQ0NjRlNTcxODgwOTcwNjk4M2VkNzAxODgwNjdiNzgxNmM1MmZjMDYwNjY1ZDg5M2I5MTRlM2I1MWQzMTY1YTJlODcwYjM4OCIsImlhdCI6MTY2OTQwNjMyMi43NzMzNTMwOTk4MjI5OTgwNDY4NzUsIm5iZiI6MTY2OTQwNjMyMi43NzMzNTUwMDcxNzE2MzA4NTkzNzUsImV4cCI6MTY4NTA0NDcyMi43Njg1MzEwODQwNjA2Njg5NDUzMTI1LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.LvRrc8RiawJ7jxPgE7KTcs24PrYh0niXBAqwckBDCpPMd5yAlTwKPLOPUUbssfzeErpS37UulcHSFwwOSoqNh5czy_NiAwv7uC4q0YVc6EDRhtABWeEGh6vTX9Gz3HDSwI32-q_RC6Lvuu0cQZ4JcjQ-l3A_p-FMvXQsPKgSLBuBY9ufZr1EQDmiOROruwNPQesDFdImOe9LtoxiUWXwru2P4rcZSsPEalmHa5w1JU-E-Zv8epbC0STKtNo_Jhb5UQHyiyDgXq9cJh6Oo4Vfn0QMKLDd6m4-Cb-pT_h7USU7b__UsoJWBGQ4b_s9et01nc_ph5A9Cr8cqyiu59BwaW9w2vjzdZDkEU6KH7FuLmoybX1sxpwbfG-p3xO9U4MGGtr3PoarE0sKhSx5UFZRM5vdCE7BYDJ1yVw2YT8Ld6tDTPmDOvF7P78eQ7dhJsFcEnkoDc_K9ygC72CZeUaKKsud1AiBjwEkFYUlK_MCCVv10qJ1aVZM_90xdkUfgMxIICYBlB09a2-ggUv0mRdUx45K3_wSoBIXML9NlPBuJOF960BjUKn1VGBgYX1rJU7s8y82Uz5q4eNNGDQ7q4eYnIZ3SPvTx4iE1P3zcAcZ_gIuhvgR2LsOy0K4Wm63fJwUhaxv27JUckcXlPvRS9E7CCZMkMPfDydhShHI0gMgaZY"

class VerifyOtpModel {
  VerifyOtpModel({
      bool? status, 
      String? message, 
      String? accessToken,}){
    _status = status;
    _message = message;
    _accessToken = accessToken;
}
  VerifyOtpModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _accessToken = json['access_token'];
  }
  bool? _status;
  String? _message;
  String? _accessToken;
  VerifyOtpModel copyWith({  bool? status,
  String? message,
  String? accessToken,
}) => VerifyOtpModel(  status: status ?? _status,
  message: message ?? _message,
  accessToken: accessToken ?? _accessToken,
);
  bool? get status => _status;
  String? get message => _message;
  String? get accessToken => _accessToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    map['access_token'] = _accessToken;
    return map;
  }

}