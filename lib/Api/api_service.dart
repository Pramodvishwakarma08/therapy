import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:therapy/Helper/widgets.dart';
import 'package:therapy/Model/send_otp_model.dart';

import '../Helper/string.dart';
import 'package:http/http.dart' as http;

class ApiService{

  Future<SendOtpModel?> sendOtp(String mobile, context) async {
    var request = http.MultipartRequest('POST', Uri.parse('$sendOtpUrl'));
    request.fields.addAll({
      'mobile': '$mobile',
    });

    http.StreamedResponse response = await request.send();

    print(request);
    print(request.fields);
    if (response.statusCode == 200) {

      final str = await response.stream.bytesToString();
      var results = SendOtpModel.fromJson(json.decode(str));
      if(results.status == true){
        setSnackbar("${results.message}", context);
       
      }else{
        setSnackbar("${results.message}", context);
       
      }
      print("checking result here ${results.message}");
      String? msg;
      msg = results.message;

      return SendOtpModel.fromJson(json.decode(str));
    }
    else {
      return null;
    }
  }

}