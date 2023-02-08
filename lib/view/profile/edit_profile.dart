import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:therapy/Helper/colors.dart';
import 'package:therapy/Helper/string.dart';
import 'package:therapy/Helper/widgets.dart';
import 'package:therapy/view/buttons/appButton.dart';
import 'package:therapy/view/buttons/custom_button.dart';
import 'package:therapy/view/profile/profile.dart';
import 'package:http/http.dart' as http;

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController aboutController = TextEditingController();

  updateProfile(context) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
          // 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI5N2IzOTM1NS0zMzA1LTQ5NGEtODhjZC04MTBiMTRhNGY4ZTgiLCJqdGkiOiI1NjZmZWU2YTIyYWY1MzViZTYwZGU0ZWM3MzhmNzM5ODM5MTRlYzYyNWUyMWFjOWVkYTcxNmY3NDU4ZWI0MTcyYTFiM2Q0MmVlMWFmNjZiYiIsImlhdCI6MTY2OTQzODU2MS40MTg2NzMwMzg0ODI2NjYwMTU2MjUsIm5iZiI6MTY2OTQzODU2MS40MTg2NzU4OTk1MDU2MTUyMzQzNzUsImV4cCI6MTY4NTA3Njk2MS40MTY1MDUwOTgzNDI4OTU1MDc4MTI1LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.N-quty__7XB7QwbxIRWqXdCORR-bQofPSrIrwVWGC3rvKMn9SWyGnaitfG_XY0ZKjcxpwen035uc_dgV_bPlxoWpB6wvfL-JQuzST0vw5TwoUNOwQ-33YNreqF4R-1l7u1LmbwFPv7b62rJEMH37zKIhPBW1FkTbncCgYz26yyYl-_aLFXFs29BdgayDT8To7r1eXL75QhitTXNJ92Rq_OM_vkdIC2foHiVBBPdniAuG1W3HX9OKiBnEd7a0nVtS60aJdbFywKRrIU8YMAwzkI2N1l5tQmws38iTqWyAGm-agAgoKH-YsIQ9G1ds-wMREZs18JXhPfAMQA-NW3x-jOzJPGEXy7ZdfkQ18S-QzbQqMx_oi0ICXGx_DHJUNrfoOEeGq9nuQAbOnP0fd5qIS6U0VjqKlB9MJU4Al3pBnZ7I7pDF5cfQIzgCrkaWrZCvZ5re5S4fflVHAz8KeOkTVnO4WV7Dw7kBoCt40itlKfJgUzOr_3cUjzMVbnv5kIUwtfsMdLKRQPeKeG375As7tuIxkR0MxsNqRvqOBSMnYUFwbPBdWNeOUXn6d7BYiEQkTjBOWWQh2NURemEMtQhloUZd285tkgclmaFxQgaxgng4PI2ZVS8WMzMGxDeEKIuRkSesNk9z3JHqgyBrUL2hsKDzUp2sLXbOmWkyjLPNcfE'
    };
    var request = http.MultipartRequest('POST', Uri.parse('$updateProfileUrl'));
    request.fields.addAll({
      'mobile': phoneController.text.toString(),
      'email': emailController.text.toString(),
      'about_me': aboutController.text.toString()
    });

    print("this is request ## ${request.fields.toString()}");
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    print("this is response ${response.statusCode.toString()}");

    if (response.statusCode == 200) {
      setSnackbar("Profile updated successfully!", context);
      print(await response.stream.bytesToString());
    }
    else {
    print(response.reasonPhrase);
    }

  }

  _profileHeader(){
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: Container(
        child: Stack(
          alignment: Alignment.center,
          children: [
            ClipPath(
                clipper: SkewCut(),
                child:
                Container(
                  height: MediaQuery.of(context).size.height/3.0,
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: AssetImage(
                              "assets/images/profile_placeholder.png"
                          ),
                          fit: BoxFit.fill
                      ),
                      color: Theme.of(context).colorScheme.secColor.withOpacity(0.7)
                  ),
                  // child: Image.asset("assets"),
                )
            ),



            Positioned(
              top: Platform.isAndroid ? 125 : 150,
              // left: 120,
              child: Center(
                child: CircleAvatar(
                  radius: 65,
                  child: Image.asset("assets/images/profile.png"),
                ),
              ),
            ),
            Positioned(
              top: Platform.isAndroid ? 130 : 150,
              // left: 120,
              child: Center(
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 65,
                  child: Image.asset("assets/icons/camera.png"),
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(

          children: [
            _profileHeader(),
             Text("Kevin Rock",style: TextStyle(
                color:Theme.of(context).colorScheme.fontColor,
                fontSize: 24,
                fontWeight: FontWeight.w600
            ),),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  subTitleText("Level-3", context, 13),
                  Image.asset('assets/icons/level.png', height: 20,)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 20, right: 20),
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Container(
                    padding: const EdgeInsets.all(10),
                    height: 80,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                              Text("Hourly Rate",
                              style: TextStyle(color: Theme.of(context).colorScheme.fontColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14
                              ),),
                            const SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('assets/icons/hourlyrate.png', height: 20,),
                                subTitleText(" \$10", context, 13),
                              ],
                            ),
                          ],
                        ),
                        const Padding(
                          padding:  EdgeInsets.symmetric(vertical: 5.0),
                          child:  VerticalDivider(
                            thickness: 2,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                              Text("AHPRA",
                              style:  TextStyle(color: Theme.of(context).colorScheme.fontColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14
                              ),),
                            const SizedBox(height: 10,),
                            subTitleText("#MED0001356", context, 13)
                          ],
                        ),

                      ],
                    )
                ),
              ),
            ),
           const SizedBox(height: 30,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
             Padding(
              padding: const EdgeInsets.only(left: 15.0,bottom: 5),
              child: Text(
                "Phone Number",
                style: TextStyle(fontSize: 15,color: Theme.of(context).colorScheme.fontColor , fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width-40,
              child: TextFormField(
                maxLength: 10,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.fontClr
                ),
                keyboardType: TextInputType.number,
                // maxLines: 4,
                controller: phoneController,
                // keyboardType: TextInputType.number,
                validator: (v) {
                  if (v!.isEmpty) {
                    return "This is field is required!";
                  }
                },
                decoration: InputDecoration(
                    counterText: "",
                    // suffix: const Icon(Icons.hourglass_top_outlined),
                    // hintText: "Number of hours",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                        borderSide: BorderSide(
                            color: colors.fntClr.withOpacity(0.5)))),
              ),
            ),
            SizedBox(height: 15,),
             Padding(
              padding: const EdgeInsets.only(left: 15.0, bottom: 5),
              child: Text(
                "Email Address",
                style: TextStyle(fontSize: 15, color: Theme.of(context).colorScheme.fontColor, fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width-40,
              child: TextFormField(
                // maxLength: maxLength,
                // maxLines: 4,
                controller: emailController,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.fontClr
                ),
                // keyboardType: TextInputType.number,
                validator: (v) {
                  if (v!.isEmpty) {
                    return "This is field is required!";
                  }
                },
                decoration: InputDecoration(
                    counterText: "",
                    // suffix: const Icon(Icons.hourglass_top_outlined),
                    // hintText: "Number of hours",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                        borderSide: BorderSide(
                            color: colors.fntClr.withOpacity(0.5)))),
              ),
            ),

            // textField(context, emailController, "Email Address", 50, 100),

                SizedBox(height: 15,),
                 Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text(
                    "About me",
                    style: TextStyle(fontSize: 15, color: Theme.of(context).colorScheme.fontColor, fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0, bottom: 10),
                  child: Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width-40,
                    child: TextFormField(
                      maxLines: 4,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.fontClr
                      ),
                      controller: aboutController,
                      // keyboardType: TextInputType.number,
                      validator: (v) {
                        if (v!.isEmpty) {
                          return "This is field is required!";
                        }
                      },
                      decoration: InputDecoration(
                        // suffix: const Icon(Icons.hourglass_top_outlined),
                        // hintText: "Number of hours",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(7),
                              borderSide: BorderSide(
                                  color: colors.fntClr.withOpacity(0.5)))),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40.0, left: 40, right: 40, bottom: 20),
              child: AppBtn(
                title: "Submit",
                // icon: Icons.edit,
                onPress: (){
                  updateProfile(context);
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>
                  //     BottomBar()));
                },
                height: 45,
                width: MediaQuery.of(context).size.width-30,
                fSize: 16,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 40.0, left: 40, bottom: 20),
              child: CustomAppBtn(
                title: "Back",
                // icon: Icons.edit,
                onPress: (){
                  Navigator.pop(context);
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>
                  //     BottomBar()));
                },
                height: 45,
                width: MediaQuery.of(context).size.width-30,
                fSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
