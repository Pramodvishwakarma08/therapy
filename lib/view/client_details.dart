import 'dart:io';

import 'package:flutter/material.dart';
import 'package:therapy/Helper/colors.dart';
import 'package:therapy/Helper/widgets.dart';
import 'package:therapy/view/appBar/appBar.dart';
import 'package:therapy/view/buttons/appButton.dart';
import 'package:therapy/view/schedule/add_schedule.dart';
import 'package:therapy/view/schedule/view_schedule.dart';
import 'package:therapy/view/visits/add_visit_history.dart';

class ClientDetails extends StatefulWidget {
  final bool? show;
  const ClientDetails({Key? key, this.show}) : super(key: key);

  @override
  State<ClientDetails> createState() => _ClientDetailsState();
}

class _ClientDetailsState extends State<ClientDetails> {
  var items = [
    'Functional Capacity Assessment',
    'Ongoing Occupational Therapy',
    'SIL Assessment',
    'SDA Assessment'
  ];

  String? dropdownValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.primary,
      appBar: customAppBar("Client Details", context),
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
                      width: MediaQuery.of(context).size.width,
                      decoration:  BoxDecoration(
                          // color: Colors.grey,
                          color: Theme.of(context).colorScheme.lightWhite,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(60),
                            topRight: Radius.circular(60),
                          )),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .12,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                subTitleText("Client's Name*", context, 12),
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
                                titleText("+61 222233333", context, 12),
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
                              height: 15,
                            ),
                          widget.show == false ?
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                subTitleText("Distance", context, 12),
                                titleText("7Km", context, 12),
                              ],
                            )
                            : const SizedBox.shrink() ,
                            widget.show == true ?
                            Padding(
                              padding: const EdgeInsets.only(top: 15.0, bottom: 5),
                              child: subTitleText("Primary Diagnosis", context, 12),
                            )
                            : const SizedBox.shrink(),
                      widget.show == true ?
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0, bottom: 10),
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(color: Theme.of(context).colorScheme.fontClr,)
                                ),
                                height: 50,
                                width: MediaQuery.of(context).size.width,
                                child:
                                // dropdownValue != null ?
                                DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(

                                    value: dropdownValue,
                                    icon: const Icon(Icons.keyboard_arrow_down_rounded,
                                    color: colors.secondary,),
                                    elevation: 16,
                                    style:  TextStyle(color: Theme.of(context).colorScheme.fontClr,fontWeight: FontWeight.bold),
                                    underline: Container(
                                      // height: 2,
                                      color: Colors.black54,
                                    ),
                                    onChanged: (String? value) {
                                      // This is called when the user selects an item.
                                      setState(() {
                                        dropdownValue = value!;
                                      });
                                    },
                                    items: items
                                        .map<DropdownMenuItem<String>>((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ),
                                )
                                // : Text("Job Type",
                                // style: TextStyle(
                                //   fontSize: 12,
                                //   color: Theme.of(context).colorScheme.fontClr
                                // ),),
                              ),
                            )
                          : const SizedBox.shrink(),
                            const SizedBox(
                              height: 15,
                            ),
                           subTitleText("Description", context, 12),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                                padding: const EdgeInsets.all(12),
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height * .23,
                                decoration: BoxDecoration(
                                    color: Theme.of(context).colorScheme.simmerBase,
                                    borderRadius: BorderRadius.circular(10)),
                                child:  Center(
                                    child: Text(
                                      "Lorem Ipsum is simply dummy text of the Lorem Ipsum is simply dummy text of the and typesetting industry . Lorem Ipsum Lorem Ipsum is simply dummy text of the Lorem Ipsum is simply dummy text of the Lorem Ipsum is simply",
                                      maxLines: 6,
                                      style: TextStyle(
                                          color: Theme.of(context).colorScheme.fontColor,
                                          fontSize: Platform.isAndroid ?  13 : 15,
                                          height: 2),
                                    ))),
                            widget.show ==  true ?
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 30,
                                bottom: 15
                              ),
                              child: AppBtn(
                                onPress: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> AddVisitHistory()));
                                },
                                title: "Add Session Details",
                                width: MediaQuery.of(context).size.width,
                                height: 45,
                                fSize: 18,
                              ),
                            )
                            : const SizedBox.shrink(),
                            widget.show ==  true ?
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  AppBtn(
                                    onPress: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=> AddSchedule()));
                                    },
                                    title: "Add Schedule",
                                    width: MediaQuery.of(context).size.width/2.5,
                                    height: 45,
                                    fSize: 18,
                                  ),
                                  AppBtn(
                                    onPress: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=> ViewSchedule()));
                                    },
                                    title: "View Schedule",
                                    width: MediaQuery.of(context).size.width/2.5,
                                    height: 45,
                                    fSize: 18,
                                  )
                                ],
                              ),
                            )
                              : const SizedBox.shrink(),
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
                        child:  Image.asset("assets/images/profile3.png")
                        // Text(
                        //   "JW",
                        //   style: TextStyle(
                        //       color: Theme.of(context).colorScheme.secColor,
                        //       fontSize: 35,
                        //       fontWeight: FontWeight.w500),
                        // ),
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

