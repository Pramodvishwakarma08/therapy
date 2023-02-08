import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:therapy/Helper/colors.dart';
import 'package:therapy/Helper/widgets.dart';
import 'package:therapy/Model/verify_otp_model.dart';
import 'package:therapy/view/bottomBar/bottombar.dart';
import 'package:therapy/view/buttons/appButton.dart';
import 'package:therapy/view/home.dart';

import '../Helper/string.dart';
import 'package:http/http.dart' as http;

class Verification extends StatefulWidget {
  final String? mobile, otp;
   Verification({Key? key, this.mobile, this.otp}) : super(key: key);

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  final pinController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  String? msg;
  String? token;

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }
  Future<VerifyOtpModel?> verifyOtp(context) async {
    var request = http.MultipartRequest('POST', Uri.parse('$verifyOtpUrl'));
    request.fields.addAll({
      'mobile': '${widget.mobile}',
      'otp' : pinController.text.toString()
    });

    http.StreamedResponse response = await request.send();

    print(request);
    print(request.fields);
    if (response.statusCode == 200) {

      final str = await response.stream.bytesToString();
      var results = VerifyOtpModel.fromJson(json.decode(str));
      if(results.status == true){


        setState((){
          // otp = results.otp;
          msg = results.message;
          token = results.accessToken;
        });
        print("this is %% token $token");

        SharedPreferences preferences = await SharedPreferences.getInstance();
        await preferences.setString('token', token.toString());
        print("checking result here ${results.message}");
        setSnackbar("${results.message}", context);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>
            BottomBar()));
        // Navigator.push(context, MaterialPageRoute(builder: (context)=> Verification(
        //   mobile: mobileController.text.toString(),
        //   otp: otp.toString(),
        // )));
        // Fluttertoast.showToast(msg:"${results.message}");
      }else{
        print("checking result here ${results.message}");

        setState((){
          msg = results.message;
        });
        setSnackbar("${results.message}", context);
        // Fluttertoast.showToast(msg:"${results.message}");
      }



      return VerifyOtpModel.fromJson(json.decode(str));
    }
    else {
      return null;
    }
  }
  @override
  Widget build(BuildContext context) {
    var focusedBorderColor = Theme.of(context).colorScheme.secColor;
    //Color.fromRGBO(23, 171, 144, 1);
    const fillColor = Color.fromRGBO(243, 246, 249, 0);
    var borderColor = Theme.of(context).colorScheme.secColor;
    // Color.fromRGBO(23, 171, 144, 0.4);

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle:  TextStyle(
        fontSize: 22,
        color:Theme.of(context).colorScheme.fontColor,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: borderColor),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios,
            color: colors.primary,),
        ),
        title: const Text("Verification",
        style: TextStyle(
          color: colors.primary
        ),),
      ),
      body: Container(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 40,),
              subTitleText("Code has been sent to", context, 14),
              Padding(
                padding: const EdgeInsets.only(top: 7.0, bottom: 40),
                child: secTitleText("+61${widget.mobile}", context, 22),
              ),
              Directionality(
                // Specify direction if desired
                textDirection: TextDirection.ltr,
                child: Pinput(
                  controller: pinController,
                  focusNode: focusNode,
                  androidSmsAutofillMethod:
                  AndroidSmsAutofillMethod.smsUserConsentApi,
                  listenForMultipleSmsOnAndroid: true,
                  defaultPinTheme: defaultPinTheme,
                  // validator: (value) {
                  //   return value == '1234' ? null : 'Pin is incorrect';
                  // },
                  // onClipboardFound: (value) {
                  //   debugPrint('onClipboardFound: $value');
                  //   pinController.setText(value);
                  // },
                  hapticFeedbackType: HapticFeedbackType.lightImpact,
                  onCompleted: (pin) {
                    debugPrint('onCompleted: $pin');
                  },
                  onChanged: (value) {
                    debugPrint('onChanged: $value');
                  },
                  cursor: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 9),
                        width: 44,
                        height: 2,
                        color: focusedBorderColor,
                      ),
                    ],
                  ),
                  focusedPinTheme: defaultPinTheme.copyWith(
                    decoration: defaultPinTheme.decoration!.copyWith(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: focusedBorderColor),
                    ),
                  ),
                  submittedPinTheme: defaultPinTheme.copyWith(
                    decoration: defaultPinTheme.decoration!.copyWith(
                      color: fillColor,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: focusedBorderColor),
                    ),
                  ),
                  errorPinTheme: defaultPinTheme.copyBorderWith(
                    border: Border.all(color: Colors.redAccent),
                  ),
                ),
              ),
              Text("${widget.otp}",
              style: const TextStyle(
                color: colors.red,
                fontWeight: FontWeight.w600,
                fontSize: 22
              ),),
              const SizedBox(height: 20,),
              subTitleText("Haven't received the verification code?", context, 14),
              textBtn(
                      (){

              },
                  context),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: AppBtn(
                  title: "Verify Authentication Code",
                  onPress: (){
                     Navigator.push(
                         context, (MaterialPageRoute(builder: (context) => BottomBar())));


                    if(widget.otp == pinController.text.toString()){
                         verifyOtp(context);

                    }else{
                      verifyOtp(context);
                    }

                  },
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  fSize: 18,
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
