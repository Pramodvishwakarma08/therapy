import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:therapy/Helper/card_widgets.dart';
import 'package:therapy/Helper/colors.dart';
import 'package:therapy/Helper/string.dart';
import 'package:therapy/Helper/widgets.dart';
import 'package:therapy/Model/user_profile_model.dart';
import 'package:therapy/view/availability.dart';
import 'package:therapy/view/bottomBar/bottombar.dart';
import 'package:therapy/view/faq_screen.dart';
import 'package:therapy/view/invoice_history.dart';
import 'package:therapy/view/login.dart';
import 'package:therapy/view/notification.dart';
import 'package:therapy/view/people_support.dart';
import 'package:therapy/view/people_supported.dart';
import 'package:therapy/view/privacy_policy.dart';
import 'package:therapy/view/term_condition.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  final String? token;
  const Home({Key? key, this.token}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Map<String, dynamic>> therapists = [
    {"image": "assets/images/profile2.png", "name": "John Wick", "date": "08 July 2022"},
    {"image": "assets/images/profile3.png", "name": "Jack Sparrow" , "date": "08 July 2022"},
    {"image": "assets/images/profile2.png", "name": "Tony Stark" , "date": "08 July 2022"},
    {"image": "assets/images/profile3.png", "name": "John Dalton" , "date": "08 July 2022"},
  ];
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  // getDrawer(){
  //   return Drawer(
  //     child: ListView(
  //       padding: EdgeInsets.all(0),
  //       children: <Widget>[
  //         DrawerHeader(
  //           decoration: BoxDecoration(
  //             color: backgroundblack,
  //           ), //BoxDecoration
  //           child: Row(
  //             children: [
  //               SizedBox(height: 20,),
  //               userPic == null || userPic == "" ? CircleAvatar(
  //                 backgroundColor: appColorWhite,
  //                 radius: 40,
  //                 child: Icon(Icons.person,color: appColorBlack,),
  //               ) : CircleAvatar(
  //                 radius: 40,
  //                 backgroundImage: NetworkImage(userPic),
  //               ),
  //               SizedBox(width: 10,),
  //               Expanded(
  //                 child: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   mainAxisAlignment: MainAxisAlignment.center,
  //                   children: [
  //                     Text(
  //                       "$userName",
  //                       style: TextStyle(fontSize: 18, color: appColorWhite),
  //                     ),
  //                     Text("$userEmail",
  //                       style: TextStyle(color: appColorWhite),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ), //DrawerHeader
  //         ListTile(
  //           leading: const Icon(Icons.home, color: backgroundblack,),
  //           title: const Text(' Home '),
  //           onTap: () {
  //             Navigator.push(
  //               context,
  //               MaterialPageRoute(builder: (context) => TabbarScreen()),
  //             );
  //           },
  //         ),
  //         // ListTile(
  //         //   leading: const Icon(Icons.chat, color: backgroundblack,),
  //         //   title: const Text(' Chat Support '),
  //         //   onTap: () {
  //         //     Navigator.push(
  //         //       context,
  //         //       // MaterialPageRoute(builder: (context) => ChatPage( chatId: "1", title: "Karan")),
  //         //       MaterialPageRoute(builder: (context)=> ChatScreen()),
  //         //     );
  //         //   },
  //         // ),
  //         // ListTile(
  //         //   leading: const Icon(Icons.settings, color: backgroundblack,),
  //         //   title: const Text('Add Request'),
  //         //   onTap: () {
  //         //     Navigator.push(
  //         //       context,
  //         //       // MaterialPageRoute(builder: (context) => ChatPage( chatId: "1", title: "Karan")),
  //         //       MaterialPageRoute(builder: (context)=> RequestService()),
  //         //     );
  //         //   },
  //         // ),
  //         ListTile(
  //           leading: const Icon(Icons.request_page, color: backgroundblack,),
  //           title: const Text('My Request'),
  //           onTap: () {
  //             Navigator.push(
  //               context,
  //               // MaterialPageRoute(builder: (context) => ChatPage( chatId: "1", title: "Karan")),
  //               MaterialPageRoute(builder: (context)=> MyRequestPage()),
  //             );
  //           },
  //         ),
  //         ListTile(
  //           leading: const Icon(Icons.privacy_tip_rounded, color: backgroundblack,),
  //           title: const Text(' Privacy Policy '),
  //           onTap: () {
  //             Navigator.push(
  //               context,
  //               MaterialPageRoute(builder: (context) => PrivacyPolicyScreen()),
  //             );
  //           },
  //         ),
  //         ListTile(
  //           leading: const Icon(Icons.list_alt, color: backgroundblack,),
  //           title: const Text(' Terms & Condition '),
  //           onTap: () {
  //             Navigator.push(
  //               context,
  //               MaterialPageRoute(builder: (context) => TermsConditionScreen()),
  //             );
  //           },
  //         ),
  //         /// Only for Testing
  //         // ListTile(
  //         //   leading: const Icon(Icons.list_alt, color: backgroundblack,),
  //         //   title: const Text(' Testing '),
  //         //   onTap: () {
  //         //     Navigator.push(
  //         //       context,
  //         //       MaterialPageRoute(builder: (context) => HomePage()),
  //         //     );
  //         //   },
  //         // ),
  //         ListTile(
  //           leading: const Icon(Icons.question_answer, color: backgroundblack,),
  //           title: const Text(' FAQ '),
  //           onTap: () {
  //             Navigator.push(
  //               context,
  //               MaterialPageRoute(builder: (context) => FaqScreen()),
  //             );
  //           },
  //         ),
  //         ListTile(
  //           leading: const Icon(Icons.logout, color: backgroundblack,),
  //           title: const Text('LogOut'),
  //           onTap: () {
  //             Alert(
  //               context: context,
  //               title: "Log out",
  //               desc: "Are you sure you want to log out?",
  //               style: AlertStyle(
  //                   isCloseButton: false,
  //                   descStyle: TextStyle(fontFamily: "MuliRegular", fontSize: 15),
  //                   titleStyle: TextStyle(fontFamily: "MuliRegular")),
  //               buttons: [
  //                 DialogButton(
  //                   child: Text(
  //                     "OK",
  //                     style: TextStyle(
  //                         color: Colors.white,
  //                         fontSize: 16,
  //                         fontFamily: "MuliRegular"),
  //                   ),
  //                   onPressed: () async {
  //                     setState(() {
  //                       userID = '';
  //
  //                       userEmail = '';
  //                       userMobile = '';
  //                       likedProduct = [];
  //                       likedService = [];
  //                     });
  //                     // signOutGoogle();
  //                     //signOutFacebook();
  //                     preferences!
  //                         .remove(SharedPreferencesKey.LOGGED_IN_USERRDATA)
  //                         .then((_) {
  //                       Navigator.of(context).pushAndRemoveUntil(
  //                         MaterialPageRoute(
  //                           builder: (context) => Login(),
  //                         ),
  //                             (Route<dynamic> route) => false,
  //                       );
  //                     });
  //
  //                     Navigator.of(context, rootNavigator: true).pop();
  //                   },
  //                   color: backgroundblack,
  //                   // color: Color.fromRGBO(0, 179, 134, 1.0),
  //                 ),
  //                 DialogButton(
  //                   child: Text(
  //                     "Cancel",
  //                     style: TextStyle(
  //                         color: Colors.white,
  //                         fontSize: 16,
  //                         fontFamily: "MuliRegular"),
  //                   ),
  //                   onPressed: () {
  //                     Navigator.of(context, rootNavigator: true).pop();
  //                   },
  //                   color: backgroundblack,
  //                   // gradient: LinearGradient(colors: [
  //                   //   Color.fromRGBO(116, 116, 191, 1.0),
  //                   //   Color.fromRGBO(52, 138, 199, 1.0)
  //                   // ]),
  //                 ),
  //               ],
  //             ).show();
  //           },
  //         ),
  //       ],
  //     ),
  //   );
  // }
  _intro(){
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Row(
        children: [
          CircleAvatar(
            child: Image.asset('assets/images/profile1.png',),
          ),
          const SizedBox(width: 10,),
          RichText(
            text: TextSpan(
              text: 'Hi! ',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: colors.primary
              ),
              children:  <TextSpan>[
                TextSpan(text:  name != null ?
                "$name"
                    :"Kevin Rock",
                  style:  TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.secColor
                ),),

              ],
            ),
          )
        ],
      ),
    );
  }

  final double circleRadius = 100.0;
  final double circleBorderWidth = 8.0;
  String? name;

  _secondHeader(){
    return Padding(
      padding: const EdgeInsets.only(top: 0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> PeopleSupported()));
          },
          child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                  top: 28
             // circleRadius / 2.0
              ),
              child:  Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.lightWhite,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.grey,
                        blurRadius: 8.0,
                        offset: Offset(0.75, 0.00)
                    )
                  ],
                ),
                padding: const EdgeInsets.only(left: 10, right: 5, bottom: 10),
                height: 120,
                // width: MediaQuery.of(context).size.width/2.4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    titleTextNormal("02", context, 28),
                   const SizedBox(height: 5,),
                    Container(
                        child: titleText("People I've Supported", context, 12,))
                  ],
                ),
              ),
            ),
            Container(
              width: 60,
              //circleRadius,
              height: 60,
              //circleRadius,
              decoration: const ShapeDecoration(
                  shape: CircleBorder(),
                  color: Colors.transparent),
              child: Padding(
                padding: EdgeInsets.all(circleBorderWidth),
                child: const DecoratedBox(
                  decoration: ShapeDecoration(
                      shape: CircleBorder(),
                      image: DecorationImage(
                          fit: BoxFit.contain,
                          image: AssetImage("assets/images/imoji2.png",
                            // 'https://upload.wikimedia.org/wikipedia/commons/a/a0/Bill_Gates_2018.jpg',
                          ))),
                ),
              ),
            ),
          ],
      ),
        ),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> PeopleSupport()));
            },
            child: Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[

                Padding(
                  padding: const EdgeInsets.only(top: 25
                    // circleRadius / 2.0
                  ),
                  child:  Container(
                    padding: const EdgeInsets.only(left: 10, right: 5, bottom: 10),
                    height: 120,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.lightWhite,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 8.0,
                            offset: Offset(0.75, 0.00)
                        )
                      ],
                    ),
                    width: MediaQuery.of(context).size.width/2.4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [

                        titleTextNormal("02", context, 28),
                        const SizedBox(height: 5,),
                        titleText("People I Support", context, 12)
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 60,
                  //circleRadius,
                  height: 60,
                  //circleRadius,
                  decoration: const ShapeDecoration(shape: CircleBorder(), color: Colors.transparent),
                  child: Padding(
                    padding: EdgeInsets.all(circleBorderWidth),
                    child: const DecoratedBox(
                      decoration: ShapeDecoration(
                          shape: CircleBorder(),
                          image: DecorationImage(
                              fit: BoxFit.contain,
                              image: AssetImage("assets/images/imoji1.png",
                                // 'https://upload.wikimedia.org/wikipedia/commons/a/a0/Bill_Gates_2018.jpg',
                              ))),
                    ),
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }

  _banner(){
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> BottomBar(index: 2,)));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 140,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: const DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/images/leaderboard.png')
            )
          ),
        ),
      ),
    );
  }

  _availableFeature(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        secTitleText("Availability Feature", context, 16),
        const SizedBox(height: 15,),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: therapists.length,
            itemBuilder: (context, index){
          return availabilityCard(
            context, therapists, index, true
          );
        })
      ],
    );

  }

 Future<UserProfileModel?> getProfile() async{
   SharedPreferences prefs = await SharedPreferences.getInstance();
   String? token = prefs.getString('token');

   print("this is access token @@ ${token.toString()}");

    var headers = {
      'Authorization': 'Bearer $token'
          // 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI5N2IzOTM1NS0zMzA1LTQ5NGEtODhjZC04MTBiMTRhNGY4ZTgiLCJqdGkiOiI1NjZmZWU2YTIyYWY1MzViZTYwZGU0ZWM3MzhmNzM5ODM5MTRlYzYyNWUyMWFjOWVkYTcxNmY3NDU4ZWI0MTcyYTFiM2Q0MmVlMWFmNjZiYiIsImlhdCI6MTY2OTQzODU2MS40MTg2NzMwMzg0ODI2NjYwMTU2MjUsIm5iZiI6MTY2OTQzODU2MS40MTg2NzU4OTk1MDU2MTUyMzQzNzUsImV4cCI6MTY4NTA3Njk2MS40MTY1MDUwOTgzNDI4OTU1MDc4MTI1LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.N-quty__7XB7QwbxIRWqXdCORR-bQofPSrIrwVWGC3rvKMn9SWyGnaitfG_XY0ZKjcxpwen035uc_dgV_bPlxoWpB6wvfL-JQuzST0vw5TwoUNOwQ-33YNreqF4R-1l7u1LmbwFPv7b62rJEMH37zKIhPBW1FkTbncCgYz26yyYl-_aLFXFs29BdgayDT8To7r1eXL75QhitTXNJ92Rq_OM_vkdIC2foHiVBBPdniAuG1W3HX9OKiBnEd7a0nVtS60aJdbFywKRrIU8YMAwzkI2N1l5tQmws38iTqWyAGm-agAgoKH-YsIQ9G1ds-wMREZs18JXhPfAMQA-NW3x-jOzJPGEXy7ZdfkQ18S-QzbQqMx_oi0ICXGx_DHJUNrfoOEeGq9nuQAbOnP0fd5qIS6U0VjqKlB9MJU4Al3pBnZ7I7pDF5cfQIzgCrkaWrZCvZ5re5S4fflVHAz8KeOkTVnO4WV7Dw7kBoCt40itlKfJgUzOr_3cUjzMVbnv5kIUwtfsMdLKRQPeKeG375As7tuIxkR0MxsNqRvqOBSMnYUFwbPBdWNeOUXn6d7BYiEQkTjBOWWQh2NURemEMtQhloUZd285tkgclmaFxQgaxgng4PI2ZVS8WMzMGxDeEKIuRkSesNk9z3JHqgyBrUL2hsKDzUp2sLXbOmWkyjLPNcfE'
    };
    var request = http.MultipartRequest('GET', Uri.parse('$getProfileUrl'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    final str = await response.stream.bytesToString();
    var results = UserProfileModel.fromJson(json.decode(str));


   print("this is response @@  ${results.user!.name.toString()}");
    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      setState((){
        name = results.user!.name.toString();
      });


      print("this is response @@  ${results.user!.name.toString()}");

    }
    else {
    print(response.reasonPhrase);
    }

  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProfile();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: colors.whit,
      key: _scaffoldKey,
      drawer: Drawer(
        // backgroundColor: colors.whit,
        child: Container(
          // width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/images/drawer_bg.png')
            )
          ),
          // width: MediaQuery.of(context).size.width/2,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, top: 40),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      child: Image.asset("assets/images/user3.png"),
                    ),
                   const SizedBox(width: 15,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(name != null ?
                        "$name"
                            :"Kevin Rock",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: colors.secondary,
                          ),) ,
                      const SizedBox(height: 5,),
                       const Text("+61987123456",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: colors.fntClr,
                          ),)
                        // titleText("7896546544", context, 14)

                      ],
                    )

                  ],
                ),
                const SizedBox(height: 30,),
                drawerItem('assets/icons/drawer1.png', "Availability", (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Availability()));
                }),
                drawerItem('assets/icons/drawer2.png', "Invoice & Payments", (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> InvoiceHistory()));
                }),
                drawerItem('assets/icons/drawer4.png', "Outlook", (){
                }),
                drawerItem('assets/icons/drawer3.png', "Sharepoint", (){}),
                drawerItem('assets/icons/drawer5.png', "Skool", (){}),
                drawerItem('assets/icons/drawer6.png', "FAQ", (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> FaqScreen()));
                }),
                drawerItem('assets/icons/drawer7.png', "Privacy Policy", (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> PrivacyPolicy()));
                }),
                drawerItem('assets/icons/drawer8.png', "Terms & Conditions", (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> TermCondition()));
                }),
               // const SizedBox(height: 30,),
                drawerItem('assets/icons/drawer9.png', "Logout", (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Login()));
                }),

              ],
            ),
          ),
        ),
      ),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          backgroundColor: Theme.of(context).colorScheme.lightWhite,
          leading: InkWell(
            onTap: (){

              _scaffoldKey.currentState!.openDrawer();

              },
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 8, bottom: 8),
              child: Container(
                  padding: const EdgeInsets.all(10),
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: colors.secondary),
                    color: colors.whit
                ),
                child: const ImageIcon(
                  AssetImage('assets/icons/drawericon.png',),
                  color: colors.secondary
                )
                // Icon(Icons.menu_outlined, color: appColorWhite,),
              ),
            ),
          ),
          // backgroundColor: colors.whit,
          // shape: const RoundedRectangleBorder(
          //     borderRadius: BorderRadius.only(
          //         bottomLeft: Radius.circular(20),
          //         bottomRight: Radius.circular(20)
          //     )
          // ),
          elevation: 0,
          title: Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Container(
              height: 50,
                width: 150,
                child: Image.asset('assets/icons/appIcon.png')),
          ),
          centerTitle: true,
          actions: [
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Notifications()));
                // _scaffoldKey.currentState!.openDrawer();
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0, top: 8, bottom: 8),
                child: Container(
                    padding: const EdgeInsets.all(7),
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: colors.secondary),
                        color: colors.whit
                    ),
                    child:  const Icon(
                        Icons.notifications,
                        color: colors.secondary)
                  // Icon(Icons.menu_outlined, color: appColorWhite,),
                ),
              ),
            ),
            Container(width: 10),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20),
          child: Column(
            children: [
              _intro(),
              _secondHeader(),
              _banner(),
              _availableFeature()
            ],
          ),
        ),
      ),
      // drawer: getDrawer(),
    );
  }
}
