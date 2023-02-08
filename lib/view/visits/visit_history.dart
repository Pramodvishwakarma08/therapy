import 'package:flutter/material.dart';
import 'package:therapy/Helper/card_widgets.dart';
import 'package:therapy/Helper/colors.dart';
import 'package:therapy/Helper/widgets.dart';
import 'package:therapy/view/appBar/appBar.dart';
import 'package:therapy/view/buttons/appButton.dart';
import 'package:therapy/view/notes/add_notes.dart';
import 'package:therapy/view/notes/view_notes.dart';
import 'package:therapy/view/profile_details.dart';
import 'package:therapy/view/visits/add_visit_history.dart';

class Visits extends StatelessWidget {
  final model;
  final  i;
  Visits({Key? key, this.model, this.i}) : super(key: key);


  List<Map<String, dynamic>> jobs = [
    {"time": "9am to 1pm", "day": "Mon", "hours": "4 hrs", "date": "08 July 2022"},
    {"time": "9am to 1pm", "day": "Tue", "hours": "6 hrs", "date": "09 July 2022"},

  ];

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: customAppBar("Visit History", context),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.end,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 15,),
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: const DecorationImage(
                          image: AssetImage(
                              'assets/images/people1.png'
                          )
                      )
                  ),
                ),
                const  Padding(
                  padding:  EdgeInsets.only(top: 8.0),
                  child:  Text("John Wick",
                    style:  TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,color: colors.subTxtClr
                    ),),
                ),
                Container(
                  height: 30,
                  child: TextButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> ProfileDetails()));
                      },
                      child:
                       Text("View Profile",style:
                      TextStyle(
                          fontSize: 14,
                          decoration: TextDecoration.underline,
                          color: Theme.of(context).colorScheme.secColor,
                        fontWeight: FontWeight.w600,
                      ),)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    subTitleText("Total Days", context, 14),
                    const Text("15",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,color: colors.subTxtClr
                      ),)
                  ],
                ),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    subTitleText("Total Hours", context, 14),
                    const Text("100 hours",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,color: colors.subTxtClr
                      ),)
                  ],
                ),
                const SizedBox(height: 10,),
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: jobs.length,
                    itemBuilder: (context, index){
                      return jobDetailsCard(context, jobs, index, (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ViewNotes(isAdd: true,)));
                      },
                      false);
                    }),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 15),
                  child: AppBtn(
                    onPress: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> AddVisitHistory()));
                    },
                    title: "Add Visit History",
                    width: MediaQuery.of(context).size.width,
                    height: 45,
                    fSize: 16,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
