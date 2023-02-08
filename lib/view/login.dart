import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:therapy/Api/api_service.dart';
import 'package:therapy/Helper/colors.dart';
import 'package:therapy/Helper/session.dart';
import 'package:therapy/Helper/string.dart';
import 'package:therapy/Helper/widgets.dart';
import 'package:therapy/Model/send_otp_model.dart';
import 'package:therapy/view/buttons/appButton.dart';
import 'package:therapy/view/verification.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController mobileController = TextEditingController();
  String? otp;
  String msg = "";
  bool? status;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  // final mobileController = TextEditingController();
  final ccodeController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  String? mobile, id, countrycode, countryName, mobileno;
  bool _isNetworkAvail = true;
  Animation? buttonSqueezeanimation;
  AnimationController? buttonController;

  void validateAndSubmit() async {
    if (validateAndSave()) {
      _playAnimation();
      // checkNetwork();
    }
  }

  Future<Null> _playAnimation() async {
    try {
      await buttonController!.forward();
    } on TickerCanceled {}
  }

  // Future<void> checkNetwork() async {
  //   bool avail = await isNetworkAvailable();
  //   if (avail) {
  //     getVerifyUser();
  //   } else {
  //     Future.delayed(Duration(seconds: 2)).then((_) async {
  //       if (mounted)
  //         setState(() {
  //           _isNetworkAvail = false;
  //         });
  //       await buttonController!.reverse();
  //     });
  //   }
  // }

  bool validateAndSave() {
    final form = _formkey.currentState!;
    form.save();
    if (form.validate()) {
      return true;
    }
    return false;
  }

  // Future<void> getVerifyUser() async {
  //   try {
  //     var data = {MOBILE: mobile};
  //     http.Response response =
  //     await post(sendOtpUrl, body: data, headers: headers)
  //         .timeout(Duration(seconds: timeOut));
  //
  //     var getdata = json.decode(response.body);
  //     print("lofin"+getdata.toString());
  //     bool? error = getdata["error"];
  //     String? msg = getdata["message"];
  //     await buttonController!.reverse();
  //
  //     SettingProvider settingsProvider =
  //     Provider.of<SettingProvider>(context, listen: false);
  //
  //     if (widget.title == getTranslated(context, 'SEND_OTP_TITLE')) {
  //       if (!error!) {
  //         setSnackbar(msg!);
  //
  //         // settingsProvider.setPrefrence(MOBILE, mobile!);
  //         // settingsProvider.setPrefrence(COUNTRY_CODE, countrycode!);
  //
  //         Future.delayed(Duration(seconds: 1)).then((_) {
  //           Navigator.pushReplacement(
  //               context,
  //               MaterialPageRoute(
  //                   builder: (context) => VerifyOtp(
  //                     mobileNumber: mobile!,
  //                     countryCode: countrycode,
  //                     title: getTranslated(context, 'SEND_OTP_TITLE'),
  //                   )));
  //         });
  //       } else {
  //         setSnackbar(msg!);
  //       }
  //     }
  //     if (widget.title == getTranslated(context, 'FORGOT_PASS_TITLE')) {
  //       if (error!) {
  //         settingsProvider.setPrefrence(MOBILE, mobile!);
  //         settingsProvider.setPrefrence(COUNTRY_CODE, countrycode!);
  //         Future.delayed(Duration(seconds: 1)).then((_) {
  //           Navigator.pushReplacement(
  //               context,
  //               MaterialPageRoute(
  //                   builder: (context) => VerifyOtp(
  //                     mobileNumber: mobile!,
  //                     countryCode: countrycode,
  //                     title: getTranslated(context, 'FORGOT_PASS_TITLE'),
  //                   )));
  //         });
  //       } else {
  //         setSnackbar(getTranslated(context, 'FIRSTSIGNUP_MSG')!);
  //       }
  //     }
  //   } on TimeoutException catch (_) {
  //     setSnackbar(getTranslated(context, 'somethingMSg')!);
  //     await buttonController!.reverse();
  //   }
  // }

  Future<SendOtpModel?> sendOtp(context) async {
    var request = http.MultipartRequest('POST', Uri.parse('$sendOtpUrl'));
    request.fields.addAll({
      'mobile': mobileController.text.toString(),
    });

    print(request);
    print(request.fields);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {

      final str = await response.stream.bytesToString();
      var results = SendOtpModel.fromJson(json.decode(str));
      setState((){
        otp = results.otp;
        msg = results.message!;
        status = results.status;
      });
      print("checking result here ${results.message} and ${results.status}");
      if(results.status == true){
        setSnackbar("${results.message}", context);
         Navigator.push(context, MaterialPageRoute(builder: (context)=> Verification(
           mobile: mobileController.text.toString(),
           otp: otp.toString(),
         )));

      } else {
        setSnackbar("${results.message}", context);
      }


      return SendOtpModel.fromJson(json.decode(str));
    }
    else {
      setSnackbar("Invalid Mobile Number!", context);
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: false,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 30,),
                Image.asset('assets/images/login_header.png',
                  width: MediaQuery.of(context).size.width * 0.09,
                  height: MediaQuery.of(context).size.height * 0.09,),
                const SizedBox(height: 30,),
                Container(
                  width: MediaQuery.of(context).size.width,
                  // height: MediaQuery.of(context).size.height * 0.45,
                  // height: MediaQuery.of(context).size.height * 0.5,
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Positioned(
                        left: 55,
                        bottom: 60,
                        child: Image.asset('assets/images/login1.png',
                          width: MediaQuery.of(context).size.width * 0.37,
                          height: MediaQuery.of(context).size.height * 0.37,),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 55.0, top: 60),

                        child: Image.asset('assets/images/login2.png',
                          width: MediaQuery.of(context).size.width * 0.37,
                          height: MediaQuery.of(context).size.height * 0.37,),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30,),
                titleText("Login Now", context, 22),
                const SizedBox(height: 10,),
                subTitleText("Please enter the details below to continue", context, 14),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 20, left: 10, right: 10),
                  child: Container(
                    height: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color:  colors.textFieldClr
                      //Theme.of(context).colorScheme.gray,
                    ),
                    child: TextFormField(
                      controller: mobileController,
                      keyboardType: TextInputType.number,
                      style:const  TextStyle(
                        color: colors.fntClr
                        //Theme.of(context).colorScheme.fontClr
                      ),
                      maxLength: 10,
                      decoration: const InputDecoration(
                        counterText: "",
                        contentPadding: EdgeInsets.only(left: 15, top: 5),
                        hintText: "Enter Mobile no.",
                        hintStyle:  TextStyle(
                          fontSize: 14,
                            color:  colors.fntClr,
                            //Theme.of(context).colorScheme.fontClr
                        ),
                        border: InputBorder.none
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10, bottom: 20),
                  child: AppBtn(
                    title: "Send Authentication Code",
                    onPress: () {
                       Navigator.push(context, (MaterialPageRoute(builder: (context) => Verification())));
                     sendOtp(context);
                    },
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    fSize: 18,
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}