import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:therapy/Helper/colors.dart';
import 'package:therapy/view/home.dart';
import 'package:therapy/view/leaderboard.dart';
import 'package:therapy/view/profile/profile.dart';
import 'package:therapy/view/schedule/schedule.dart';

class BottomBar extends StatefulWidget {
  final int? index;
  const BottomBar({Key? key, this.index}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int pageIndex = 0;


  final pages = [
    const Home(),
    const Schedule(),
    const Leaderboard(),
    const Profile(),
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.index != null) {
      pageIndex = widget.index!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Confirm Exit"),
              content: Text("Are you sure you want to exit?"),
              actions: <Widget>[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: colors.primary
                  ),
                  child: Text("YES"),
                  onPressed: () {
                    SystemNavigator.pop();
                  },
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: colors.primary
                  ),
                  child: Text("NO"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          }
      );
      return true;
    },

      child: Scaffold(
        // drawer: Drawer(
        //   // backgroundColor: colors.whit,
        //   child: Container(
        //     // width: MediaQuery.of(context).size.width,
        //     decoration: const BoxDecoration(
        //         image: DecorationImage(
        //             fit: BoxFit.fill,
        //             image: AssetImage('assets/images/drawer_bg.png')
        //         )
        //     ),
        //     // width: MediaQuery.of(context).size.width/2,
        //     child: Padding(
        //       padding: const EdgeInsets.only(left: 20, top: 40),
        //       child: Column(
        //         children: [
        //           Row(
        //             children: [
        //               CircleAvatar(
        //                 radius: 40,
        //                 child: Image.asset("assets/images/user3.png"),
        //               ),
        //               const SizedBox(width: 15,),
        //               Column(
        //                 crossAxisAlignment: CrossAxisAlignment.start,
        //                 children: const[
        //                   Text(
        //                   //   name != null ?
        //                   // "$name"
        //                   //     :
        //                   "Kevin Rock",
        //                     style:  TextStyle(
        //                       fontSize: 18,
        //                       fontWeight: FontWeight.bold,
        //                       color: colors.secondary,
        //                     ),) ,
        //                    SizedBox(height: 5,),
        //                    Text("+61987123456",
        //                     style: TextStyle(
        //                       fontSize: 14,
        //                       fontWeight: FontWeight.bold,
        //                       color: colors.fntClr,
        //                     ),)
        //                   // titleText("7896546544", context, 14)
        //
        //                 ],
        //               )
        //
        //             ],
        //           ),
        //           const SizedBox(height: 30,),
        //           drawerItem('assets/icons/drawer1.png', "Availability", (){
        //             Navigator.push(context, MaterialPageRoute(builder: (context)=> Availability()));
        //           }),
        //           drawerItem('assets/icons/drawer2.png', "Invoice", (){
        //             Navigator.push(context, MaterialPageRoute(builder: (context)=> InvoiceHistory()));
        //           }),
        //           drawerItem('assets/icons/drawer4.png', "Outlook", (){
        //           }),
        //           drawerItem('assets/icons/drawer3.png', "Sharepoint", (){}),
        //           drawerItem('assets/icons/drawer5.png', "Skool", (){}),
        //           drawerItem('assets/icons/drawer6.png', "FAQ", (){
        //             Navigator.push(context, MaterialPageRoute(builder: (context)=> FaqScreen()));
        //           }),
        //           drawerItem('assets/icons/drawer7.png', "Privacy Policy", (){
        //             Navigator.push(context, MaterialPageRoute(builder: (context)=> PrivacyPolicy()));
        //           }),
        //           drawerItem('assets/icons/drawer8.png', "Terms & Conditions", (){
        //             Navigator.push(context, MaterialPageRoute(builder: (context)=> TermCondition()));
        //           }),
        //           // const SizedBox(height: 30,),
        //           drawerItem('assets/icons/drawer9.png', "Logout", (){
        //             Navigator.push(context, MaterialPageRoute(builder: (context)=> Login()));
        //           }),
        //
        //         ],
        //       ),
        //     ),
        //   ),
        // ),
      // backgroundColor: const Color(0xffC4DFCB),
      body: pages[pageIndex],
      bottomNavigationBar: buildMyNavBar(context),
    )
    );
  }
  bottomBarElement(String title, image, int index ){
    return InkWell(
      onTap: (){
        setState(() {
          pageIndex = index;
        });
      },
      child: Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        // width: 80,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: pageIndex == index ? colors.primary : Theme.of(context).colorScheme.lightWhite,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageIcon(
                AssetImage(image),
              color: pageIndex == index ? Theme.of(context).colorScheme.lightWhite : Theme.of(context).colorScheme.fontColor,
            ),
           const  SizedBox(width: 3,),
            // Image.asset(image),
            pageIndex == index ?
            Text(title,
            style:  TextStyle(
              color: Theme.of(context).colorScheme.lightWhite,
            ),) : const SizedBox.shrink()
          ],
        ),
      ),
    );
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.grey,
              blurRadius: 8.0,
              offset: Offset(0.75, 0.00)
          )
        ],
        color: Theme.of(context).primaryColor,
        // borderRadius: const BorderRadius.only(
        //   topLeft: Radius.circular(20),
        //   topRight: Radius.circular(20),
        // ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          bottomBarElement("Home", "assets/icons/dashboard1.png", 0),
          bottomBarElement("Schedule", "assets/icons/dashboard2.png", 1),
          bottomBarElement("Leaderboard", "assets/icons/dashboard3.png", 2),
          bottomBarElement("Profile", "assets/icons/dashboard4.png", 3),
          // IconButton(
          //   enableFeedback: false,
          //   onPressed: () {
          //     setState(() {
          //       pageIndex = 0;
          //     });
          //   },
          //   icon: pageIndex == 0
          //       ? const Icon(
          //     Icons.home_filled,
          //     // color: Colors.white,
          //     size: 35,
          //   )
          //       : const Icon(
          //     Icons.home_outlined,
          //     // color: Colors.white,
          //     size: 35,
          //   ),
          // ),
          // IconButton(
          //   enableFeedback: false,
          //   onPressed: () {
          //     setState(() {
          //       pageIndex = 1;
          //     });
          //   },
          //   icon: pageIndex == 1
          //       ? const Icon(
          //     Icons.work_rounded,
          //     // color: Colors.white,
          //     size: 35,
          //   )
          //       : const Icon(
          //     Icons.work_outline_outlined,
          //     // color: Colors.white,
          //     size: 35,
          //   ),
          // ),
          // IconButton(
          //   enableFeedback: false,
          //   onPressed: () {
          //     setState(() {
          //       pageIndex = 2;
          //     });
          //   },
          //   icon: pageIndex == 2
          //       ? const Icon(
          //     Icons.widgets_rounded,
          //     // color: Colors.white,
          //     size: 35,
          //   )
          //       : const Icon(
          //     Icons.widgets_outlined,
          //     // color: Colors.white,
          //     size: 35,
          //   ),
          // ),
          // IconButton(
          //   enableFeedback: false,
          //   onPressed: () {
          //     setState(() {
          //       pageIndex = 3;
          //     });
          //   },
          //   icon: pageIndex == 3
          //       ? const Icon(
          //     Icons.person,
          //     // color: Colors.white,
          //     size: 35,
          //   )
          //       : const Icon(
          //     Icons.person_outline,
          //     // color: Colors.white,
          //     size: 35,
          //   ),
          // ),
        ],
      ),
    );
  }
}