import 'package:flutter/material.dart';
import 'package:therapy/Helper/widgets.dart';
import 'package:therapy/view/buttons/appButton.dart';
import 'package:therapy/view/login.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: false,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
             const SizedBox(height: 30,),
              Image.asset('assets/images/getStarted.png',
              width: MediaQuery.of(context).size.width * 0.09,
                height: MediaQuery.of(context).size.height * 0.09,),

              Container(
                width: MediaQuery.of(context).size.width,
                // height: MediaQuery.of(context).size.height * 0.45,
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0, top: 60),

                      child: Image.asset('assets/images/getStarted2.png',
                        width: MediaQuery.of(context).size.width * 0.37,
                        height: MediaQuery.of(context).size.height * 0.37,),
                    ),
                    Positioned(
                      left: 60,
                      bottom: 60,
                      child: Image.asset('assets/images/getStarted1.png',
                        width: MediaQuery.of(context).size.width * 0.37,
                        height: MediaQuery.of(context).size.height * 0.37,),
                    ),
                  ],
                ),
              ),
              titleText("Lorem Ipsum simply", context, 22),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 40.0, right: 40),
                child: subTitleText("Lorem ipsum is dummy text used in laying out print, graphic or web designs. ", context, 14),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 20),
                child: Image.asset('assets/images/load.png',
                  height: 25,
                  width: 25,
                ),
              ),
              AppBtn(
                title: "Get Started",
                onPress: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const Login()));
                },
                height: 50,
                width: 180,
                fSize: 18,
              )
            ],
          ),
        ),
      ),
    );
  }
}
