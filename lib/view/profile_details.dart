// import 'package:flutter/material.dart';
// import 'package:therapy/Helper/colors.dart';
// import 'package:therapy/view/appBar/appBar.dart';
//
// class ProfileDetails extends StatelessWidget {
//   const ProfileDetails({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: colors.primary,
//       appBar: customAppBar("Profile Details", context),
//       body: Column(
//         children: [
//           // Container(
//           //   height: 100,
//           //   color: colors.primary,
//           // ),
//           Container(
//             height: MediaQuery.of(context).size.height -120,
//             decoration: const BoxDecoration(
//               color: colors.whit,
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(60),
//                 topRight: Radius.circular(60),
//               )
//             ),
//           ),
//           Container(),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:therapy/Helper/colors.dart';
import 'package:therapy/Helper/widgets.dart';
import 'package:therapy/view/appBar/appBar.dart';
import 'package:therapy/view/buttons/appButton.dart';

class ProfileDetails extends StatelessWidget {
  const ProfileDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.primary,
      appBar: customAppBar("Profile Details", context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
           alignment: Alignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: Container(
                      height: MediaQuery.of(context).size.height,
                    // - 97.6 - 80,
                      width: MediaQuery.of(context).size.width,
                      decoration:  BoxDecoration(
                          color: Theme.of(context).colorScheme.lightWhite,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(60),
                            topRight: Radius.circular(60),
                          )),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30.0, right: 30),
                        child: Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                subTitleText("Client Name*", context, 12),
                                titleText("John Wick", context, 12),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                subTitleText("Age*", context, 12),
                                titleText("23", context, 12),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                subTitleText("Date of Birth*", context, 12),
                                titleText("08/07/1997", context, 12),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                subTitleText("Contact No.", context, 12),
                                titleText("+91 222233333", context, 12),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                subTitleText("Gender", context, 12),
                                titleText("Male", context, 12),
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                titleText("Description", context, 12),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                                padding: const EdgeInsets.all(12),
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height * .23,
                                decoration: BoxDecoration(
                                    color: Colors.grey[100],
                                    borderRadius: BorderRadius.circular(10)),
                                child: const Center(
                                    child: Text(
                                  "Lorem Ipsum is simply dummy text of the Lorem Ipsum is simply dummy text of the and typesetting industry . Lorem Ipsum Lorem Ipsum is simply dummy text of the Lorem Ipsum is simply dummy text of the Lorem Ipsum is simply dummy and typesetting industry . Lorem Ipsum industry's standard dummy when an unknown printer",
                                  maxLines: 6,
                                  style: TextStyle(
                                      color: colors.subTxtClr,
                                      fontSize: 12,
                                      height: 2),
                                ))),
                          ],
                        ),
                      )),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * .04,
                  // left: MediaQuery.of(context).size.width * .38,
                  child: Center(
                    child: Container(
                      height: MediaQuery.of(context).size.height * .15,
                      child: CircleAvatar(
                        backgroundColor: colors.secondary1,
                        radius: MediaQuery.of(context).size.width * .2,
                        child: Image.asset("assets/images/profile3.png")
                      ),
                    ),
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
